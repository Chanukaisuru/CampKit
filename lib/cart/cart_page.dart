import 'package:flutter/material.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/bottom_navigation_bar/navigation_helper.dart';

class MyCartPage extends StatefulWidget {
  final String initialCategory;

  const MyCartPage({super.key, required this.initialCategory});

  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  final int _selectedIndex = 2;

  // List of cart items with quantities
  List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/image/4person.jpg',
      'title': '4 Person Tent',
      'subtitle': 'with rain cover\nRs.500/- per day',
      'price': 500,
      'quantity': 1, // Initial quantity
    },
    {
      'image': 'assets/image/4person.jpg',
      'title': 'Gas Canister',
      'subtitle': 'Can cook 2 hours',
      'price': 1000,
      'quantity': 1, // Initial quantity
    },
  ];

  void removeCartItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void updateQuantity(int index, int delta) {
    setState(() {
      int newQuantity = cartItems[index]['quantity'] + delta;
      if (newQuantity > 0) {
        cartItems[index]['quantity'] = newQuantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*--------------Back icon and Title--------------*/
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icon/left-arrow.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'My Cart',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              /* --------------Cart Items Box-------------- */
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CartItem(
                            image: cartItems[index]['image'],
                            title: cartItems[index]['title'],
                            subtitle: cartItems[index]['subtitle'],
                            price: cartItems[index]['price'],
                            quantity: cartItems[index]['quantity'],
                            onRemove: () => removeCartItem(index),
                            onIncrease: () => updateQuantity(index, 1),
                            onDecrease: () => updateQuantity(index, -1),
                          ),
                          if (index != cartItems.length - 1)
                            SizedBox(height: 16),
                        ],
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 16),

              /* --------------Price Summary-------------- */
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    SummaryRow(label: 'Price', value: 'Rs.1500'),
                    SummaryRow(label: 'Discount', value: 'Rs.0'),
                    SummaryRow(label: 'Total Price', value: 'Rs.1500', isBold: true),
                  ],
                ),
              ),

              SizedBox(height: 16),

              /* --------------Checkout Button-------------- */
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /* --------------Bottom Navigation Bar-------------- */
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) => NavigationHelper.onNavBarItemTapped(context, index, _selectedIndex),
      ),
    );
  }
}

/* ----------Cart Item Widget--------------- */
class CartItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final int price;
  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image of the item
              Image.asset(
                image,
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 20),

              // Item description (title, subtitle, and actions)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),

                    // Subtitle
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Price
                    Text(
                      'Rs.$price/-',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 12),

                    // Add/Remove Icons and Quantity
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade400, width: 2),
                      
                        ),
                      
                      child:Row(
                       children: [
                        SizedBox(width: 16),
                        GestureDetector(
                          onTap: onDecrease,
                          child: Image.asset(
                                   'assets/icon/remove.png', // Path to your add icon
                                    height: 22,
                                    width: 22,
                                  ),
                        ),
                        
                        SizedBox(width: 16),
                        Text(
                          '$quantity',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        
                        SizedBox(width: 16),
                        GestureDetector(
                          onTap: onIncrease,
                          child: Image.asset(
                                    'assets/icon/add.png', // Path to your add icon
                                     height: 20,
                                    width: 20,
                                    ),
                        ),
                      ],
                    ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        // Close button (cross mark)
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: onRemove,
            child: Image.asset(
                            'assets/icon/delete.png',
                            width: 16,
                            height: 16,
                          ),
          ),
        ),
      ],
    );
  }
}



/* --------------Summary Row Widget--------------- */
class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
