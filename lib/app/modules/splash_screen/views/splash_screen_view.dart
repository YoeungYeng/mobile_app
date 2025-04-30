import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 158, 243, 1),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.asset("assets/image/logo.png"),
          ),
      ),

    );
  }
}
