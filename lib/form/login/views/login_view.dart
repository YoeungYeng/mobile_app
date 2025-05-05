import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile2/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        // To center the content on the screen
        child: Padding(
          padding: const EdgeInsets.all(32.0), // Add some overall padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Center widgets vertically
            children: <Widget>[
              // Title and Graphics
              SizedBox(height: 20.0), // Spacing
              // Replace with your actual image asset
              Image.asset('assets/image/logo.png', width: 300, height: 300),
              // login
              SizedBox(height: 40.0), // Spacing
              // Log In Button
              SizedBox(
                width: double.infinity, // Make the button take full width
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Log In logic
                    Get.toNamed(Routes.LOGINFORM);
                  },
                  child: Text('Log in'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    backgroundColor: Colors.red, // Example background color
                    foregroundColor: Colors.white,

                  ),
                ),
              ),
              // sign in button
              SizedBox(height: 16.0), // Spacing
              // Sign Up Button

              SizedBox(height: 30.0), // Spacing
              // Social Login Buttons
              Row(
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
                  SizedBox(width: 20.0), // Spacing between icons
                  IconButton(
                    icon: Icon(
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
            ],
          ),
        ),
      ),
    );
  }
}
