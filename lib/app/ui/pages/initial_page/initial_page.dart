import 'package:coffee_concept_app/app/controllers/initial_controller.dart';
import 'package:coffee_concept_app/app/routes/app_pages.dart';
import 'package:coffee_concept_app/app/ui/global_widgets/custom_app_bar.dart';
import 'package:coffee_concept_app/app/ui/pages/initial_page/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Pagina principal
class InitialPage extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails value) {
          if (value.delta.dy < 1.0) {
            Get.offNamed(Routes.HOME);
          }
        },
        child: _bodyPage(),
      ),
    );
  }

  /// Metodo que contiene el cuerpo de la pantalla
  Widget _bodyPage() {
    return AnimatedBuilder(
      animation: controller.controller,
      builder: (BuildContext context, Widget child) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            _backgroundGradient(),
            Transform.translate(
              offset: controller.translate4.value,
              child: Transform.translate(
                offset: Offset(0.0, -Get.height * 0.30),
                child: Align(
                  alignment: Alignment.center,
                  child: Hero(
                    flightShuttleBuilder: (BuildContext flightContext, Animation<double> animation, HeroFlightDirection flightDirection, BuildContext fromHeroContext, BuildContext toHeroContext) {
                      return FadeTransition(
                        opacity: animation.drive(
                          Tween<double>(begin: 1.0, end: 0.0).chain(
                            CurveTween(
                              curve: const Interval(0.0, 0.25),
                            ),
                          ),
                        ),
                        child: fromHeroContext.widget,
                      );
                    },
                    tag: '1',
                    child: CustomImage(
                      image: '9.png',
                      imageScale: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: controller.translate3.value,
              child: Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: '2',
                  child: CustomImage(
                    image: '11.png',
                    imageScale: 0.9,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: controller.translate2.value,
              child: Transform.translate(
                offset: Offset(0.0, Get.height * 0.04),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Hero(
                    tag: '3',
                    child: CustomImage(
                      image: '8.png',
                      imageScale: 1.6,
                    ),
                  ),
                ),
              ),
            ),
            _logo(),
            Transform.translate(
              offset: controller.translate1.value,
              child: Transform.translate(
                offset: Offset(0.0, Get.height * 0.45),
                child: Hero(
                  tag: '4',
                  child: CustomImage(
                    image: '1.png',
                    imageScale: 1.8,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CustomAppBar(
                onTapAction: () async {
                  controller.toShoppingCar.value = true;
                  await controller.toShoppingCarPage();
                },
              ),
            )
          ],
        );
      },
    );
  }

  /// Contiene el color difuminado del fondo
  Widget _backgroundGradient() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xffA4886B),
            Colors.white,
            Colors.white,
          ],
        ),
      ),
    );
  }

  /// Metodo que contiene el logo animado de la app
  Widget _logo() {
    return Transform.translate(
      offset: Offset(0.0, -Get.height * 0.05 + Get.height * 0.16),
      child: Align(
        alignment: Alignment.center,
        child: Opacity(
          opacity: controller.opacity.value,
          child: CustomImage(
            image: 'logo.png',
            imageScale: 0.6,
          ),
        ),
      ),
    );
  }
}
