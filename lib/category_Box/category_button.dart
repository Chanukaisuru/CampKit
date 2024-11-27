import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? const Color.fromARGB(255, 167, 73, 19) : Colors.transparent,
          side: BorderSide(color: Colors.green),
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
