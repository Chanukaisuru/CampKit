import 'package:flutter/material.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(       
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
                Image.asset(
                  'assets/image/OnbordingPage_image.jpeg', // Replace with your asset image
                  width: 400, // Adjust width if needed
                  height: 400, // Adjust height if needed
                ),
              
              SizedBox(height: 30),
              Text("CampKit",
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 36,
                color: Colors.orange,
              ),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}