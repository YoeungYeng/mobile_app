import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile2/app/routes/app_pages.dart';

import '../controllers/loginform_controller.dart';

class LoginformView extends GetView<LoginformController> {
  const LoginformView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/image/logo.png',
                height: 250,
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 30),
              TextField(
                // controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                // controller: controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.BOTTOM_BAR); // Connect to controller logic
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Sign In'),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.facebook, size: 40.0, color: Colors.blue[700]),
                    onPressed: () {
                      print('Facebook login pressed');
                    },
                  ),
                  const SizedBox(width: 20.0),
                  IconButton(
                    icon: const Icon(Icons.mail_outline, size: 40.0, color: Colors.redAccent),
                    onPressed: () {
                      print('Gmail login pressed');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  InkWell(
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () => Get.toNamed(Routes.REGISTER), // <-- make sure Routes.LOGIN exists
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
