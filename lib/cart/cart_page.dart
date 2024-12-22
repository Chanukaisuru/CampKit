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
              // Add cart-specific content here if needed.
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
