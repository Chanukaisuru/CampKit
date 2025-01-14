import 'package:campkit/category_pages/back%20packs/backpacks_main.dart';
import 'package:campkit/category_pages/cooking%20item/cooking_item_page.dart';
import 'package:campkit/category_pages/light/light_page.dart';
import 'package:campkit/category_pages/other/other_page.dart';
import 'package:flutter/material.dart';
import 'category_button.dart';
import 'package:campkit/category_pages/tent/tent.dart';
import 'package:campkit/category_pages/populer/populer.dart';

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
  _selectedCategory = widget.selectedCategory;
}

  void _navigateToPage(String category) {
    switch (category) {
      case "Populer":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PopulerPage(initialCategory: category),
            ),
        );
        break;

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

      case "Cooking Item":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CookingItemPage(initialCategory: category),
            ),
        );
        break;

      case "Light":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LightPage(initialCategory: category),
          ),
        );
        break;

      case "Other":
        Navigator.push(
          context,
          MaterialPageRoute
            (builder: (context) => OtherPage(initialCategory: category)),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ["Popular", "Tent", "Backpack", "Cooking Item", "Light", "Other"];

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
              _navigateToPage(category);
            },
          );
        }).toList(),
      ),
    );
  }
}