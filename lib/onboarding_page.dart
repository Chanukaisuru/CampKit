import 'package:flutter/material.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/OnbordingPage_image.jpeg",
                width: 400,
                height: 400,
              ),

              SizedBox(height: 20),
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