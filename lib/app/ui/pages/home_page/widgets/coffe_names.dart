import 'package:coffee_concept_app/app/controllers/home_controller.dart';
import 'package:coffee_concept_app/app/ui/utils/coffee_names_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Contiene todos los nombres animados de todos los cafes
class CoffeeNames extends GetView<HomeController> {
  /// Variable que recibe los datos del layoutBuilder
  final BoxConstraints size;

  /// Constructor de la clase CoffeeNames
  const CoffeeNames({@required this.size});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: size.maxHeight * 0.035,
      right: 0,
      height: size.maxHeight * 0.35,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints size) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  itemCount: listCoffeeNames.length,
                  controller: controller.nameCoffeeController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 800),
                      builder: (BuildContext context, double value, Widget child) {
                        return Opacity(
                          opacity: value,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: size.maxHeight * 0.10,
                              left: size.maxWidth * 0.010,
                              right: size.maxWidth * 0.010,
                            ),
                            child: Text(
                              listCoffeeNames[index].name,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xff240F0F),
                                fontSize: size.maxHeight * 0.18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              AnimatedBuilder(
                animation: controller.controllerOpacityPriceText,
                builder: (BuildContext context, Widget child) {
                  return Opacity(
                    opacity: controller.opacityPriceText.value,
                    child: Obx(() => Padding(
                          padding: EdgeInsets.only(bottom: size.maxHeight * 0.15),
                          child: Text(
                            '\$${listCoffeeNames[controller.indexPriceText.value].price.toStringAsFixed(2)}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: size.maxHeight * 0.12),
                          ),
                        )),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
