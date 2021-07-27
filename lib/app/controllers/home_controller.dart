import 'package:coffee_concept_app/app/routes/app_pages.dart';
import 'package:coffee_concept_app/app/ui/utils/coffee_names_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// Controlador que se encarga de manejar toda la
/// logica de la pantalla `HomePage`
class HomeController extends GetxController with SingleGetTickerProviderMixin {
  AnimationController _controllerTranslate;
  AnimationController _controllerOpacity;
  AnimationController _controllerOpacityPriceText;
  Animation<double> _opacity, _opacityPriceText;
  Animation<Offset> _translateTextMenu;

  /// Controlador que se encarga de manejar
  /// el `PageVuew.builder` que contiene la lista
  /// de las imagenes de los cafes
  PageController pageCoffeeController;

  /// Controlador que se encarga de manejar
  /// el `PageView.builder` que contiene los
  /// textos de los cafes
  PageController nameCoffeeController;

  /// Indica la pantalla actual
  final RxDouble currentPage = 3.0.obs;

  /// Almacena la pagina en la que se encuentra el
  /// `PageView.builder` para saber cuando debe dibujar
  /// una sombra debajo de las imagenes de los cafes
  final RxDouble value = 3.0.obs;

  /// Almacena el indice de la pagina del `PageView.builder`
  /// que contiene la lista de las imagenes de los cafes
  final RxInt indexPriceText = 3.obs;

  /// Lista de imagenes
  List<_CoffeModel> imageList;

  @override
  void onInit() {
    _controllerTranslate = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _controllerOpacity = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _controllerOpacityPriceText = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controllerOpacity, curve: Curves.ease),
    );

    _opacityPriceText = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controllerOpacityPriceText, curve: Curves.ease),
    );

    _translateTextMenu = Tween<Offset>(
      begin: const Offset(0.0, 200.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controllerTranslate, curve: Curves.decelerate),
    );

    pageCoffeeController = PageController(
      initialPage: 3,
      viewportFraction: 0.32,
    );
    nameCoffeeController = PageController(
      initialPage: 3,
    );

    pageCoffeeController.addListener(coffeeScroolListener);
    _addAssetsInList();

    super.onInit();
  }

  @override
  void onReady() {
    _controllerTranslate.forward();
    _controllerOpacityPriceText.forward();

    super.onReady();
  }

  @override
  void onClose() {
    pageCoffeeController
      ..removeListener(coffeeScroolListener)
      ..dispose();
    nameCoffeeController.dispose();
    _controllerTranslate.dispose();
    _controllerOpacityPriceText.dispose();
    super.onClose();
  }

  /* ------------------------------------------------------------------------ */
  /*                                   METHODS                                */
  /* ------------------------------------------------------------------------ */

  /// Meotod que contiene lo que debe ser escuchado en el listener del `pageCoffeeController`
  void coffeeScroolListener() {
    currentPage.value = pageCoffeeController.page;
    _triggerNamesCoffeePage();
    _triggerOpacityTextMenu();
    _toInitialPage();
  }

  /// Muestra la sombra debajo de cada vaso de cafe
  bool showShadow() {
    if (value.value == currentPage.value && value.value <= imageList.length - 1) {
      return true;
    }
    return false;
  }

  /// Activa la animacion de opacidad en el texto menu
  void _triggerOpacityTextMenu() {
    if (value.value > 3.0) {
      _controllerOpacity.forward();
    } else {
      _controllerOpacity.reverse();
    }
  }

  /// Si la pagina es menor a 3 envia al usuario a la pantalla inicial
  void _toInitialPage() {
    if (currentPage.value < 3.0) Get.offNamed(Routes.INITIAL);
  }

  /// Activa el scrool del pageView que contiene
  /// los nombres de cada cafe
  void _triggerNamesCoffeePage() {
    if (pageCoffeeController.page >= listCoffeeNames.length - 1) return;
    nameCoffeeController.position.correctPixels(
      pageCoffeeController.offset *
          ((nameCoffeeController.viewportFraction / pageCoffeeController.viewportFraction) / (pageCoffeeController.position.viewportDimension / nameCoffeeController.position.viewportDimension)),
    );
    nameCoffeeController.position.notifyListeners();
  }

  /* ------------------------------------------------------------------------ */
  /*                                   GETTERS                                */
  /* ------------------------------------------------------------------------ */
  /// Controlador para la animacion de translate
  AnimationController get controllerTranslate => _controllerTranslate;

  /// Controlador para la animacion de opacidad
  AnimationController get controllerOpacity => _controllerOpacity;

  /// Controlador para la animacion de opacidad en el texto de los precios de los cafes
  AnimationController get controllerOpacityPriceText => _controllerOpacityPriceText;

  /// Controlador para la animacion que mueve el texto que dice menu
  Animation<Offset> get translateTextMenu => _translateTextMenu;

  /// Controlador para la animacion de la opacidad
  Animation<double> get opacityAnimation => _opacity;

  /// Controlador para la animacion de la opacidad del texto de los precios
  /// de los cafes
  Animation<double> get opacityPriceText => _opacityPriceText;

  /// Metodo que agrega las rutas de las imagenes en la lista
  /// desde la imagen 1 hasta la 12 y los parametros necesarios para
  /// la sombra que va debajo de cada taza
  void _addAssetsInList() {
    const double _percent = 1.2;
    imageList = <_CoffeModel>[
      _CoffeModel(
        assetsName: 'assets/images/9.png',
        size: 150.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/11.png',
        size: 180.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/8.png',
        size: 280.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/1.png',
        size: 280.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/2.png',
        size: 150.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/3.png',
        size: 150.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/4.png',
        size: 175.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/5.png',
        size: 180.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/6.png',
        size: 180.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/7.png',
        size: 150.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/8.png',
        size: 280.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/9.png',
        size: 150.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/10.png',
        size: 280.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/11.png',
        size: 180.0 * _percent,
      ),
      _CoffeModel(
        assetsName: 'assets/images/12.png',
        size: 180.0 * _percent,
      ),
    ];
  }
}

class _CoffeModel {
  final String assetsName;
  final double size;

  _CoffeModel({this.assetsName, this.size});
}
