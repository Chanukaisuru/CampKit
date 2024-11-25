import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
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
                  _buildTextField('Name', 'ex: Chanuka Isuru', false),
                  SizedBox(height: 16,),
                  _buildTextField('Email', 'ex: chanukaisuru@gmail.com', false),
                  SizedBox(height: 16,),
                  _buildTextField('Password', '********', false),

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
                      )
                       ),
                 )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(String label, String hint, bool obscureText) {
  return TextField(
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: label,
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