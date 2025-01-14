import 'package:campkit/home/home_page.dart';
import 'package:campkit/signIn_and_signUp/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscurePassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? _errorMessage;

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

                  // Sign-in Page Image
                  Image.asset(
                    'assets/image/signInPage_image.jpeg',
                    height: 150,
                  ),
                  SizedBox(height: 20),

                  // Page Title
                  Text(
                    'Sign in Your Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Error Message
                  if (_errorMessage != null && _errorMessage!.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _errorMessage!,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),

                  // Email Field
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  _buildTextField('Email Address', _emailController, false),
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

                  // Sign-in Button
                  ElevatedButton(
                    onPressed: _signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF277A8C),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Social Media Login
                  Text(
                    'or Sign in with',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon('assets/icon/google.png', 48.0),
                      SizedBox(width: 25),
                      _buildSocialIcon('assets/icon/facebook.png', 35.0),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Sign-up Option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign up',
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

  /// Firebase Sign In Method
  Future<void> _signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // On successful sign in, navigate to the Home Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        // Update the error message with the exception message
        _errorMessage = e.message;
      });

      // Remove error message after 4 seconds
      Future.delayed(Duration(seconds: 4), () {
        setState(() {
          _errorMessage = null;
        });
      });
    }
  }

  /// Password Field with Eye Icon Toggle (Using Custom Icons)
  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
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
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Image.asset(
              _obscurePassword
                  ? 'assets/icon/close_eye.png'
                  : 'assets/icon/open_eye.png',
              width: 24, // Icon width
              height: 24, // Icon height
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
        ),
      ),
    );
  }

  /// Social Media Icon Widget
  Widget _buildSocialIcon(String assetPath, double size) {
    return GestureDetector(
      onTap: () {
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
  Widget _buildTextField(
      String hint, TextEditingController controller, bool obscureText) {
    return TextField(
      controller: controller,
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
