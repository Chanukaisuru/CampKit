import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
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
              const Row(
                children: [
                  // Column for greeting text
                  Expanded(
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
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/image/userimage.jpeg'), // Replace with your image asset
                  ),
                ],
              ),  

              /*--------Search bar----------*/
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
                    prefixIcon: Icon(Icons.search,color: Colors.black,),
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
            ],
          ),
        ),
      ),
    );
    
  }         
}