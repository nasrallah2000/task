import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task/binding/home_binding.dart';
import 'package:task/routes/routes.dart';
import 'package:task/views/home.dart';

class Pages {
  static var list = [
    GetPage(
      name: Routes.homeScreen,
      page: () =>  HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
