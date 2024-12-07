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
  Tent(imageUrl: 'assets/image/4person.jpg', name: 'Manual Tent', capacity: '4 Person ', price: 500, description: 'with rain cover'),
  Tent(imageUrl: 'assets/image/6person.jpeg', name: 'Auto Tent', capacity: '6 Person', price: 800, description: 'with rain cover'),
  Tent(imageUrl: 'assets/image/8person.jpeg', name: 'Manual Tent', capacity: '8 Person ', price: 1100, description: 'with rain cover'),
  Tent(imageUrl: 'assets/image/10person.jpeg', name: 'Manual Tent', capacity: '10 Person ', price: 1600),
  Tent(imageUrl: 'assets/image/bell_tent.jpg', name: 'Manual Tent', price: 4000),
];
