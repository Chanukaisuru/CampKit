import 'package:campkit/cart/cart_page.dart';
import 'package:flutter/material.dart';
import '../back packs/backpacks_card.dart';
import '../back packs/backpacks_data.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/category_Box/category_row.dart';
import 'package:campkit/home/search_bar.dart' as custom;
import 'package:campkit/home/home_page.dart';


class BackpacksMain extends StatefulWidget {
  final String initialCategory;

  const BackpacksMain({super.key, required this.initialCategory});

  @override
  
  _BackpackMainState createState() => _BackpackMainState();
}

class _BackpackMainState extends State<BackpacksMain> {
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
        // Stay on TentPage
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

              /*--------------back icon-------------- */
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

              /*------------End of the back icon--------------- */
                  
                  
                  const SizedBox(width: 10,),
                  const Text(
                    'Available Backpacks',
                    style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              
              
              /*---------------category bar--------------------- */
              const SizedBox(height: 10),
              SizedBox(height: 20),
               CategoryRow(selectedCategory: widget.initialCategory),

              /*end category bar */


              
              /*-----------------Search bar-------------------*/

              
              const SizedBox(height: 20),
              custom.SearchBar(
                onChanged: (value) {
                  // Handle search input
                  print("Search input: $value");
                },
              ),

              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.50, // change card hight
                  ),
                  itemCount: tents.length,
                  itemBuilder: (context, index) {
                    final backpack = tents[index];
                    return BackpacksCard(
                      imageUrl: backpack.imageUrl,
                      name: backpack.name,
                      capacity: backpack.capacity,
                      pricePerDay: backpack.price,
                      description: backpack.description,
                      onAddToCart: () {
                        // ignore: avoid_print
                        print('Added ${backpack.capacity} to cart');
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
