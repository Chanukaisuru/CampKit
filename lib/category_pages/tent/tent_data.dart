class Tent {
  final String imageUrl;
  final String capacity;
  final int price;

  Tent({
    required this.imageUrl,
    required this.capacity,
    required this.price,
  });
}

final List<Tent> tents = [
  Tent(imageUrl: 'assets/image/4person.jpg', capacity: '4 person tent', price: 500),
  Tent(imageUrl: 'assets/image/6person.jpeg', capacity: '6 person tent', price: 800),
  Tent(imageUrl: 'assets/image/8person.jpeg', capacity: '8 person tent', price: 1100),
  Tent(imageUrl: 'assets/image/10person.jpeg', capacity: '10 person tent', price: 1600),
];
