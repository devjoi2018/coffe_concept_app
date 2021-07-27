import 'package:coffee_concept_app/app/bindings/home_bindigs.dart';
import 'package:coffee_concept_app/app/bindings/initial_binding.dart';
import 'package:coffee_concept_app/app/bindings/shopping_binding.dart';
import 'package:coffee_concept_app/app/ui/pages/initial_page/initial_page.dart';
import 'package:coffee_concept_app/app/ui/pages/shopping_cart_page/shopping_car_page.dart';
import 'package:get/get.dart';
import '../ui/pages/home_page/home_page.dart';
part 'app_routes.dart';

/// Clase que contiene la referencia a las paginas de la aplicacion
class AppPages {
  /// Lista de las rutas de las pantallas de la aplicacion
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(name: Routes.INITIAL, page: () => InitialPage(), binding: InitialBinding()),
    GetPage<dynamic>(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage<dynamic>(name: Routes.SHOOPINGCAR, page: () => ShoppingCarPage(), binding: ShoppingCarBinding()),
  ];
}
