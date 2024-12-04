import 'package:flutter/material.dart';
import 'package:campkit/home/home_page.dart';
import 'package:campkit/bottom_navigation_bar/bottom_navigation_bar.dart';

class TentPage extends StatefulWidget {
  const TentPage({super.key});

  @override
  _TentPageState createState() => _TentPageState();
}

class _TentPageState extends State<TentPage> {
  int _selectedIndex = 0;

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        // Stay on the TentPage
        break;
      case 2:
        // Navigate to CartPage (create if necessary)
        break;
      case 3:
        // Navigate to ProfilePage (create if necessary)
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String,dynamic>> tents = [
      {'image': 'assets/image/4person.jpg', 'capacity': '4 person tent', 'price': 500},
      {'image': 'assets/image/6person.jpeg', 'capacity': '6 person tent', 'price': 800},
      {'image': 'assets/image/8person.jpeg', 'capacity': '8 person tent', 'price': 1100},
      {'image': 'assets/image/10person.jpeg', 'capacity': '10 person tent', 'price': 1600},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tent',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Add categories row
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildCategoryChip('Tent', true),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Back Pack', false),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Cooking Item', false),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Other', false),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.75, // Adjust for height
                  ),
                  itemCount: tents.length,
                  itemBuilder: (context, index) {
                    final tent = tents[index];
                    return TentCard(
                      imageUrl: tent['image']as String,
                      capacity: tent['capacity']as String,
                      pricePerDay: tent['price'] as int,
                      onAddToCart: () {
                        // ignore: avoid_print
                        print('Added ${tent['capacity']} to cart');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarItemTapped,
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // Add logic for category selection if needed
        print('$label selected');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TentCard extends StatelessWidget {
  final String imageUrl;
  final String capacity;
  final int pricePerDay;
  final VoidCallback onAddToCart;

  const TentCard({
    required this.imageUrl,
    required this.capacity,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              capacity,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'with rain cover',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Rs. $pricePerDay/- per day',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
