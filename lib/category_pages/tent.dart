import 'package:campkit/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';

class TentPage extends StatefulWidget {
  const TentPage({super.key});

  @override
  _TentPageState createState() => _TentPageState();
}

class _TentPageState extends State<TentPage> {
  int _selectedIndex = 0;

  void _onNavBarItemTapped(int index) {
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
      // Add cases for other indices if navigation to different pages is required.

      case 1:
        // Stay on the TentPage
        break;
      case 2:
        // Navigate to CartPage (create if necessary)
        break;
      case 3:
        // Navigate to ProfilePage (create if necessary)
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
            children:  const [
              Text('Available Tents',
              style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),

      /*-----------------bottom navigation bar------------------ */
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarItemTapped,
      ),
    );
  }
}
