import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_flutter/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) => Lottie.asset("assets/login-page.json"),
        ),
        TextField(
          controller: controller.emailC,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              icon: Icon(Icons.email),
              labelText: "Email",
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 20,
        ),
        Obx(
          () => TextField(
            controller: controller.passC,
            autocorrect: false,
            textInputAction: TextInputAction.done,
            obscureText: controller.isHidden.value,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () => controller.isHidden.toggle(),
                    icon: const Icon(
                      Icons.remove_red_eye,
                    )),
                icon: const Icon(Icons.key_off_outlined),
                labelText: "Password",
                border: const OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.yellow[900]),
            onPressed: () {},
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            )),
        const SizedBox(
          height: 5,
        ),
        const Text("Belum punya akun? silahkan buat terlebih dahulu"),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.yellow[900]),
            onPressed: () {
              Get.toNamed(Routes.REGISTER);
            },
            child: const Text(
              "Register",
              style: TextStyle(color: Colors.white),
            )),
      ],
    ));
  }
}
