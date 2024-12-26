import 'package:firebase_core/firebase_core.dart'; // Import Firebase core package
import 'package:flutter/material.dart';
import 'package:campkit/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding for async initialization
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnboardingPage(),
    );
  }
}
