import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/routes/app_pages.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(20),
            height: 100,
            width: double.infinity,
            color: Colors.yellow[900],
            child: TextButton(
                onPressed: () => Get.toNamed(Routes.HOME),
                child: const Text(
                  "Dashboard Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.PROFILE);
                  },
                  leading: const Icon(Icons.person_2_outlined),
                  title: const Text("Profil"),
                  trailing: const Icon(Icons.arrow_forward),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.ROLE);
                  },
                  leading: const Icon(Icons.work_history_outlined),
                  title: const Text("Input Nama dan Pekerjaan"),
                  trailing: const Icon(Icons.arrow_forward),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.EDIT);
                  },
                  leading: const Icon(Icons.edit),
                  title: const Text("Edit Nama dan Pekerjaan"),
                  trailing: const Icon(Icons.arrow_forward),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.DELETE);
                  },
                  leading: const Icon(Icons.delete_forever_outlined),
                  title: const Text("Delete data"),
                  trailing: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
