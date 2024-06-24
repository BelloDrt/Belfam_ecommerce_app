import 'package:belfam_ecommerce_app/components/my_button.dart';
import 'package:belfam_ecommerce_app/models/accessories.dart';
import 'package:belfam_ecommerce_app/models/gadgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GadgetPage extends StatefulWidget {
  final Gadget gadget;
  final Map<Addon, bool> selectedAddons ={};

  GadgetPage({
    super.key,
  required this.gadget,
  }){
    // initialize selected addons to be false
   for (Addon addon in gadget.availableAddons) {
     selectedAddons[addon] = false;
   }
  }
  @override
  State<GadgetPage> createState() => _GadgetPageState();
}

class _GadgetPageState extends State<GadgetPage> {


  //method to add to cart
  void addToCart(Gadget gadget, Map<Addon, bool> selectedAddons) {

    // close the current gadget page to go back to menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.gadget.availableAddons) {
      if (widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }

    //add to cart
    context.read<Accessories>().addToCart(gadget, currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Scaffold UI
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // gadget image
              Image.asset(widget.gadget.imagePath),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // gadget name
                    Text(widget.gadget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),

                    // gadget price
                    Text(
                      "#${widget.gadget.price}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary
                      ),
                    ),

                    const SizedBox(height: 10),

                    // gadget description
                    Text(widget.gadget.description),

                    const SizedBox(height: 10),

                    Divider(color: Theme.of(context).colorScheme.secondary),

                    const SizedBox(height: 10),

                    // addons
                    Text("Add-ons", style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    ),



                    const SizedBox(height: 10),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.gadget.availableAddons.length,
                          itemBuilder: (context, index) {
                            // get individual addons
                            Addon addon = widget.gadget.availableAddons[index];

                            // return check box UI
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text("#${addon.price}", style:  TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          }),
                    )
                  ],),
              ),

              // button -> add to cart
              MyButton(
                onTap: () => addToCart(widget.gadget, widget.selectedAddons),
                text: "Add to Cart",
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),

      // back button
     SafeArea(
       child: Opacity(
         opacity: 0.6,
         child: Container(
           margin: const EdgeInsets.only(left: 25),
           decoration:
           BoxDecoration(color: Theme.of(context).colorScheme.secondary,
    shape: BoxShape.circle,
    ),
             child: Card(
               borderOnForeground: false,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(18.0),
               ),
               child: IconButton(
                 icon: const Icon(Icons.arrow_back_ios_rounded),
               onPressed: () => Navigator.pop(context),
               ),
             ),
           ),
         ),
       ),
    ],
    );
  }
}

