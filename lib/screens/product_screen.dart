import 'package:admin_panal/modals/product_view.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'daetels_view.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductView>(
      init: Get.put(ProductView()),
      builder: (controller) => controller.havevalue.value
          ? Scaffold(
              body: Center(
                  child: Text(
                'لا توجد منتجات',
                style: TextStyle(fontSize: 40),
              )),
              appBar: AppBar(),
            )
          : controller.loading.value
              ? Scaffold(body: Center(child: CircularProgressIndicator()))
              : Scaffold(
                  appBar: AppBar(),
                  body: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.6),
                      itemCount: controller.product.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              GestureDetector(
                                onTap: () {
                                  Get.to(DetailsView(
                                    model: controller.product[index],
                                  ));
                                },
                                child: Container(
                                  height: 250,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Color.fromARGB(
                                              255, 196, 196, 196)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 100,
                                        child: Image.network(controller
                                            .product[index].imageUrl!),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              controller
                                                  .product[index].carmodal!,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              controller
                                                  .product[index].cartype!,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              controller.product[index].year!,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              controller
                                                  .product[index].category!,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              controller.product[index].price!,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
    );
  }
}
