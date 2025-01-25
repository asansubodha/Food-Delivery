class Food {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final FoodCategory category;
  final List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

//food category
enum FoodCategory {
  FriedRice,
  KottuRoti,
  Noddles,
  desserts,
  Drinks,
}

//food addons
class Addon {
  final String name;
  final double price;

  Addon({required this.name, required this.price});
}
