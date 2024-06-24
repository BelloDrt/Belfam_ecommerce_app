import 'package:belfam_ecommerce_app/models/gadgets.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Gadget gadget;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({super.key,
  required this.quantity,
    required this.gadget,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          //decrease button
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              Icons.remove,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          // quantity count
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
              child: Center(
                child: Text(quantity.toString(),
              ),
              ),
            ),
          ),

          // increase button
      GestureDetector(
        onTap: onIncrement,
        child: Icon(
          Icons.add,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      ],
      ),
    );
  }
}
