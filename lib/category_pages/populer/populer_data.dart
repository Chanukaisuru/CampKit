class Populer {
  final String imageUrl;
  final String name;
  final String? capacity;
  final int price;
  final String? description;

  Populer({
    required this.imageUrl,
    required this.name,
    this.capacity,
    required this.price,
    this.description,

  });
}

final List<Populer> populers = [
  Populer(imageUrl: 'assets/image/4person.jpg', name: 'Manual Tent', capacity: '4 Person ', price: 500, description: 'with rain cover'),
  Populer(imageUrl: 'assets/image/item1.jpg', name: 'Cooking Pot', description: 'A large pot for cooking', price: 200, ),
  Populer(imageUrl: 'assets/image/light1.jpg', name: 'LED Lantern', description: 'Bright and energy-efficient', price: 150,),
  Populer(imageUrl: 'assets/image/backpack2.jpg', name: 'Camping Backpack', capacity: '70L', price: 800 ),
  Populer(imageUrl: 'assets/image/6person.jpeg', name: 'Auto Tent', capacity: '6 Person', price: 800, description: 'with rain cover'),
];

