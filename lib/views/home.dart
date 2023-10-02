import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task/controller/home_controller.dart';
import 'package:task/widgets/bottom_nav_bar.dart';
import 'package:task/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const HomeBody(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
