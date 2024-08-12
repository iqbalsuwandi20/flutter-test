import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_flutter/app/modules/introduction/views/introduction_view.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (controller) => FlutterSplashScreen.scale(
          gradient: const LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          childWidget: SizedBox(
            height: 200,
            child: Image.asset("assets/iconsplash.png"),
          ),
          duration: const Duration(seconds: 5),
          animationDuration: const Duration(seconds: 4),
          onAnimationEnd: () => debugPrint("On Scale End"),
          nextScreen: const IntroductionView(),
        ),
      ),
    );
  }
}
