import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/drawer.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[900],
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Obx(() {
        if (controller.allUser.isEmpty) {
          return const Center(
            child: Text("Loading"),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: controller.allUser.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(
                  controller.allUser[index]["avatar"],
                ),
              ),
              title: Text(
                "${controller.allUser[index]["first_name"]} ${controller.allUser[index]["last_name"]}",
              ),
              subtitle: Text(
                "${controller.allUser[index]["email"]}",
              ),
            ),
          );
        }
      }),
    );
  }
}
