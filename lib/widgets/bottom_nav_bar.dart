import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/home_controller.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final HomeController controller = Get.put(HomeController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.tabIndex.value,
        onTap: controller.changeTabIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Market'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Sales'),
          BottomNavigationBarItem(icon: Icon(Icons.discount), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Gifts'),
        ],
      ),
    );
  }
}
