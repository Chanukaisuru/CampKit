import 'package:flutter/material.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/category_Box/category_row.dart';
import 'package:campkit/home/search_bar.dart' as custom;
import 'cooking_item_card.dart';
import 'cooking_item_data.dart';
import 'package:campkit/bottom_navigation_bar/navigation_helper.dart';

class CookingItemPage extends StatefulWidget {
  final String initialCategory;

  const CookingItemPage({super.key, required this.initialCategory});

  @override
  // ignore: library_private_types_in_public_api
  _CookingItemPageState createState() => _CookingItemPageState();
}

class _CookingItemPageState extends State<CookingItemPage> {
  final int _selectedIndex = 1;


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

                  const SizedBox(width: 10),
                  const Text(
                    'Available Cooking Items',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              /*---------------category bar--------------------- */
              SizedBox(height: 20),
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

              /*---------------------cooking item card-------------------------- */
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.53, // change card height
                  ),
                  itemCount: cookingItems.length, // List of cooking items
                  itemBuilder: (context, index) {
                    final item = cookingItems[index];
                    return CookingItemCard(
                      imageUrl: item.imageUrl,
                      name: item.name,
                      pricePerDay: item.price,
                      description: item.description,
                      onAddToCart: () {
                        // ignore: avoid_print
                        print('Added ${item.name} to cart');
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
        onTap: (index) => NavigationHelper.onNavBarItemTapped(context, index, _selectedIndex),
      ),
    );
  }
}
