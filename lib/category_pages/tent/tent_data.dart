class Tent {
  final String imageUrl;
  final String name;
  final String capacity;
  final int price;

  Tent({
    required this.imageUrl,
    required this.name,
    required this.capacity,
    required this.price,
  });
}

final List<Tent> tents = [
  Tent(imageUrl: 'assets/image/4person.jpg', name: 'Manual Tent', capacity: '4 Person ', price: 500),
  Tent(imageUrl: 'assets/image/6person.jpeg', name: 'Auto Tent', capacity: '6 Person', price: 800),
  Tent(imageUrl: 'assets/image/8person.jpeg', name: 'Manual Tent', capacity: '8 Person ', price: 1100),
  Tent(imageUrl: 'assets/image/10person.jpeg', name: 'Manual Tent', capacity: '10 Person ', price: 1600),
];

