import 'dart:ui';

import 'package:coffee_concept_app/app/routes/app_pages.dart';
import 'package:coffee_concept_app/app/ui/global_widgets/custom_app_bar.dart';
import 'package:coffee_concept_app/app/ui/pages/home_page/widgets/coffe_names.dart';
import 'package:coffee_concept_app/app/ui/utils/coffee_names_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';

/// Clase que construye el homePage
class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints size) {
          return _bodyPage(size);
        },
      ),
    );
  }

  /// Metodo que contiene el cuerpo de la pantalla
  Widget _bodyPage(BoxConstraints size) {
    return Stack(
      children: <Widget>[
        _backgroundGradient(),
        CoffeeNames(size: size),
        _staticShadow(),
        _shadow(),
        Transform.scale(
          alignment: Alignment.bottomCenter,
          scale: 1.4,
          child: PageView.builder(
            itemCount: controller.imageList.length + 1,
            controller: controller.pageCoffeeController,
            onPageChanged: (int value) async {
              if (value > listCoffeeNames.length - 1) return;

              controller.value.value = value.toDouble();

              await controller.controllerOpacityPriceText.reverse();
              controller.indexPriceText.value = value;
              await controller.controllerOpacityPriceText.forward();
            },
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return index == 0 ? const SizedBox.shrink() : _coffeesImages(index);
            },
          ),
        ),
        _menuText(),
        Align(
          alignment: Alignment.topCenter,
          child: CustomAppBar(
            backButtom: true,
            onTapLeadding: () {
              controller.pageCoffeeController.animateToPage(
                2,
                duration: const Duration(milliseconds: 800),
                curve: Curves.decelerate,
              );
            },
            onTapAction: () {
              Get.offNamed(Routes.SHOOPINGCAR);
            },
          ),
        ),
      ],
    );
  }

  /// Contiene la transformacion de las imagenes
  Widget _coffeesImages(int index) {
    return Obx(() {
      final double result = controller.currentPage.value - index + 1;
      final double value = -0.35 * result + 1;
      final double opacity = value.clamp(0.0, 1.0);
      final double translate = Get.height / 2.5 * (1 - value).abs();

      return Transform(
        alignment: Alignment.bottomCenter,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..translate(0.0, translate)
          ..scale(value),
        child: Opacity(
          opacity: opacity.toDouble(),
          child: Hero(
            tag: '$index',
            child: Image.asset(controller.imageList[index - 1].assetsName),
          ),
        ),
      );
    });
  }

  /// Muestra la sombra debajo de los vasos de cafe
  Widget _shadow() {
    return Obx(
      () {
        if (!controller.showShadow()) return Container();
        final double _values = controller.imageList[controller.value.value.toInt()].size;
        return Positioned(
          left: Get.width * 0.50 - _values / 2,
          bottom: 0.0,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(0.0, _values * 0.70)
              ..scale(1.0, 0.2),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: _values,
              width: _values,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    blurRadius: 50.0,
                    spreadRadius: 5.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Metodo que contiene una sombra decorativa en la parte inferior
  /// de la pantalla
  Widget _staticShadow() {
    return Positioned(
      left: Get.width * 0.50 - 200,
      bottom: 0.0,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..translate(0.0, 325.0)
          ..scale(1.0, 0.5),
        child: Container(
          height: 400.0,
          width: 400.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300.0),
            boxShadow: <BoxShadow>[
              const BoxShadow(
                color: Color(0xff856042),
                blurRadius: 80.0,
                spreadRadius: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuText() {
    return Positioned(
      right: 16.0,
      bottom: 70.0,
      child: AnimatedBuilder(
        animation: controller.controllerTranslate,
        builder: (BuildContext context, Widget child) {
          return Transform.translate(
            offset: controller.translateTextMenu.value,
            child: Row(
              children: <Widget>[
                AnimatedBuilder(
                  animation: controller.controllerOpacity,
                  builder: (BuildContext context, Widget child) {
                    return Opacity(
                      opacity: controller.opacityAnimation.value,
                      child: const Text(
                        'Menu',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 40.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _backgroundGradient() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.white,
            Color(0xffE2D9D2),
          ],
        ),
      ),
    );
  }
}
