import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        _buildNavBarItem(
          iconPath: 'assets/icon/home.png',
          label: 'Home',
          isSelected: currentIndex == 0,
        ),
        _buildNavBarItem(
          iconPath: 'assets/icon/search.png',
          label: 'Search',
          isSelected: currentIndex == 1,
        ),
        _buildNavBarItem(
          iconPath: 'assets/icon/cart.png',
          label: 'Cart',
          isSelected: currentIndex == 2,
        ),
        _buildNavBarItem(
          iconPath: 'assets/icon/user.png',
          label: 'Profile',
          isSelected: currentIndex == 3,
        ),
      ],
      backgroundColor: const Color.fromARGB(221, 255, 255, 255),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    );
  }

  BottomNavigationBarItem _buildNavBarItem({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF277A8C) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          iconPath,
          height: 24,
          width: 24,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}
