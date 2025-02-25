import 'package:belfam_ecommerce_app/models/accessories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Thank you for your Patronage!"),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Accessories>(
                builder: (context, accessories, child) =>
                    Text(accessories.displayCartReceipt()),
              ),
            ),
            const SizedBox(height: 25),
            const Text("Estimated Delivery Time is: 4:10 PM"),
          ],
        ),
      ),
    );
  }
}
