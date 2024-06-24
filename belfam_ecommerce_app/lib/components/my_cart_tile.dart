import 'package:belfam_ecommerce_app/components/my_quantity_selector.dart';
import 'package:belfam_ecommerce_app/models/accessories.dart';
import 'package:belfam_ecommerce_app/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTiile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTiile({super.key,
  required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Accessories>(builder: (context, accessories, child) => Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
     padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
     child:  Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               // gadget image
               ClipRRect(
                 borderRadius: BorderRadius.circular(8),
                 child: Image.asset(cartItem.gadget.imagePath,
                 height: 100,
                     width: 100,
                 ),
               ),

               const SizedBox(width: 10),

               // name and price
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   // gadget name
                   Text(cartItem.gadget.name),

                   //gadget price
                   Text("#${cartItem.gadget.price}",
                   style: TextStyle(
                     color: Theme.of(context).colorScheme.primary
                   ),),
                 ],
               ),

               const Spacer(),

               // increment or decrement quantity
               QuantitySelector(
                   quantity: cartItem.quantity,
                   gadget: cartItem.gadget,
                   onDecrement: () {
                     accessories.removeFromCart(cartItem);
                   },
                   onIncrement: () {
                     accessories.addToCart(cartItem.gadget, cartItem.selectedAddons);
                   },
               )

             ],
           ),
         ),

         // addons
         SizedBox(
           height: cartItem.selectedAddons.isEmpty ? 0 : 60,
           child: ListView(
             scrollDirection: Axis.horizontal,
             padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
             children: cartItem.selectedAddons
                 .map((addon) => Padding(
                   padding: const EdgeInsets.only(right: 8.0),
                   child: FilterChip(
                   label: Row(
                     children: [
                       // addon name
                       Text("#${addon.name}"),

                       // addon price
                       Text(addon.price.toString()),
                     ],
                   ),
                   shape: StadiumBorder(
                     side: BorderSide(
                       color: Theme.of(context).colorScheme.primary,
                     )
                   ),
                   onSelected: (value) {},
               backgroundColor: Theme.of(context).colorScheme.secondary,
               labelStyle: TextStyle(
                   color: Theme.of(context).colorScheme.inversePrimary,
                   fontSize: 12,
               ),
             ),
                 ),
             )
                 .toList(),
           ),
         )
       ],
     ),
    ),
    );
  }
}
