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
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Lottie.asset("assets/login-page.json"),
            // GetBuilder<LoginController>(
            //   init: LoginController(),
            //   builder: (controller) => Lottie.asset("assets/login-page.json"),
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
                  labelText: "Email",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => TextFormField(
                controller: controller.passC,
                autocorrect: false,
                textInputAction: TextInputAction.done,
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
                    labelText: "Password",
                    border: const OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // Row(
            //   children: [
            //     Obx(
            //       () => Checkbox(
            //         value: controller.rememberMe.value,
            //         activeColor: Colors.yellow[900],
            //         onChanged: (value) {
            //           controller.rememberMe.value =
            //               !controller.rememberMe.value;
            //         },
            //       ),
            //     ),
            //     const Text("Ingatkan saya"),
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[900]),
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {}
                  controller.login();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum punya akun?"),
                TextButton(
                    onPressed: () => Get.toNamed(Routes.REGISTER),
                    child: Text(
                      "Register",
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
