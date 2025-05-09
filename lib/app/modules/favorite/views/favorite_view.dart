import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Placeholder for FavoriteController if not imported from another file
class FavoriteController extends GetxController {
  void navigateToHome() {
    Get.toNamed('/home');
    print("Navigating to Home");
  }

  void navigateToSettings() {
    Get.toNamed('/settings');
    print("Navigating to Settings");
  }
}

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    // Register the controller (if not already done in binding)
    final FavoriteController controller = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoriteView'),
        backgroundColor: const Color.fromRGBO(230, 158, 243, 1),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                controller.navigateToHome();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                controller.navigateToSettings();
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                Navigator.pop(context);
                print("Already on Favorites View");
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/logo.png", width: 200, height: 200),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.menu, color: Colors.blue, size: 20.0),
                  SizedBox(width: 8.0),
                  Text(
                    'FavoriteView Content Area',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
