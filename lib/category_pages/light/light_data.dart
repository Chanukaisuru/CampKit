class Light {
  final String imageUrl;
  final String name;
  final String description;
  final int price;

  Light({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });
}

final List<Light> lights = [
  Light(imageUrl: 'assets/image/light1.jpg', name: 'LED Lantern', description: 'Bright and energy-efficient', price: 150, ),
  Light(imageUrl: 'assets/image/light2.jpg', name: 'Portable Flashlight', description: 'Compact outdoor flashlight', price: 80, ),
  Light(imageUrl: 'assets/image/light3.jpg', name: 'Solar Lantern', description: 'Eco-friendly solar lantern', price: 200, ),
  Light(imageUrl: 'assets/image/light4.jpg', name: 'Headlamp', description: 'Hands-free adjustable light', price: 120, ),
];