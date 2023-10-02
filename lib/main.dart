import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/routes/pages.dart';
import 'package:task/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task',
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      initialRoute: Routes.homeScreen,
      getPages: Pages.list,
    );
  }
}
