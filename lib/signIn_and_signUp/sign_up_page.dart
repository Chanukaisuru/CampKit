import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
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
                  Image.asset('assets/image/signInPage_image.jpeg',height: 150),
                  SizedBox(height: 20),
                  Text('Create Your Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),

                  SizedBox(height: 20),

                  //Name field
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  _buildTextField( 'Chanuka Isuru', false),
                  SizedBox(height: 16,),
                  

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
                  _buildTextField( '********', false),

                  SizedBox(height: 20,),


                  ElevatedButton(
                    onPressed: (){
                      /**/ 
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon('assets/icon/google.png'),
                      SizedBox(width: 20),

                      _buildSocialIcon('assets/icon/facebook.png'),
                      SizedBox(width: 20),

                      _buildSocialIcon('assets/icon/apple.png'),
                      SizedBox(width: 20),
                      
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an Account?',
                      style: TextStyle(fontSize: 16),
                      ),

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
      suffixIcon: obscureText
        ?Icon(Icons.visibility_off,color: const Color.fromARGB(255, 124, 123, 123))
        :null,
    ),
  );

}