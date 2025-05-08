import 'package:get/get.dart';
import 'package:mobile2/app/modules/home/controllers/home_controller.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(
      () => BottomBarController(),
    );
    Get.lazyPut<HomeController>(
        () => HomeController()
    );
  }
}
