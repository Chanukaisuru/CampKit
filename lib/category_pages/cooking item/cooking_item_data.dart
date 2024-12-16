class CookingItem {
  final String imageUrl;
  final String name;
  final String description;
  final int price;

  CookingItem({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });
}

List<CookingItem> cookingItems = [
  CookingItem(imageUrl: 'assets/image/item1.jpg', name: 'Cooking Pot', description: 'A large pot for cooking', price: 1200, ),
  CookingItem(imageUrl: 'assets/image/item2.jpg', name: 'Grill Set', description: 'Grill for outdoor cooking', price: 1500, ),
  CookingItem(imageUrl: 'assets/image/item3.jpg', name: 'Knife Set', description: 'High-quality stainless steel knives.', price: 1500, ),
  CookingItem(imageUrl: 'assets/image/item4.jpg', name: 'Cutting Board', description: 'Wooden cutting board for food prep.', price: 800, ),
  CookingItem(imageUrl: 'assets/image/item5.jpg', name: 'Cast Iron Skillet', description: 'Heavy-duty skillet for frying.', price: 2000, ),
];