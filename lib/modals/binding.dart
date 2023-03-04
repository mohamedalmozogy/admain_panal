import 'dart:ffi';

import 'package:admin_panal/modals/product_view.dart';
import 'package:get/get.dart';

class binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductView());
  }
}
