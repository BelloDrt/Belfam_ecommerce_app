import 'package:belfam_ecommerce_app/models/gadgets.dart';

class CartItem {
  Gadget gadget;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.gadget,
    required this.selectedAddons,
    this.quantity = 1,
});

  double get totalPrice {
    double addonsPrice = selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (gadget.price + addonsPrice) * quantity;
  }
}