import 'package:coffee_concept_app/app/routes/app_pages.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// Controlador que maneja lo logica de la pantalla `InitialPage`
class InitialController extends GetxController with SingleGetTickerProviderMixin {
  AnimationController _controller;
  Animation<Offset> _translate1, _translate2, _translate3, _translate4;
  Animation<double> _opacity;

  /// Variable que tiene un valor `false` por defecto, se usa para determinar
  /// si el usurio hizo clic en el boton de retroceso, mientras el valor sea true
  /// se espera a que terminen las animaciones y envia al usuario a la pantalla anterior
  final RxBool toShoppingCar = false.obs;

  @override
  void onInit() {
    this._controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    this._translate1 = Tween<Offset>(begin: Offset(0.0, -Get.height), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.25, curve: Curves.decelerate)),
    );
    this._translate2 = Tween<Offset>(begin: Offset(0.0, -Get.height), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.005, 0.50, curve: Curves.decelerate)),
    );
    this._translate3 = Tween<Offset>(begin: Offset(0.0, -Get.height), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.10, 0.75, curve: Curves.decelerate)),
    );
    this._translate4 = Tween<Offset>(begin: Offset(0.0, -Get.height), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.15, 1.0, curve: Curves.decelerate)),
    );
    this._opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.30, 1.0, curve: Curves.decelerate)),
    );
    super.onInit();
  }

  @override
  void onReady() {
    this._controller.forward();
    super.onReady();
  }

  @override
  void onClose() {
    this._controller.dispose();
    super.onClose();
  }

  /* -------------------------------------------------------------------------- */
  /*                                   METHODS                                  */
  /* -------------------------------------------------------------------------- */

  /// Metodo que hace un reverso de la animacion principal
  /// y cuando termina la animacion pasa a la siguiente pantalla
  toShoppingCarPage() async {
    if (toShoppingCar.value) {
      await this._controller.reverse();
      toShoppingCar.value = false;
      Get.offNamed(Routes.SHOOPINGCAR);
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                                   GETTERS                                  */
  /* -------------------------------------------------------------------------- */

  /// Controlador de las animaciones
  AnimationController get controller => this._controller;

  /// Animacion de translate para la primera imagen
  Animation<Offset> get translate1 => this._translate1;

  /// Animacion de translate para la segunda imagen
  Animation<Offset> get translate2 => this._translate2;

  /// Animacion de translate de la tercera imagen
  Animation<Offset> get translate3 => this._translate3;

  /// Animacion de tranlate de la cuarta imagen
  Animation<Offset> get translate4 => this._translate4;

  /// Animacion de opacidad
  Animation<double> get opacity => this._opacity;
}
