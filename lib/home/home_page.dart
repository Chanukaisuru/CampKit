import 'dart:ui';

import 'package:flutter/material.dart';

void main(){
  runApp(CampKitApp());
}

class CampKitApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      home:HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Greeting Column + Profile Image
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Chanuka", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      Text("Welcome to CampKit", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image/userimage.jpeg'), // Replace with your profile image asset
                ),
              ],
            ),
          ],
        ),
      ),
    );
    
  }         
}