import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCE6EF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/image/logo.png",
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              // Logo and search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.notes, size: 28),
                    SizedBox(
                      width: 240,
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose it.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Please select where your are at right now",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Profile Info
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.deepOrange.withOpacity(0.3),
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.name.value,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              controller.email.value,
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              controller.phone.value,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Edit",
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 14.0,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.pinkAccent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Menu Items
              _menuItem(Icons.my_library_books, 'My order history & ongoing'),
              Divider(),
              _menuItem(Icons.language, 'Change language'),
              Divider(),
              _menuItem(Icons.qr_code_2, 'Quick login'),
              Divider(),
              _menuItem(Icons.group_add, 'Invite friends'),
              Divider(),
              _menuItem(Icons.settings, 'Settings'),
              Divider(height: 45,),
              _menuItem(Icons.logout, 'Log out'),

            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.arrow_right, size: 48),
      onTap: () {},
    );
  }
}
