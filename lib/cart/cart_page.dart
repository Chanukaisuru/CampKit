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

                  ],
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
      padding:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
            Checkbox(value: true, onChanged: (value) {}),
            Image.asset(image, width: 100, height: 100,fit: BoxFit.cover),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),    
                ],
              ),            
            ),

            /*Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, 
                    icon: Icon(Icons.remove_circle_outline, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),*/
        ],
      ),
    );
  }
}