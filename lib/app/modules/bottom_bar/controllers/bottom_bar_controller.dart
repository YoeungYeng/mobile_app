import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile2/app/modules/cart/views/cart_view.dart';
import 'package:mobile2/app/modules/favorite/views/favorite_view.dart';
import 'package:mobile2/app/modules/home/views/home_view.dart';
import 'package:mobile2/app/modules/profile/views/profile_view.dart';
import 'package:mobile2/app/nav_controller.dart';

class BottomBarController extends GetxController {
  //TODO: Implement BottomBarController

  var tabIndex = 0.obs;
  var screen = [
    HomeView(),
    FavoriteView(),
    CartView(),
    ProfileView()
  ];

  GlobalKey globalKey = GlobalKey(debugLabel: 'btm_app_bar');
  BottomNavigationController bottomNavigationController = Get.put(
    BottomNavigationController(),
  );

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
