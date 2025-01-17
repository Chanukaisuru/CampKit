import 'package:flutter/material.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/category_Box/category_row.dart';
import 'package:campkit/home/search_bar.dart' as custom;
import 'other_card.dart';
import 'other_data.dart';
import 'package:campkit/bottom_navigation_bar/navigation_helper.dart';

class OtherPage extends StatefulWidget {
  final String initialCategory;

  const OtherPage({super.key, required this.initialCategory});

  @override
  // ignore: library_private_types_in_public_api
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
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
              // Back icon
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
                    'Other Equipment',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Category bar
              SizedBox(height: 20),
              CategoryRow(selectedCategory: widget.initialCategory),
              /* End category bar */

              // Search bar
              const SizedBox(height: 20),
              custom.SearchBar(
                onChanged: (value) {
                  // Handle search input
                  // ignore: avoid_print
                  print("Search input: $value");
                },
              ),

              // Other card
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: others.length,
                  itemBuilder: (context, index) {
                    final item = others[index];
                    return OtherCard(
                      imageUrl: item.imageUrl,
                      name: item.name,
                      description: item.description,
                      pricePerDay: item.price,
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