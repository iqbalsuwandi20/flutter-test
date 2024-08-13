import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/drawer.dart';
import '../controllers/role_controller.dart';

class RoleView extends GetView<RoleController> {
  const RoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: const Text(
          'Pekerjaan',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
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
          ],
        ),
      ),
    );
  }
}
