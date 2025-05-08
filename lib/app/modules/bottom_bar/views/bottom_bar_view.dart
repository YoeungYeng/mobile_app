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
              icon: Icon(Icons.home),
              activeIcon:
              Icon(Icons.home_filled, color: Colors.grey.withOpacity(1)),
            ),
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(Icons.favorite),
              activeIcon:
              Icon(Icons.favorite_border, color: Colors.grey.withOpacity(1)),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(Icons.shopping_cart),
              activeIcon: Icon(
                Icons.shopping_cart_checkout,
                color: Colors.grey.withOpacity(1),
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
              activeIcon: Icon(
                Icons.person_2,
                color: Colors.grey.withOpacity(1),
              ),
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
