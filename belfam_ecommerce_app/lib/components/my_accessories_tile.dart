
import 'package:flutter/material.dart';

import '../models/gadgets.dart';

class AccessoriesTile extends StatelessWidget {
  final Gadget gadget;
  final void Function()? onTap;

  const AccessoriesTile({super.key,
    required this.gadget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [

                //text accessories details
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(gadget.name),
                        Text("#${gadget.price}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(gadget.description,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary
                          ),
                        ),
                      ],
                    ),
                ),
                const SizedBox(
                  width: 15,
                ),

                // accessories image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                    child: Image.asset(gadget.imagePath, height: 120)),
              ],
            ),
          ),
        ),

        // divider
         Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
           indent: 25,
        )
      ],
    );
  }
}
