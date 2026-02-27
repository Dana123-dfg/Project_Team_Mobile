class Category {
  final String id;
  final String name;
  final String imagePath;

  Category({required this.id, required this.name, required this.imagePath});
}

var categories = [
  Category(id: 'food', name: 'Foods', imagePath: 'assets/images/528x525.png'),
  Category(
    id: 'drink',
    name: 'Drinks',
    imagePath:
        'assets/images/pngtree-the-ultimate-guide-to-homemade-fruit-juices-png-image_13014022.png',
  ),
  Category(
    id: 'snack',
    name: 'Snacks',
    imagePath:
        'assets/images/tasty-fast-food-combo-with-burger-fries-and-fried-chicken-png.png',
  ),
  Category(
    id: 'dessert',
    name: 'Dessert',
    imagePath:
        'assets/images/pngtree-bakery-shop-desserts-sweet-cakes-and-cookies-png-image_15121469.png',
  ),
];
