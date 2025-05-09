import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile2/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 20,
            left: 30,
            right: 30,
            bottom: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/image/logo.png', height: 200),
              const SizedBox(height: 20),
              const SizedBox(height: 30),
              TextField(
                // controller: controller.emailController,
                // CONNECTED TO CONTROLLER
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                // controller: controller.phoneController, // CONNECTED TO CONTROLLER
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                // controller: controller.phoneController, // CONNECTED TO CONTROLLER
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity, // Make the button take full width
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Log In logic
                      print("Hello Login");
                    },
                    child: const Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      backgroundColor: Colors.red,
                      // Example background color
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
              // Social Login Buttons
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Center icons horizontally
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.facebook,
                        size: 40.0,
                        color: Colors.blue[700],
                      ),
                      onPressed: () {
                        // Handle Facebook login
                        print('Facebook login pressed');
                      },
                    ),
                    const SizedBox(width: 20.0), // Spacing between icons
                    IconButton(
                      icon: const Icon(
                        Icons.mail_outline,
                        size: 40.0,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        // Handle Gmail login
                        print('Gmail login pressed');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print("Move to Login Screen");
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView())); //<--  You'd need a LoginView()
                },
                child: Row(
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    InkWell(
                      child: Text("Login", style: TextStyle(
                        color: Colors.blue, fontSize: 20,
                        decoration: TextDecoration.underline
                      ),),
                      onTap: () => {Get.toNamed(Routes.LOGINFORM)},

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
