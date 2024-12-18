class Other {
  final String imageUrl;
  final String name;
  final String description;
  final int price;

  Other({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });
}

final List<Other> others = [
  Other(imageUrl: 'assets/image/other1.jpg', name: 'Sleeping Bag', description: 'All-weather comfort', price: 300, ),
  Other(imageUrl: 'assets/image/other2.jpg', name: 'Camping Mat', description: 'Foldable outdoor mat', price: 150, ),
  Other(imageUrl: 'assets/image/other3.png', name: 'Camping Chair', description: 'Lightweight foldable chair', price: 200, ),
  Other(imageUrl: 'assets/image/other4.png', name: 'Camping Table', description: 'Portable dining table', price: 350, ),
  Other(imageUrl: 'assets/image/other5.png', name: 'Cooler', description: 'Keeps food and drinks cold', price: 400, ),
  Other(imageUrl: 'assets/image/other6.jpg', name: 'First Aid Kit', description: 'Emergency medical supplies', price: 120, ),
  Other(imageUrl: 'assets/image/other7.jpg', name: 'Hammock', description: 'Lightweight outdoor hammock', price: 250, ),
  Other(imageUrl: 'assets/image/other8.jpg', name: 'Multi-Tool', description: 'Versatile outdoor tool', price: 180, ),
];