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
          child: const Column(
            children: [
              // First Row: Greeting and Profile Image
              Row(
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
                    backgroundImage: AssetImage('assets/user_profile.jpg'), // Replace with your image asset
                  ),
                ],
              ),
          ],
        ),
      ),
    ),
    );
    
  }         
}