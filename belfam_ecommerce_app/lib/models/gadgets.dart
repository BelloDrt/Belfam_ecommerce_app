// gadgeet item
class Gadget {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final GadgetCategory category;
  List<Addon> availableAddons;

  Gadget({
   required this.name,
   required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,

});
}

// gadget categories
enum GadgetCategory {
  apple,
  android,
  clones,
  Pouch,
  others,
}

//gadget addons
class Addon{
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
});
}