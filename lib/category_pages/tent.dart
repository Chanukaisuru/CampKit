import 'package:campkit/home/home_page.dart';
import 'package:flutter/material.dart';
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
      // Add cases for other indices if navigation to different pages is required.

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text('Available Tents',
              style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Replace with the number of tents in your data
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: TentCard(
                        imageUrl: 'https://example.com/tent.jpg', // Replace with real image URL or use assets
                        capacity: '4 people',
                        pricePerDay: 500,
                        onAddToCart: () {
                          // Implement add to cart logic
                          print('Added tent $index to cart');
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      /*-----------------bottom navigation bar------------------ */
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarItemTapped,
      ),
    );
  }
}


class TentCard extends StatelessWidget{
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
  Widget build(BuildContext context){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),

      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 8),
          Text(
            capacity,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),

           SizedBox(height: 4),
            Text(
              'Rs. $pricePerDay / day',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 8),
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