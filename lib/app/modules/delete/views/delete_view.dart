import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../widgets/drawer.dart';
import '../controllers/delete_controller.dart';

class DeleteView extends GetView<DeleteController> {
  const DeleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[900],
        title: const Text(
          'Delete data',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await controller.fetchData();
            },
            icon: const Icon(
              Icons.get_app_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Obx(() {
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(controller.data.value),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.yellow[900]),
              onPressed: () async {
                await controller.deleteData();
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Lottie.asset("assets/delete-page.json"),
          ],
        );
      }),
    );
  }
}
