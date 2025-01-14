import 'package:flutter/material.dart';
import '../tent/tent_data.dart';
import '../tent/tent_card.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/category_Box/category_row.dart';
import 'package:campkit/home/search_bar.dart' as custom;
import 'package:campkit/bottom_navigation_bar/navigation_helper.dart';

class TentPage extends StatefulWidget {
  final String initialCategory;

  const TentPage({super.key, required this.initialCategory});

  @override
  // ignore: library_private_types_in_public_api
  _TentPageState createState() => _TentPageState();
}

class _TentPageState extends State<TentPage> {
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
              

              /*---------------------tent card-------------------------- */
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.59, // change card hight
                  ),
                  itemCount: tents.length,
                  itemBuilder: (context, index) {
                    final tent = tents[index];
                    return TentCard(
                      imageUrl: tent.imageUrl,
                      name: tent.name,
                      capacity: tent.capacity,
                      pricePerDay: tent.price,
                      description: tent.description,
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
        onTap: (index) => NavigationHelper.onNavBarItemTapped(context, index, _selectedIndex),
         
      ),
    );
  }

}
