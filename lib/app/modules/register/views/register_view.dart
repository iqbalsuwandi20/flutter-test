import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GetBuilder<RegisterController>(
            init: RegisterController(),
            builder: (controller) => Lottie.asset("assets/register-page.json"),
          ),
          TextField(
            controller: controller.emailC,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                icon: Icon(Icons.email),
                labelText: "Buat Email",
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
                  labelText: "Buat Password",
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
                "Buat Akun",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
