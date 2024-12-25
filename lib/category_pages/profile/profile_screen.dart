import 'package:flutter/material.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:campkit/bottom_navigation_bar/navigation_helper.dart';
import 'components/body.dart';

class ProfileScreen extends StatefulWidget {
  final String initialCategory;
  const ProfileScreen({super.key, required this.initialCategory});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),

      /* --------------Body-------------- */
      body: Body(),

      /* --------------Bottom Navigation Bar-------------- */
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          NavigationHelper.onNavBarItemTapped(context, index, _selectedIndex);
        },
       ),
    );
  }
}
