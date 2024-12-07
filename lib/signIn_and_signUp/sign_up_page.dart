import 'package:campkit/home/home_page.dart';
import 'package:campkit/signIn_and_signUp/sign_in_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true; // State variable to manage password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),

                  // Header Image
                  Image.asset('assets/image/signInPage_image.jpeg',
                      height: 150),
                  SizedBox(height: 20),

                  // Title
                  Text(
                    'Create Your Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Name Field
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  _buildTextField('Chanuka Isuru', false),
                  SizedBox(height: 16),

                  // Email Field
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  _buildTextField('chanukaisuru@gmail.com', false),
                  SizedBox(height: 16),

                  // Password Field
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  _buildPasswordField(),
                  SizedBox(height: 20),

                  // Sign Up Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CampKitApp(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF277A8C),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Social Media Login
                  Text(
                    'or Sign up with',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon('assets/icon/google.png', 48.0),
                      SizedBox(width: 25),
                      _buildSocialIcon('assets/icon/facebook.png', 35.0),
                      SizedBox(width: 25),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Sign In Navigation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an Account?',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ),
                          );
                        },
                        child: Text(
                          'sign in',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Password Field with Eye Icon Toggle
  Widget _buildPasswordField() {
    return TextField(
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        hintText: '********',
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.6),
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0x99277A8C),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xFFF2A81D),
            width: 2.0,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          child: Image.asset(
            _obscurePassword
                ? 'assets/icon/close_eye.png' // Custom icon for hidden password
                : 'assets/icon/open_eye.png', // Custom icon for visible password
            height: 20,
            color: Color.fromARGB(255, 124, 123, 123),
          ),
        ),
      ),
    );
  }

  /// Social Media Icon Widget with Custom Size
  Widget _buildSocialIcon(String assetPath, double size) {
    return GestureDetector(
      onTap: () {
        // Handle social login
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Image.asset(
          assetPath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  /// Text Field Widget
  Widget _buildTextField(String hint, bool obscureText) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.6),
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xFF277A8C),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xFFF2A81D),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
