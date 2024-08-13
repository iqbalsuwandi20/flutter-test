import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/app/routes/app_pages.dart';

import '../../../../databases/database_helper.dart';
import '../../../../models/user.dart';

class RegisterController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController confirmC = TextEditingController();

  RxBool isHidden = true.obs;

  final formKey = GlobalKey<FormState>();

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      DatabaseHelper dbHelper = DatabaseHelper();

      List<Map<String, dynamic>> existingUsers =
          await dbHelper.getUserMapList();
      bool emailExists =
          existingUsers.any((user) => user['email'] == emailC.text);

      if (emailExists) {
        Get.snackbar(
          'Registrasi Gagal',
          'Email sudah terdaftar',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red[900],
        );
        return;
      }

      if (passC.text != confirmC.text) {
        Get.snackbar(
          'Registrasi Gagal',
          'Password dan konfirmasi password tidak cocok',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red[900],
        );
        return;
      }

      User newUser = User(
        id: await dbHelper.getCount() + 1,
        email: emailC.text,
        password: passC.text,
      );
      int result = await dbHelper.insertUser(newUser);
      if (result != 0) {
        Get.offNamed(Routes.LOGIN);
      } else {
        Get.snackbar(
          'Registrasi Gagal',
          'Terjadi kesalahan saat registrasi',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red[900],
        );
      }
    }
  }
}
