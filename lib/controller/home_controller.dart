import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  
  @override
  void onInit() {
    super.onInit();
  }

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
