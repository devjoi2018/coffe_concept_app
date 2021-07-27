import 'package:flutter/material.dart';

/// Modelo de datos de los cafes
class _DataModel {
  final String name;
  final double price;

  _DataModel({
    @required this.name,
    @required this.price,
  });
}

/// Lista que contiene todos los nombres y precios de los cafes
List<_DataModel> listCoffeeNames = <_DataModel>[
  _DataModel(
    name: '',
    price: 0.0,
  ),
  _DataModel(
    name: '',
    price: 0.0,
  ),
  _DataModel(
    name: '',
    price: 0.0,
  ),

  ///real data
  _DataModel(
    name: 'Caramel Macchiato',
    price: 4.30,
  ),
  _DataModel(
    name: 'Caramel Cold Drink',
    price: 3.50,
  ),
  _DataModel(
    name: 'Iced Coffe Mocha',
    price: 5.20,
  ),
  _DataModel(
    name: 'Caramelized Pecan Latte',
    price: 5.20,
  ),
  _DataModel(
    name: 'Toffee Nut Latte',
    price: 4.80,
  ),
  _DataModel(
    name: 'Capuchino',
    price: 4.0,
  ),
  _DataModel(
    name: 'Toffee Nut Iced Latte',
    price: 5.30,
  ),
  _DataModel(
    name: 'Americano',
    price: 2.50,
  ),
  _DataModel(
    name: 'Vietnamese-Style Iced Coffee',
    price: 4.30,
  ),
  _DataModel(
    name: 'Black Tea Latte',
    price: 4.0,
  ),
  _DataModel(
    name: 'Classic Irish Coffee',
    price: 3.50,
  ),
  _DataModel(
    name: 'Toffee Nut Crunch Latte',
    price: 5.20,
  ),
];
