import 'package:campkit/category_pages/back%20packs/backpacks_main.dart';
import 'package:flutter/material.dart';
import 'category_button.dart';
import 'package:campkit/category_pages/other.dart';
import 'package:campkit/category_pages/tent/tent.dart';


class CategoryRow extends StatefulWidget {
  final String selectedCategory;
  const CategoryRow({super.key, required this.selectedCategory});

  @override
  _CategoryRowState createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  late String _selectedCategory ;

  @override
void initState() {
  super.initState();
  _selectedCategory = widget.selectedCategory; // Use the correct property
}

  void _navigateToPage(String category) {
    switch (category) {
      case "Tent":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TentPage(initialCategory: category),
            ),
        );
        break;

      case "Backpack":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BackpacksMain(initialCategory: category),
            ),
        );
        break;   
        
      case "Other":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OtherPage(initialCategory: category)),
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
