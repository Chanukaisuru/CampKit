import 'package:flutter/material.dart';
import 'signIn_and_signUp/sign_up_page.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              ),

              SizedBox(height: 20),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text('Rent top-quality level gear for \nyour adventures. \nExplore, book, and get \nready to go!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
              ),
              ),

              SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) =>SignUpPage(),
                   ),
                   );
                },
               style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF277A8C),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Get Start',
                   style: TextStyle(
                   fontSize: 20,
                   color: Colors.white,
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