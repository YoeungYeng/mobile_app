import 'package:get/get.dart';

import '../controllers/loginform_controller.dart';

class LoginformBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginformController>(
      () => LoginformController(),
    );
  }
}
