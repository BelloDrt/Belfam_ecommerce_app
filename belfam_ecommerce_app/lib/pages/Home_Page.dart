// ignore_for_file: unused_import

import 'package:belfam_ecommerce_app/components/my_accessories_tile.dart';
import 'package:belfam_ecommerce_app/components/my_current_location.dart';
import 'package:belfam_ecommerce_app/components/my_description_box.dart';
import 'package:belfam_ecommerce_app/components/my_drawer.dart';
import 'package:belfam_ecommerce_app/components/my_sliver_app_bar.dart';
import 'package:belfam_ecommerce_app/components/my_tab_bar.dart';
import 'package:belfam_ecommerce_app/models/gadgets.dart';
import 'package:belfam_ecommerce_app/pages/gadget_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/accessories.dart';
import 'package:belfam_ecommerce_app/themes/theme_provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin{
  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: GadgetCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of Gadget that belongs to a specific category
  List<Gadget> _filterMenuByCategory(GadgetCategory category, List<Gadget> fullMenu) {
    return fullMenu.where((gadget) => gadget.category == category).toList();
  }

  // return food in that category
  List<Widget> getGadgetInCategory(List<Gadget> fullMenu) {
    return GadgetCategory.values.map((category) {

      // get category menu
      List<Gadget> categoryMenu =_filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            //get individual accessories
          final gadget = categoryMenu[index];

         // return accessories tile Ui
          return AccessoriesTile(gadget: gadget,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GadgetPage(gadget: gadget),
              ),
              ),
          );
          },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer:  const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
           MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Divider(

              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            // switch
             const MyCurrentLocation(),

            // description box
            const MyDescriptionBox()
        ],
      ),
           ),
        ],
        body: Consumer<Accessories>(
          builder: (context, accessories, child) => TabBarView(
          controller: _tabController,
            children: getGadgetInCategory(accessories.menu),
        ),
        ),
      ),
    );
  }
}
