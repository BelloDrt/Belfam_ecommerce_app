
// ignore_for_file: unused_import

import 'package:belfam_ecommerce_app/firebase_options.dart';
import 'package:belfam_ecommerce_app/models/accessories.dart';
import 'package:belfam_ecommerce_app/pages/register_page.dart';
import 'package:belfam_ecommerce_app/services/auth/auth_gate.dart';
import 'package:belfam_ecommerce_app/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      MultiProvider(providers: [
        // theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        
        // accessories provider
        ChangeNotifierProvider(create: (context) => Accessories()),
      ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
