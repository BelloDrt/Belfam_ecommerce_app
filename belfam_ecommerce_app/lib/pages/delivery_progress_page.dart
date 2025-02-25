import 'package:belfam_ecommerce_app/components/my_receipt.dart';
import 'package:flutter/material.dart';

class DeliverProgressPage extends StatelessWidget {
  const DeliverProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery in progress...."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children:  [
          MyReceipt(),
        ],
      ),
    );
  }

  // Custom Nav-Bar Message / Call delivery driver

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          // profile pic of driver
          Container(
            decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background,
            shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),

          ),

          const SizedBox(width: 10),

          // driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Olalekan Bello",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),),
              Text("Driver",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),),
            ],
          ),
          const Spacer(),

          Row(
            children: [
              // message button
              Container(
                decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(width: 10),

              Container(
                decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                ),

              ),

              // call button
            ],
          )

        ],
      ),
    );
  }
}
