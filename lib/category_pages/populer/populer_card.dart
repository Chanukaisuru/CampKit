import 'package:flutter/material.dart';

class PopulerCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String? capacity;
  final int pricePerDay;
  final String? description;
  final VoidCallback onAddToCart;

  const PopulerCard({
    required this.imageUrl,
    required this.name,
    this.capacity,
    required this.pricePerDay,
    this.description,
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
                height: 87,
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
            ),

            // Capacity
            const SizedBox(height: 5),
            if(capacity !=null)
            Text(
              capacity!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            
            // Description
            const SizedBox(height: 5),
            if(description !=null)
            
            Text(
              description!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            // Price
            const SizedBox(height: 5),
            Text(
              'Rs. $pricePerDay/- per day',
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
