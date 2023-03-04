import 'package:admin_panal/modals/constants.dart';
import 'package:admin_panal/modals/modals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductView extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get havevalue => _havevalue;
  ValueNotifier<bool> _havevalue = ValueNotifier(false);

  List<Product> get product => _product;
  List<Product> _product = [];
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(kcollection);

  ProductView() {
    getCollection();
  }

  getCollection() async {
    _loading.value = true;
    await _collectionReference.get().then((value) {
      if (value.docs.length == 0) {
        _havevalue.value = true;
        _loading.value = false;
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          _product.add(
              Product.fromJson(value.docs[i].data() as Map<dynamic, dynamic>));
          _loading.value = false;
        }
      }

      update();
    });
  }
}
