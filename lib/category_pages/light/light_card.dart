import 'package:flutter/material.dart';

class LightCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final int price;
  final VoidCallback onAddToCart;

  const LightCard({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Card image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                height: 135,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Name
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),

            // Description
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),

            // Price
            const SizedBox(height: 5),
            Text(
              'Rs. $price/- per day',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Cart button
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF277A8C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}