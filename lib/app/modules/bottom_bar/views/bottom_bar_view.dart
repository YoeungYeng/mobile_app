import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  const BottomBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.bottomNavigationController.selectedIndex.value,
          children: controller.screen,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.black,
          onTap: (index) {
            controller.bottomNavigationController.changeIndex(index);
          },
          currentIndex:
              controller.bottomNavigationController.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home, color: Colors.blue,),
              activeIcon: Icon(
                Icons.home_filled,
                color: Colors.redAccent,
              ),
            ),
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(Icons.favorite_border, color: Colors.blue),

              activeIcon: Icon(Icons.favorite, color: Colors.redAccent),
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_cart_outlined, color: Colors.blue), // Inactive color
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '2', // Use your observable here
                        style: const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              activeIcon: Stack(
                children: [
                  const Icon(Icons.shopping_cart, color: Colors.redAccent), // Active icon (filled)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '2', // Use your observable here
                        style: const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person, color: Colors.blue),
              activeIcon: Icon(Icons.person_2, color: Colors.redAccent),
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
        ),
      ),
    );
  }
}
