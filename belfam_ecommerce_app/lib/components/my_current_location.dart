// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'my_sliver_app_bar.dart';
class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
         title: const Text("Your Location"),
          content: const TextField(
            decoration: InputDecoration(hintText: "Search Address..."),
          ),
          actions: [
            //cancel button 
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Save"),
            ),
            // save button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                // address
                Text("39 Lateef Jakande Ikeja",
                style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold),

                ),

                //drop down menu
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
