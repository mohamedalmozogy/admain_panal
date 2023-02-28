import 'package:admin_panal/screens/home_screen.dart';
import 'package:admin_panal/screens/new_product_screen.dart';
import 'package:admin_panal/screens/product_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const adminpanal());
}

class adminpanal extends StatelessWidget {
  const adminpanal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeScreen(),
      getPages: [
        GetPage(name: '/products', page: () => ProductScreen()),
        GetPage(name: '/products/naw', page: () => newPeoductscreen())
      ],
    );
  }
}
