import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Lottie.asset("assets/register-page.json"),
            // GetBuilder<RegisterController>(
            //   init: RegisterController(),
            //   builder: (controller) =>
            //       Lottie.asset("assets/register-page.json"),
            // ),
            TextFormField(
              controller: controller.emailC,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return "email tidak boleh kosong";
                }
                return null;
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  labelText: "Buat Email",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => TextFormField(
                controller: controller.passC,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                obscureText: controller.isHidden.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "password tidak boleh kosong";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () => controller.isHidden.toggle(),
                        icon: Icon(
                          controller.isHidden.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        )),
                    icon: const Icon(Icons.lock_outline),
                    labelText: "Buat Password",
                    border: const OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => TextFormField(
                controller: controller.confirmC,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                obscureText: controller.isHidden.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "password tidak boleh kosong";
                  } else if (controller.passC.text !=
                      controller.confirmC.text) {
                    return "password harus sesuai";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () => controller.isHidden.toggle(),
                        icon: Icon(
                          controller.isHidden.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        )),
                    icon: const Icon(Icons.lock_outline),
                    labelText: "Sesuaikan password",
                    border: const OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[900]),
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {}
                  controller.register();
                },
                child: const Text(
                  "Buat Akun",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Sudah punya akun?"),
                TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.yellow[900],
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
