import 'package:get/get.dart';
import '../controllers/home_controller.dart';

/// Inyecta en memoria el controlador de homePage
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
