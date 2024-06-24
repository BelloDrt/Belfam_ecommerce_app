import 'package:belfam_ecommerce_app/components/my_drawer_tile.dart';
import 'package:belfam_ecommerce_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../pages/Settings_Page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  void logout() {
    final authService = AuthService();
    authService.signoOut();
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:  Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            // app logo
            Icon(Icons.lock_open_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            //home list icon
            MyDrawerTile(
                text: "H O M E",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
            ),

            // settings icon
            MyDrawerTile(
                text: "S E T T I N G S",
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),);
                },
            ),

            const Spacer(),

            //sign out icon
        MyDrawerTile(
          text: "L O G O U T",
          icon: Icons.logout,
          onTap: () {
            logout();
            Navigator.pop(context);
          },

        ),
            const SizedBox(height: 25,)
          ],


        ),
      ),
    );
  }
}
