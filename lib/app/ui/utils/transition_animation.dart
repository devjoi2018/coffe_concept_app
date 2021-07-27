import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/custom_transition.dart';

/// Animacion personalizada para la transicion entre pantallas
class TransitionAnimation extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve curve,
    Alignment alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.linear,
      ),
      child: child,
    );
  }
}
