import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobile2/form/loginform/LoginModel.dart';

class LoginformController extends GetxController {
  var login = LoginModel().obs;
  final String urlAPI = "http://127.0.0.1:8000/api/account/login";
  var isLoading = false.obs;

  final  emailController = TextEditingController();
  final passwordController = TextEditingController();
  final storage = GetStorage(); // Persistent storage instance

  Future<void> getLogin() async {
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse(urlAPI),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        }),
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(response.body);
        login.value = LoginModel.fromJson(decodedBody);
        emailController.clear();
        passwordController.clear();
        // Store login data persistently
        storage.write("token", login.value.token);
        storage.write("email", login.value.email);

        Get.snackbar("Success", "Login successful!");
        Get.offNamed('/bottom-bar');
      } else {
        Get.snackbar("Login Failed", "Invalid credentials or server error.");
      }
    } catch (error) {
      isLoading.value = false;
      Get.snackbar("Error", "Something went wrong. Please try again.");
      print("Error: ${error.toString()}");
    }
  }

  void logout() {
    storage.erase(); // Clears stored user data
    Get.offNamed('/login'); // Redirect to login page
  }

  void checkUserLoggedIn() {
    if (storage.read("token") != null) {
      Get.offNamed('/home'); // Auto-login if token exists
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkUserLoggedIn(); // Check login status on startup
  }
}
