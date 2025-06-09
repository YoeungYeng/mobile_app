import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile2/form/register/model/RegisterModel.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  var userList = <User>[].obs;
  final String urlAPI = "http://0.0.0.0:8000/api/account/register";
  final box = GetStorage();
  var isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> getRegister() async {
    try {
      isLoading = true.obs;
      final response = await http.post(
        Uri.parse(urlAPI),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 201) {
        final deCodeBody = jsonDecode(response.body);
        final registorModel = RegisterModel();
        if (registorModel.accessToken != null) {
          await box.write('accessToken', registorModel.accessToken);
        }
        if (registorModel.tokenType != null) {
          await box.write('tokenType', registorModel.tokenType);
        }
        if (registorModel.user != null) {
          await box.write('user', registorModel.user!.toJson());
        }
        isLoading.value = false;
        Get.snackbar("Success", "Registration successful!");
        Get.offNamed('/bottom-bar');
      } else {
        Get.snackbar(
          "Failed to load products", //  Change this message
          "Server responded with status: ${response.statusCode}\nReason: ${response.reasonPhrase}\nURL: $urlAPI",
        );
      }
    } catch (error) {
      if (error is FormatException) {
        Get.snackbar(
          "Failed to load products",  // Change this message
          "Error decoding server response. Please check the API response format.",
        );
        print("Error decoding JSON: ${error.toString()}");
      } else if (error is http.ClientException) {
        Get.snackbar(
          "Failed to connect",    // Change this message
          "Network error occurred while trying to reach the server.",
        );
        print("HTTP Client Error: ${error.toString()}");
      } else {
        Get.snackbar(
          "An unexpected error occurred", // Change this message
          "Something went wrong while fetching products.", //Change this message
        );
        print("Unexpected error: ${error.toString()}");
      }
    }
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