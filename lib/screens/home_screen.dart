import 'package:admin_panal/screens/new_product_screen.dart';
import 'package:admin_panal/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'اللوحة الرئيسية',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => ProductScreen());
              },
              child: Container(
                height: 90,
                width: double.infinity,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'المنتجات',
                    style: TextStyle(fontSize: 34, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => newPeoductscreen());
              },
              child: Container(
                height: 90,
                width: double.infinity,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'اضافة منتجات',
                    style: TextStyle(fontSize: 34, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
