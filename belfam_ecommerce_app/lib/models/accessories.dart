import 'package:belfam_ecommerce_app/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'gadgets.dart';

class Accessories extends ChangeNotifier {
  //list of gadgets menu
  final List<Gadget> _menu =[
    // android
    Gadget(
        name: "Android Charger",
        description: "A 25watt Fast charging android cable",
        imagePath: "lib/images/android/android_charger.png",
        price: 4000.00,
        category: GadgetCategory.android,
        availableAddons: [
          Addon(name: "Fast Charging", price: 4000.00),
          Addon(name: "25watt charger", price: 5000.00),
          Addon(name: "Type C cable", price: 6500.00),
        ],
    ),

    Gadget(
      name: "Android phone",
      description: "A Latest Smartphone",
      imagePath: "lib/images/android/android_phone.png",
      price: 90000.00,
      category: GadgetCategory.android,
      availableAddons: [
        Addon(name: "6GB Ram 64GB Rom", price: 90000.00),
        Addon(name: "8GB Ram 128GB Rom", price: 120000.00),
        Addon(name: "9GB Ram 256GB Rom", price: 150000.00),
      ],
    ),

    Gadget(
      name: "Android power bank",
      description: "A Durable Power Bank",
      imagePath: "lib/images/android/android_power.png",
      price: 20000.00,
      category: GadgetCategory.android,
      availableAddons: [
        Addon(name: "10,000 Mah Capacity", price: 13000.00),
        Addon(name: "20,000 Mah Capacity", price: 22000.00),
        Addon(name: "30,000 Mah Capacity", price: 45000.00),
      ],
    ),

    Gadget(
      name: "Ear Bud",
      description: "Bluetooth EarBud",
      imagePath: "lib/images/android/ear_bud.png",
      price: 10000.00,
      category: GadgetCategory.android,
      availableAddons: [
        Addon(name: "Durable for iphone and anndroid", price: 10000.00),
      ],
    ),

    Gadget(
      name: "Ear Bud super",
      description: "Super Bluetooth EarBud",
      imagePath: "lib/images/android/ear_bud_two.png",
      price: 15000.00,
      category: GadgetCategory.android,
      availableAddons: [
        Addon(name: "SuperBass for iphone and anndroid", price: 15000.00),
      ],
    ),


    // apple

    Gadget(
      name: "Apple Airpod",
      description: "Original Apple Airpod",
      imagePath: "lib/images/apple/apple_airpod.png",
      price: 80000.00,
      category: GadgetCategory.apple,
      availableAddons: [
        Addon(name: "Durable for iphone ", price: 80000.00),
        Addon(name: "Airpod Pro for iphone ", price: 140000.00),
        Addon(name: "Airpod Pro2 for iphone ", price: 210000.00),
      ],
    ),

    Gadget(
      name: "Apple Iphone",
      description: "Brand New Iphone",
      imagePath: "lib/images/apple/apple_iphone.png",
      price: 170000.00,
      category: GadgetCategory.apple,
      availableAddons: [
        Addon(name: "Iphone 12 128GB", price: 400000.00),
        Addon(name: "Iphone 13 128GB ", price: 630000.00),
        Addon(name: "Iphone 14 256GB ", price: 930000.00),
      ],
    ),

    Gadget(
      name: "Apple Magsafe",
      description: "Wireless apple magsafe power bank",
      imagePath: "lib/images/apple/apple_magsafe.png",
      price: 80000.00,
      category: GadgetCategory.apple,
      availableAddons: [
        Addon(name: "Apple magsafe white", price: 80000.00),
      ],
    ),

    Gadget(
      name: "Apple Mouse",
      description: "Apple magic mouse for MacBook",
      imagePath: "lib/images/apple/apple_mouse.png",
      price: 80000.00,
      category: GadgetCategory.apple,
      availableAddons: [
        Addon(name: "Apple magic mouse white", price: 160000.00),
      ],
    ),

    Gadget(
      name: "Apple Watch",
      description: "Apple Watch Series 6",
      imagePath: "lib/images/apple/apple_watch.png",
      price: 220000.00,
      category: GadgetCategory.apple,
      availableAddons: [
        Addon(name: "Apple watch with different band", price: 220000.00),
      ],
    ),


    // clones

    Gadget(
      name: "Airpod Clone",
      description: "Apple Airpod clone for iphone and android",
      imagePath: "lib/images/clones/airpod_clone.png",
      price: 10000.00,
      category: GadgetCategory.clones,
      availableAddons: [
        Addon(name: "Airpod clones super copy", price:10000.00),
      ],
    ),

    Gadget(
      name: "Android USB",
      description: "Android usb cable",
      imagePath: "lib/images/clones/android_usb.png",
      price: 2000.00,
      category: GadgetCategory.clones,
      availableAddons: [
        Addon(name: "Android usb cable for charging and file transfer", price:2000.00),
      ],
    ),

    Gadget(
      name: "Apple Charger Clone",
      description: "Apple Charger clone fast charge",
      imagePath: "lib/images/clones/charger.png",
      price: 3000.00,
      category: GadgetCategory.clones,
      availableAddons: [
        Addon(name: "Apple fast charger clone", price:3000.00),
      ],
    ),

    Gadget(
      name: "HeadPods Clone",
      description: "Apple headset clone",
      imagePath: "lib/images/clones/headpods_clone.png",
      price: 10000.00,
      category: GadgetCategory.clones,
      availableAddons: [
        Addon(name: "Headpods/Headset clones with super bass", price:10000.00),
      ],
    ),

    Gadget(
      name: "Studio Headphone Clone",
      description: "Studio beat by dre clone",
      imagePath: "lib/images/clones/top_headphone.png",
      price: 10000.00,
      category: GadgetCategory.clones,
      availableAddons: [
        Addon(name: "Beat by dre super clone with high bluetooth frequency connection", price:10000.00),
      ],
    ),

    // others
    Gadget(
      name: "Colored Power Bank",
      description: "fancy Power bank",
      imagePath: "lib/images/others/colored_pb.png",
      price: 10000.00,
      category: GadgetCategory.others,
      availableAddons: [
        Addon(name: "Colored and fancy portable power bank", price:10000.00),
      ],
    ),

    Gadget(
      name: "Earpod Case",
      description: "Nice Earpod case",
      imagePath: "lib/images/others/earpod_case.png",
      price: 5000.00,
      category: GadgetCategory.others,
      availableAddons: [
        Addon(name: "Colored and fancy portable power bank", price:5000.00),
      ],
    ),

    Gadget(
      name: "Fancy Power Bank two",
      description: "fancy Power bank with 3 usb",
      imagePath: "lib/images/others/fancy_pb.png",
      price: 12000.00,
      category: GadgetCategory.others,
      availableAddons: [
        Addon(name: "fancy poower bank with percentage reader", price:12000.00),
      ],
    ),

    Gadget(
      name: "Phone Stand",
      description: "Strong Phone Stand",
      imagePath: "lib/images/others/phone_stand.png",
      price: 4000.00,
      category: GadgetCategory.others,
      availableAddons: [
        Addon(name: "Different colors of phone stands", price:4000.00),
      ],
    ),

    Gadget(
      name: "Rosmos Power Bank",
      description: "Strong power Bank",
      imagePath: "lib/images/others/rosmos_pb.png",
      price: 32000.00,
      category: GadgetCategory.others,
      availableAddons: [
        Addon(name: "30000mah Rosmos durable power bank", price:32000.00),
      ],
    ),


    // pouch

    Gadget(
      name: "Phone Case",
      description: "fancy Phone case",
      imagePath: "lib/images/pouch/fancy_phone.png",
      price: 5000.00,
      category: GadgetCategory.Pouch,
      availableAddons: [
        Addon(name: "for iphone 11 to 13 series", price:5000.00),
      ],
    ),

    Gadget(
      name: "Iphone 12 Case",
      description: "Iphone 12 Phone case",
      imagePath: "lib/images/pouch/iphone_12.png",
      price: 5000.00,
      category: GadgetCategory.Pouch,
      availableAddons: [
        Addon(name: "for iphone 12 to 14 series", price:5000.00),
      ],
    ),

    Gadget(
      name: "Iphone 13",
      description: "Iphone 13 Phone case",
      imagePath: "lib/images/pouch/iphone_13.png",
      price: 5000.00,
      category: GadgetCategory.Pouch,
      availableAddons: [
        Addon(name: "for iphone 13 to 15 series", price:5000.00),
      ],
    ),

    Gadget(
      name: "Iphone 14",
      description: "Iphone 14 Phone case",
      imagePath: "lib/images/pouch/iphone_14.png",
      price: 5000.00,
      category: GadgetCategory.Pouch,
      availableAddons: [
        Addon(name: "for iphone 14 to 15 series", price:5000.00),
      ],
    ),

    Gadget(
      name: "Iphone X",
      description: "Iphone X series Phone case",
      imagePath: "lib/images/pouch/iphone_xcase.png",
      price: 5000.00,
      category: GadgetCategory.Pouch,
      availableAddons: [
        Addon(name: "for iphone X, XR, XS, XsMax", price:5000.00),
      ],
    ),


  ];

  /*

  GETTERS

   */
List<Gadget> get menu => _menu;
List<CartItem> get cart => _cart;


/*
OPERATIONS
 */

  // user cart
  final List<CartItem> _cart =[];

// add to cart
void addToCart(Gadget gadget, List<Addon> selectedAddons) {
  // see if there is a cart item with the same gadget and selected addons
  CartItem? cartItem = _cart.firstWhereOrNull((item) {
    // check if the gadget items are the same
    bool isSameGadget = item.gadget == gadget;

    //check if the list of selected addons are the same
    bool isSameAddons = const ListEquality().equals(
        item.selectedAddons, selectedAddons);

    return isSameGadget && isSameAddons;
  });

  //if item already exist, increase item quantity(count)
  if (cartItem != null) {
    cartItem.quantity++;
  }
  // otherwise, add a new cart item to the cart
  else {
    _cart.add(
      CartItem(
          gadget: gadget,
          selectedAddons: selectedAddons
      ),
    );
}
  notifyListeners();
}

// remove from cart
void removeFromCart(CartItem cartItem) {
  int cartIndex = _cart.indexOf(cartItem);

  if (cartIndex != -1) {
    if (_cart[cartIndex].quantity > 1) {
      _cart[cartIndex].quantity--;
    } else {
      _cart.removeAt(cartIndex);
    }
  }

  notifyListeners();
}

// get total price of cart
double getTotalPrice() {
  double total = 0.0;

  for (CartItem cartItem in _cart)  {
    double itemTotal = cartItem.gadget.price;

    for (Addon addon in cartItem.selectedAddons) {
      itemTotal += addon.price;
    }

    total += itemTotal * cartItem.quantity;
  }

  return total;
}

// get total number of items in cart
int getTotalItemCount() {
  int totalItemCount = 0;

  for (CartItem cartItem in _cart) {
    totalItemCount += cartItem.quantity;
  }

  return totalItemCount;
}

// clear cart
void clearCart() {
  _cart.clear();
  notifyListeners();
}


/*

HELPERS

 */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
    DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("--------");

    for (final cartItem in _cart) {
      receipt.writeln("${cartItem.quantity} * ${cartItem.gadget.name} - ${_formatPrice(cartItem.gadget.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(" Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("---------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

// format double value into money
String _formatPrice(double price) {
  return "#${price.toStringAsFixed(2)}";
}

//  format list of addons into a string summary
String _formatAddons(List<Addon> addons) {
  return addons
      .map((addon) => "${addon.name} (${_formatPrice(addon.price)}")
      .join(",");
}

}