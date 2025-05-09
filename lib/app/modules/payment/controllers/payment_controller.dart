import 'package:get/get.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController
  final Rx<PaymentMethod?> selectedPayment = Rx<PaymentMethod?>(null);

  void selectPayment(PaymentMethod method) {
    selectedPayment.value = method;
  }

  final count = 0.obs;

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

  void increment() => count.value++;
}

enum PaymentMethod { mastercard, visa }
