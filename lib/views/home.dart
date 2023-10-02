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
      key: controller.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: Container(
          color: Colors.pink,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                'خصومات وشحن مجاني بترقية حسابك الى كوينا سجلي الان',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
      body: const HomeBody(),
      drawer: GetBuilder<HomeController>(
        builder: (controller) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('John Doe'),
                  accountEmail: Text('johndoe@example.com'),
                  currentAccountPicture: CircleAvatar(
                      // Your profile picture here
                      ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    // Handle home drawer item tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // Handle settings drawer item tap
                  },
                ),
                // Add more drawer items as needed
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
