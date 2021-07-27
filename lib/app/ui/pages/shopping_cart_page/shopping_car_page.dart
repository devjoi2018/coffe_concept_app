import 'package:coffee_concept_app/app/controllers/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Clase que construye la pagina de ShoppingCar
class ShoppingCarPage extends GetView<ShoppingCarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShoppingCartPage'),
      ),
      body: const SafeArea(
        child: Text('ShoppingCartController'),
      ),
    );
  }
}
