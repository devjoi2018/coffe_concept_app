import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/utils/transition_animation.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      transitionDuration: const Duration(milliseconds: 700),
      customTransition: TransitionAnimation(),
      getPages: AppPages.routes,
    ),
  );
}
