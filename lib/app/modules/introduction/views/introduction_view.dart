import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:test_flutter/app/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({super.key});
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Hi",
          body: "Selamat datang di aplikasi test flutter",
          image: Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: Lottie.asset(
                'assets/first-introduction.json',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        PageViewModel(
          title: "Hi",
          body: "Silahkan masuk atau daftar terlebih dahulu",
          image: Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: Lottie.asset(
                'assets/second-introduction.json',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
      showNextButton: false,
      done: const Text("Masuk"),
      onDone: () {
        Get.offAndToNamed(Routes.HOME);
      },
    );
  }
}
