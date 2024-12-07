class Tent {
  final String imageUrl;
  final String name;
  final String? capacity;
  final int price;
  final String? description;

  Tent({
    required this.imageUrl,
    required this.name,
    this.capacity,
    required this.price,
    this.description,

  });
}

final List<Tent> tents = [
  Tent(imageUrl: 'assets/image/backpack1.jpg', name: 'Hydration Pack', capacity: '3L ', price: 500),
  Tent(imageUrl: 'assets/image/backpack2.jpg', name: 'Camping Backpack', capacity: '70L', price: 800 ),
  Tent(imageUrl: 'assets/image/backpack3.jpg', name: 'Hiking Backpack', capacity: '80L ', price: 1000),
  Tent(imageUrl: 'assets/image/backpack4.jpg', name: 'Travel Backpck', capacity: '50L ', price: 700),
  Tent(imageUrl: 'assets/image/backpack5.jpg', name: 'Traveling Backpack', capacity: '30L ',price: 500),
  Tent(imageUrl: 'assets/image/backpack6.jpg', name: 'Packing Cubes',  price: 500, description: '8 packs set'),
  Tent(imageUrl: 'assets/image/backpack7.jpg', name: 'Waist Bag',  price: 800, description: 'WaterProof'),
];
