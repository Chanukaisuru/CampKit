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
  CookingItem(imageUrl: 'assets/image/item1.jpg', name: 'Cooking Pot', description: 'A large pot for cooking', price: 200, ),
  CookingItem(imageUrl: 'assets/image/item2.png', name: 'Grill Set', description: 'Grill for outdoor cooking', price: 500, ),
  CookingItem(imageUrl: 'assets/image/item3.jpg', name: 'Knife Set', description: 'Stainless steel knives', price: 300, ),
  CookingItem(imageUrl: 'assets/image/item4.jpg', name: 'Cutting Board', description: 'Cutting board for food preparation', price: 100, ),
  CookingItem(imageUrl: 'assets/image/item5.jpg', name: 'Cast Iron Skillet', description: 'Heavy-duty skillet for frying', price: 100, ),
];