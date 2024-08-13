import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/app/routes/app_pages.dart';

import '../../../../databases/database_helper.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  RxBool isHidden = true.obs;

  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      DatabaseHelper dbHelper = DatabaseHelper();
      List<Map<String, dynamic>> users = await dbHelper.getUserMapList();
      bool isAuthenticated = false;

      for (var user in users) {
        if (user['email'] == emailC.text && user['password'] == passC.text) {
          isAuthenticated = true;
          break;
        }
      }

      if (isAuthenticated) {
        Get.offNamed(Routes.HOME);
      } else {
        Get.snackbar(
          'Login Gagal',
          'Email atau password salah',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[900],
          colorText: Colors.white,
        );
      }
    }
  }
}
