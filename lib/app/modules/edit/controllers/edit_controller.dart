import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditController extends GetxController {
  var responseResult = "Data not found".obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  Future<void> submitRole() async {
    try {
      var response = await http.put(
        Uri.parse("https://reqres.in/api/users/2"),
        body: {
          "name": nameController.text,
          "job": jobController.text,
        },
      );

      Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;

      responseResult.value = "${data["name"]} - ${data["job"]}";
    } catch (e) {
      responseResult.value = "Error occurred: ${e.toString()}";
    }
  }
}
