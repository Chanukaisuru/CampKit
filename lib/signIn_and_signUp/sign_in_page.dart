import 'package:campkit/home/home_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscurePassword = true; // State variable to manage password visibility


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  SizedBox(height: 30),
                  Image.asset('assets/image/signInPage_image.jpeg',height: 150),
                  SizedBox(height: 20),
                  Text('Create Your Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),

                  SizedBox(height: 20),

                  
                  //email field
                   Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  _buildTextField( 'chanukaisuru@gmail.com', false),
                  SizedBox(height: 16,),
                  

                  //password field
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  _buildPasswordField(),
                  SizedBox(height: 20),


                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                   MaterialPageRoute(builder: (context) =>CampKitApp(),
                   ),
                   );
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color(0xFF277A8C),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ), 
                    child: Center(
                      child: Text('Sign up',
                      style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 20),

                  Text('or Sign up with',
                  style: TextStyle(fontSize: 16),
                  ),

                  SizedBox(height: 20),

                  //social meadia icons

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon('assets/icon/google.png'),
                      SizedBox(width: 25),

                      _buildSocialIcon('assets/icon/facebook.png'),
                      SizedBox(width: 25),

                      _buildSocialIcon('assets/icon/apple.png'),
                      SizedBox(width: 25),
                      
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an Account?',
                      style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 2),
                      GestureDetector(
                        onTap: (){
                          //navigation path
                        },

                        child: Text('sign in',
                        style: TextStyle(fontSize: 16,color:Colors.blue),
                        
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

  // Password field with custom eye icon toggle
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
            color: const Color(0x99277A8C),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color(0xFFF2A81D),
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


    // social meadia icon function
    Widget _buildSocialIcon(String assetPath){
    return GestureDetector(
      onTap:(){
        //Handle social login
      },

      child: Image.asset(
        assetPath,
        height: 40,
      ),
    );
  }
}

//text feild function
Widget _buildTextField( String hint, bool obscureText) {
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
          color: const Color(0x99277A8C), // Set color for enabled state
          width: 1.0,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: const Color(0xFFF2A81D), // Set color for focused state
          width: 2.0,
        ),
      ),
      
    ),
  );

}