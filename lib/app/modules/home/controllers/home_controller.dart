import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile2/app/modules/home/model/Product.dart';

class HomeController extends GetxController {
  var productList = <Data>[].obs;
  var isLoading = true.obs;

  var quantity = 1.obs;

  void increment() => quantity.value++;

  void decrement() {
    if (quantity.value > 1) quantity.value--;
  }
  // fetch api
  Future<void> getProduct() async {
    const String urlAPI = "http://127.0.0.1:8000/api/getAllProduct";

    try {
      final response = await http.get(Uri.parse(urlAPI));

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedBody = jsonDecode(response.body);

        // Safely access the 'data' list, providing a default empty list if it's missing or not a List
        final List<dynamic> result = (decodedBody['data'] as List<dynamic>?) ?? [];
        print("result $result");

        // Use RxList's assignAll for efficient updates
        productList.assignAll(result.map((e) => Data.fromJson(e)));
        print("Data ${productList.value.toString()}");

        isLoading.value = false;
      } else {
        // Improve error messaging to include the URL
        Get.snackbar(
          "Failed to load products",
          "Server responded with status: ${response.statusCode}\nReason: ${response.reasonPhrase}\nURL: $urlAPI",
        );
      }
    } catch (error) {
      // Catch specific exceptions for better error handling
      if (error is FormatException) {
        Get.snackbar(
          "Failed to load products",
          "Error decoding server response. Please check the API response format.",
        );
        print("Error decoding JSON: ${error.toString()}");
      } else if (error is http.ClientException) {
        Get.snackbar(
          "Failed to connect",
          "Network error occurred while trying to reach the server.",
        );
        print("HTTP Client Error: ${error.toString()}");
      } else {
        Get.snackbar(
          "An unexpected error occurred",
          "Something went wrong while fetching products.",
        );
        print("Unexpected error: ${error.toString()}");
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProduct();
    // You can perform any initialization here
  }

  @override
  void onReady() {
    super.onReady();
    // Called after the widget is built and the initial dependencies are injected.
  }

  @override
  void onClose() {
    super.onClose();
    // Called when the controller is being removed from memory
  }
}


