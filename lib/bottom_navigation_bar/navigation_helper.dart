import 'package:flutter/material.dart';
import 'package:campkit/home/home_page.dart';
import 'package:campkit/category_pages/tent/tent.dart';
import 'package:campkit/cart/cart_page.dart';
import 'package:campkit/category_pages/profile/profile_screen.dart';

class NavigationHelper {
  static void onNavBarItemTapped(
    BuildContext context,
    int index,
    int currentIndex,
  ) {
    if (index == currentIndex) return; // Prevent navigation to the same page.

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TentPage(initialCategory: "Tent")),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyCartPage(initialCategory: "Cart")),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  ProfileScreen(initialCategory: "Profile")),
        );
        break;
    }
  }
}
