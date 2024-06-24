import 'package:belfam_ecommerce_app/components/my_button.dart';
import 'package:belfam_ecommerce_app/components/my_cart_tile.dart';
import 'package:belfam_ecommerce_app/models/accessories.dart';
import 'package:belfam_ecommerce_app/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Accessories>(builder: (context, accessories, child) {
      // cart
      final  userCart = accessories.cart;

      // Scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // clear cart button
            IconButton(onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Clear Cart?"),
                    actions: [
                      // cancel button
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                      ),


                      // yes button
                      TextButton(
                        onPressed: () {Navigator.pop(context);
                        accessories.clearCart();
                        },
                        child: const Text("Yes"),
                      ),
                    ],

                  ),
              );
            },
                icon: const Icon(Icons.delete),
            )
          ],
        ),
        body: Column(
          children: [

            // list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty ?
                  const Expanded(
                      child: Center(child:  Text("Cart is Empty..."),
                      ),) :
                  Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                          itemBuilder: (context, index) {

                          //get individual cart item
                            final cartItem = userCart[index];



                          //return cart tile UI
                          return MyCartTiile(cartItem: cartItem);
                          }
                      ),
                  ),
                ],
              ),
            ),
            
            //button tot pay
            
            MyButton(onTap: () => Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
                ),
            ),
              text: "Go to checkout",
            ),
            const SizedBox (height: 40),
          ],
        ),
      );
    },);
  }
}
