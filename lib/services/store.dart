import 'package:admin_panal/screens/modals/constants.dart';
import 'package:admin_panal/screens/modals/modals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProduct(Product product) {
    _firestore.collection(kcollection).add({
      kcarmodal: product.carmodal,
      kcartype: product.cartype,
      kyear: product.year,
      kcategory: product.category,
      kname: product.pname,
      kprice: product.price,
      kdiscreption: product.discreption
    });
  }
}
