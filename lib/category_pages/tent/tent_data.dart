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
  Tent(imageUrl: 'assets/image/4person.jpg', name: 'manual tent', capacity: '4 person tent', price: 500),
  Tent(imageUrl: 'assets/image/6person.jpeg', name: 'manual tent', capacity: '6 person tent', price: 800),
  Tent(imageUrl: 'assets/image/8person.jpeg', name: 'manual tent', capacity: '8 person tent', price: 1100),
  Tent(imageUrl: 'assets/image/10person.jpeg', name: 'manual tent', capacity: '10 person tent', price: 1600),
];
