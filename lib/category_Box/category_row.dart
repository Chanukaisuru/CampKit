import 'package:flutter/material.dart';
import 'category_button.dart';
import 'package:campkit/category_pages/other.dart';
import 'package:campkit/category_pages/tent.dart';


class CategoryRow extends StatefulWidget {
  const CategoryRow({Key? key}) : super(key: key);

  @override
  _CategoryRowState createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  String _selectedCategory = "Populer";

  void _navigateToPage(String category) {
    switch (category) {
      case "Tent":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TentPage()),
        );
        break;
      case "Other":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OtherPage()),
        );
        break;
      // Add other cases if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ["Populer", "Tent", "Backpack", "Cooking Item", "Other"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return CategoryButton(
            label: category,
            isSelected: _selectedCategory == category,
            onPressed: () {
              setState(() {
                _selectedCategory = category;
              });
              _navigateToPage(category); // Navigate to the appropriate page
            },
          );
        }).toList(),
      ),
    );
  }
}
