import 'package:get/get.dart';

import '../controllers/slide_show_controller.dart';

class SlideShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlideShowController>(
      () => SlideShowController(),
    );
  }
}
