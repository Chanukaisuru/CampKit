import 'package:flutter/material.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/category_Box/category_row.dart';
import 'package:campkit/home/search_bar.dart' as custom;
import 'light_card.dart';
import 'light_data.dart';
import 'package:campkit/home/home_page.dart';
import 'package:campkit/cart/cart_page.dart';

class LightPage extends StatefulWidget {
  final String initialCategory;

  const LightPage({super.key, required this.initialCategory});

  @override
  // ignore: library_private_types_in_public_api
  _LightPageState createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  int _selectedIndex = 1;

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigation logic based on selected index
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
      // Stay on LightPage
        break;
      case 2:
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyCartPage(initialCategory: "Cart")),
        );
        break;
      case 3:
      // Navigate to ProfilePage (create it if necessary)
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
              /*--------------back icon and title-------------- */
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icon/left-arrow.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Available Lights',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              /*---------------category bar--------------------- */
              const SizedBox(height: 20),
              CategoryRow(selectedCategory: widget.initialCategory),
              /* End category bar */

              /*-----------------Search bar-------------------*/
              const SizedBox(height: 20),
              custom.SearchBar(
                onChanged: (value) {
                  // Handle search input
                  // ignore: avoid_print
                  print("Search input: $value");
                },
              ),

              /*---------------------Light card grid-------------------------- */
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.51, // Adjusts card height
                  ),
                  itemCount: lights.length, // List of lights
                  itemBuilder: (context, index) {
                    final light = lights[index];
                    return LightCard(
                      imageUrl: light.imageUrl,
                      name: light.name,
                      description: light.description,
                      price: light.price,
                      onAddToCart: () {
                        // ignore: avoid_print
                        print('Added ${light.name} to cart');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarItemTapped,
      ),
    );
  }
}