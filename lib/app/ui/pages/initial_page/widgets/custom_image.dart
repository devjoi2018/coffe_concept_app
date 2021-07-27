import 'package:coffee_concept_app/app/controllers/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Clase que muestra una imagen personalizada
class CustomImage extends GetView<InitialController> {
  /// Almacena el String de la ruta de la imagen
  final String image;

  /// Almacena el valor de la escala de la imagen
  final double imageScale;

  /// Permite llamar a una imagen personalizada de forma local,
  /// ademas tiene dos parametros obligatorios como pasarle la ruta en
  /// `image` y la escala de la imagen en `imageScale`
  CustomImage({
    @required this.image,
    @required this.imageScale,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: Alignment.bottomCenter,
      scale: imageScale,
      child: Image.asset(
        'assets/images/$image',
        fit: BoxFit.contain,
      ),
    );
  }
}
