import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile2/app/modules/favorite/model/FavoriteModel.dart';

class FavoriteController extends GetxController {
  //TODO: Implement FavoriteController

  var favoriteList = <Data>[].obs;
  var isLoading = true.obs;
  var quantities = <int, int>{}.obs;

  void incrementQuantity(Data item) {
    quantities.update(item.id!, (value) => value + 1, ifAbsent: () => 2);
  }

  void decrementQuantity(Data item) {
    if (quantities[item.id] != null && quantities[item.id]! > 1) {
      quantities.update(item.id!, (value) => value - 1);
    }
  }

  Future<void> getFavorite() async {
    const String urlAPI = "http://127.0.0.1:8000/api/getAllProduct";

    try {
      final response = await http.get(Uri.parse(urlAPI));

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedBody = jsonDecode(response.body);

        // Safely access the 'data' list, providing a default empty list if it's missing or not a List
        final List<dynamic> result = (decodedBody['data'] as List<dynamic>?) ?? [];
        print("result $result");

        // Use RxList's assignAll for efficient updates
        favoriteList.assignAll(result.map((e) => Data.fromJson(e)));
        print("Data ${favoriteList.value.toString()}");

        // Initialize quantities for each item
        for (var item in favoriteList) {
          quantities[item.id!] = 1;
        }

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

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getFavorite(); // Call getFavorite when the controller is initialized
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