import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../widgets/drawer.dart';
import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  const EditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: const Text(
          'Edit',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller.nameController,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama anda",
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: controller.jobController,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Pekerjaan",
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => controller.submitRole(),
                child: const Text("Submit"),
              ),
              const SizedBox(height: 50),
              Divider(color: Colors.yellow[900]),
              const SizedBox(height: 15),
              Obx(() => Center(child: Text(controller.responseResult.value))),
              Lottie.asset("assets/edit-page.json"),
            ],
          ),
        ),
      ),
    );
  }
}
