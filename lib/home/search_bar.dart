import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;

  const SearchBar({
    Key? key,
    this.hintText = "Search here",
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              'assets/icon/search.png',
              width: 20,
              height: 20,
              color: const Color.fromARGB(255, 121, 120, 120),
              fit: BoxFit.contain,
            ),
          ),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
