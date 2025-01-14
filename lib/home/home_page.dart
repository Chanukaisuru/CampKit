import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/category_pages/back%20packs/backpacks_main.dart';
import 'package:flutter/material.dart';
import 'package:campkit/category_Box/category_row.dart';
import 'package:campkit/home/search_bar.dart' as custom;
import 'package:campkit/bottom_navigation_bar/navigation_helper.dart';
import 'package:campkit/category_pages/populer/populer_data.dart';
import 'package:campkit/category_pages/populer/populer_card.dart';



void main() {
  runApp(CampKitApp());
}



class CampKitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/home',

      routes:{
        '/home':(context) =>HomePage(),
        '/backpacks':(context) =>BackpacksMain(initialCategory: 'All'),
        
        
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _adController = PageController();
  int _currentAdIndex = 0;

  final List<String> _ads = [
    'assets/image/ad1.jpeg',
    'assets/image/ad2.jpeg',
    'assets/image/ad3.jpeg',
  ];

  final int _selectedIndex = 0;

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Chanuka",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            
                          ),
                        ),
                        Text(
                          "Welcome to CampKit",
                          style: TextStyle(
                            fontSize: 16,
                             
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Profile image
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFF277A8C), 
                        width: 3,           
                      ),
                    ),

                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/image/userimage.jpeg'), 
                    ),
                  ),
                ],
              ),  

              // Search bar
              const SizedBox(height: 20),
              custom.SearchBar(
                onChanged: (value) {
                  // Handle search input
                  print("Search input: $value");
                },
              ),

              // Add Bar
              SizedBox(height: 20),
              SizedBox(
                height: 200,  
                child: PageView.builder(
                  controller: _adController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentAdIndex = index;
                    });
                  },
                        itemCount: _ads.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              _ads[index],
                              fit: BoxFit.cover,
                              height: 100,
                              width: double.infinity,
                              ),
                            );
                        },
                ),
              ),

              // Dots Indicator
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _ads.length,
                  (index)=>Container(
                    margin:EdgeInsets.symmetric(horizontal: 4),
                    width: _currentAdIndex == index ? 10:8,
                    height: _currentAdIndex == index ? 10:8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentAdIndex == index
                       ?Color(0xFF277A8C) : Colors.grey,
                    ),
                  ),
                ),
              ),

              // Category bar
              SizedBox(height: 20),
              const CategoryRow(selectedCategory: "Popular"),
              const SizedBox(height: 20),
                // Popular section
                
                Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 1.8,
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

      // Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) => NavigationHelper.onNavBarItemTapped(context, index, _selectedIndex),
      ),

    );
  }    
}


