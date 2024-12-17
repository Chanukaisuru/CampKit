import 'package:flutter/material.dart';

class CookingItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String? description;
  final int pricePerDay;
  final VoidCallback onAddToCart;

  const CookingItemCard({
    required this.imageUrl,
    required this.name,
    this.description,
    required this.pricePerDay,
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
            /*------------card image-------------------- */
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                height: 125,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            /*-----------------name---------------------- */
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            /*-------------------description--------------------- */
            const SizedBox(height: 5),
            if (description != null)
              Text(
                description!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            /*---------------------price--------------------*/
            const SizedBox(height: 5),
            Text(
              'Rs. $pricePerDay/- per day',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            /*------------------------cart button----------------------- */
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF277A8C),
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
