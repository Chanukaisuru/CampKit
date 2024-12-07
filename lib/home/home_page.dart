import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/category_pages/tent/tent.dart';
import 'package:flutter/material.dart';
import 'package:campkit/category_Box/category_row.dart';


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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _adController = PageController();
  int _currentAdIndex = 0;

  final List<String> _ads = [
    'assets/image/ad1.jpeg', // Replace with your ad image paths
    'assets/image/ad2.jpeg',
    'assets/image/ad3.jpeg',
  ];

  int _selectedIndex = 0;

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Stay on the HomePage.
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TentPage(initialCategory: "Tent")),
        );
        break;
      // Add other cases for navigation.
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
            children: [
              // First Row: Greeting and Profile Image
              Row(
                children: [
                  // Column for greeting text
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


                  /*------------------Profile image--------------------*/
                  
                  Container(
                    padding: const EdgeInsets.all(2), // Space between the border and CircleAvatar
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



              /*-----------------Search bar-------------------*/

              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0,3),
                    ),
                  ]
                ),

                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search hear",
                    hintStyle: TextStyle(color: Colors.grey),
                    
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset('assets/icon/search.png',
                      width: 20,
                      height: 20,
                      color: const Color.fromARGB(255, 121, 120, 120),
                      
                      fit: BoxFit.contain,
                      ),
                    ),

                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.symmetric(vertical:16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ), 



              /*-----------------add bar------------ */

              SizedBox(height: 20),
              Container(
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
              


              /*------Dots Indicator-------------------- */

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
              


              /*---------------category bar--------------------- */

              SizedBox(height: 20),
              const CategoryRow(selectedCategory: "Popular"),

            ],
          ),
        ),
      ),


      /*-----------------bottom navigation bar------------------ */
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
         onTap: _onNavBarItemTapped
         
      ),

    );
  }    
}


