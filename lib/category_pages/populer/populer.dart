import 'package:flutter/material.dart';
import '../populer/populer_data.dart';
import '../populer/populer_card.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/category_Box/category_row.dart';
import 'package:campkit/home/search_bar.dart' as custom;
import 'package:campkit/bottom_navigation_bar/navigation_helper.dart';

class PopulerPage extends StatefulWidget {
  final String initialCategory;

  const PopulerPage({super.key, required this.initialCategory});

  @override
  // ignore: library_private_types_in_public_api
  _PopulerPageState createState() => _PopulerPageState();
}

class _PopulerPageState extends State<PopulerPage> {
  int _selectedIndex = 1;

  

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
                  itemCount: populers.length,
                  itemBuilder: (context, index) {
                    final populer = populers[index];
                    return PopulerCard(
                      imageUrl: populer.imageUrl,
                      name: populer.name,
                      capacity: populer.capacity,
                      pricePerDay: populer.price,
                      description: populer.description,
                      onAddToCart: () {
                        // ignore: avoid_print
                        print('Added ${populer.capacity} to cart');
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
