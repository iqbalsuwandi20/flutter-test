import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../widgets/drawer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[900],
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => controller.logout(),
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Lottie.asset("assets/arrow-home.json"),
          ),
          // Gambar kedua di tengah-tengah
          Center(
            child: Lottie.asset("assets/person-home.json"),
          ),
        ],
      ),
    );
  }
}
