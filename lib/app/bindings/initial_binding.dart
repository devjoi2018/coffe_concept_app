import 'package:coffee_concept_app/app/controllers/initial_controller.dart';
import 'package:get/get.dart';

/// Inyecta en memoria en controlador de `InitialPage`
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
