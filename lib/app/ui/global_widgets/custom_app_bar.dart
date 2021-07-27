import 'package:coffee_concept_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// App bar personalizado
class CustomAppBar extends GetView<_CustomAppBarController> {
  /// Si el valor es `true` se activa el boton de retroceso
  /// pero en caso de ser `false` el boton se esconde
  final bool backButtom;

  /// Establece el `alto` del `AppBar`
  final double height;

  /// Establece el `ancho` del `AppBar`
  final double width;

  /// Aunque se le pase alguna funcion al `onTapLeadding` no funcionara si
  /// el parametro `backButtom` es `false`, solo en caso de ser `true`
  /// `onTapLeadding` funcionara como debe
  final Function() onTapLeadding;

  /// Funcion que se ejecuta al presional el boton
  /// del lado derecho del `AppBar`
  final Function() onTapAction;

  /// Crea un appBar personalizado con solo un parametro modificable,
  /// `backButtom` recibe un valor `true` o `false`, pero si el no se
  /// especifica nada el valor por defecto es `false`
  CustomAppBar({
    this.onTapAction,
    this.onTapLeadding,
    this.backButtom = false,
  })  : this.height = (Get.height * 0.062).roundToDouble(),
        this.width = Get.width;

  final Color _colorBase = Get.currentRoute == Routes.INITIAL ? Colors.white : const Color(0xff250C0E);
  final Color _colorText = Get.currentRoute == Routes.INITIAL ? const Color(0xff250C0E) : Colors.white;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: Get.width * 0.030,
          right: Get.width * 0.030,
        ),
        height: this.height,
        width: this.width,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints size) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _leadingButtom(size),
                _actionButtom(size),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Metodo que dibuja el boton del lado derecho del appBar
  Widget _actionButtom(BoxConstraints size) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.shopping_bag_outlined,
            size: size.maxHeight * 0.60,
            color: _colorBase,
          ),
          onPressed: onTapAction,
        ),
        Positioned(
          right: 0.0,
          bottom: 0.0,
          child: Container(
            height: size.maxHeight * 0.25,
            width: size.maxHeight * 0.25,
            decoration: BoxDecoration(
              color: _colorBase,
              borderRadius: BorderRadius.circular(Get.height),
            ),
            child: Center(
              child: Text(
                '10',
                style: TextStyle(
                  fontSize: size.maxHeight * 0.18,
                  fontWeight: FontWeight.bold,
                  color: _colorText,
                ),
              ),
              // Icon(
              //   Icons.more_horiz,
              //   size: size.maxHeight * 0.25,
              //   color: _colorText,
              // ),
            ),
          ),
        ),
      ],
    );
  }

  /// Metodo que dibuja el boton del lado izquierdo del appBar
  Widget _leadingButtom(BoxConstraints size) {
    if (backButtom) {
      return IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: size.maxHeight * 0.55,
          color: _colorBase,
        ),
        onPressed: backButtom ? onTapLeadding : null,
      );
    }
    return Container();
  }
}

class _CustomAppBarController extends GetxController {}
