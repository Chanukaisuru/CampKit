import 'package:flutter/material.dart';
import '../tent/tent_data.dart';
import '../tent/tent_card.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/category_Box/category_row.dart';

class TentPage extends StatefulWidget {
  final String initialCategory;

  const TentPage({Key?key, required this.initialCategory}):super(key:key);

  @override
  _TentPageState createState() => _TentPageState();
}

class _TentPageState extends State<TentPage> {
  int _selectedIndex = 0;

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigation logic based on selected index
    switch (index) {
      case 0:
        Navigator.pop(context); // Example to go back to home page
        break;
      case 1:
        // Stay on TentPage
        break;
      case 2:
        // Navigate to CartPage (create it if necessary)
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
              const Text(
                'Available Tents',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              
              /*---------------category bar--------------------- */

              SizedBox(height: 20),
               CategoryRow(selectedCategory: widget.initialCategory),


              /*end category bar */

              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: tents.length,
                  itemBuilder: (context, index) {
                    final tent = tents[index];
                    return TentCard(
                      imageUrl: tent.imageUrl,
                      name: tent.name,
                      capacity: tent.capacity,
                      pricePerDay: tent.price,
                      onAddToCart: () {
                        // ignore: avoid_print
                        print('Added ${tent.capacity} to cart');
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
         onTap: _onNavBarItemTapped
         
      ),
    );
  }

}
