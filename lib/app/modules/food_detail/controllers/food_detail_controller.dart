import 'package:get/get.dart';

class FoodDetailController extends GetxController {
  //TODO: Implement FoodDetailController

  var quantity = 1.obs;

  void increment() => quantity.value++;

  void decrement() {
    if (quantity.value > 1) quantity.value--;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
