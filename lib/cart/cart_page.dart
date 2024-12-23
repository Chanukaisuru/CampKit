import 'package:flutter/material.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/category_pages/tent/tent.dart';
import 'package:campkit/home/home_page.dart';

class MyCartPage extends StatefulWidget {
  final String initialCategory;

  const MyCartPage({super.key, required this.initialCategory});

  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  int _selectedIndex = 2;

  void _onNavBarItemTapped(int index) {
    if (_selectedIndex == index) return; // Prevent navigation to the same page.

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TentPage(initialCategory: "Tent")),
        );
        break;
      case 2:
        // Stay on the CartPage.
        break;
      case 3:
        // Navigate to the Profile page or other pages if implemented.
        break;
    }
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
              /*--------------Back icon--------------*/
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

                  /*--------------Title--------------*/
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
              /*--------------Cart items--------------*/
              Expanded(
                child: ListView(
                  children: [
                     CartItem(
                      image: 'assets/image/4person.jpg',
                      title: '4 person tent',
                      subtitle: 'with rain cover\nRs.500/- per day',
                      price: 500,
                    ),

                    SizedBox(height: 16),
                    CartItem(
                      image: 'assets/image/4person.jpg',
                      title: 'Gas Canister', 
                      subtitle: 'Can cook 2 hours',
                      price: 1000
                    ),                   
                  ],
                ),
              ),

              /*-------------Action:selleact all and Delete----------------- */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                      
                    child: Text('Select All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),

                    ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Delete',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
                  
              ),

              /*----------------Price summary-------------------- */

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
                children: [
                  SummaryRow(label: 'Price',value:'Rs.1500'),
                  SummaryRow(label: 'Discount', value: 'Rs.0'),
                  SummaryRow(label: 'Total Price', value: 'Rs.1500',isBold:true,), 
                ],
              ),
              ), 

              /*-----------------Checkout button----------------- */
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Checkout',
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
      /*------------------Bottom navigation bar------------------*/
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarItemTapped,
      ),
    );
  }
}


/* ----------cart item Widget--------------- */

class CartItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final int price;

  const CartItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Checkbox
          Checkbox(value: true, onChanged: (value) {}),

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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/icon/remove.png',
                        width: 35,
                        height: 35,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      '1',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/icon/add.png',
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*-----------------Summary row widget----------------- */

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