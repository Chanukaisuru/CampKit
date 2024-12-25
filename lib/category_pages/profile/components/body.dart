import 'package:flutter/material.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 20),
        ProfileMenu(icon:'assets/icon/user.png', text: 'My Account', press: () {}),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key ? key,
     required this.text,
     required this.icon,
     required this.press,
  }):super (key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          backgroundColor: Color(0xFFF5F6F9), // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 22,
              color: Colors.red,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.black), // Text color
              ),
            ),
    
            Image.asset('assets/icon/next.png'),
          ],
        ),
      ),
    );
  }
}
