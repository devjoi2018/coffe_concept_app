import 'package:coffee_concept_app/app/controllers/shopping_controller.dart';
import 'package:get/get.dart';

/// Inyecta en memoria el controlador de `ShoppingCarPage`
class ShoppingCarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingCarController>(() => ShoppingCarController());
  }
}
