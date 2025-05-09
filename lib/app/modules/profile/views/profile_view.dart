import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 228, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87, // Adjust as needed
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),
            _buildProfileMenuItem(
              title: 'My order history & ongoing',
              icon: Icons.receipt_long_outlined,
              onTap: () {
                // Navigate to order history screen
                Get.toNamed('/order_history');
              },
            ),
            _buildProfileMenuItem(
              title: 'Change language',
              icon: Icons.language_outlined,
              onTap: () {
                // Show language selection dialog or navigate to language settings
                _profileController.showLanguageOptions(context);
              },
            ),
            _buildProfileMenuItem(
              title: 'Quick login',
              icon: Icons.fingerprint,
              onTap: () {
                // Handle quick login functionality
                print('Quick login tapped');
              },
            ),
            _buildProfileMenuItem(
              title: 'Invite friends',
              icon: Icons.group_add_outlined,
              onTap: () {
                // Handle invite friends functionality
                print('Invite friends tapped');
              },
            ),
            _buildProfileMenuItem(
              title: 'Settings',
              icon: Icons.settings_outlined,
              onTap: () {
                // Navigate to settings screen
                Get.toNamed('/settings');
              },
            ),
            const SizedBox(height: 24),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(
            "assets/image/logo.png",
          ), // Replace with your asset
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'small team', // Replace with user's name
                // style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'smallTeam760@gmail.com', // Replace with user's email
                // style: Get.textTheme.subtitle2,
              ),
              Text(
                '+6238191818344', // Replace with user's phone number
                // style: Get.textTheme.subtitle2,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        OutlinedButton(
          onPressed: () {
            // Navigate to edit profile screen
            Get.toNamed('/edit_profile');
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.pink.shade400,
            side: BorderSide(color: Colors.pink.shade400),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text('Edit'),
        ),
      ],
    );
  }

  Widget _buildProfileMenuItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.brown.shade400),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                // style: Get.textTheme.subtitle1,
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return InkWell(
      onTap: () {
        _profileController.logout();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(Icons.logout, color: Colors.grey.shade600),
            const SizedBox(width: 16),
            Text(
              'Log out',
              // style: Get.textTheme.subtitle1!.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileController extends GetxController {
  // Add your logic here, e.g., for language selection, logout, etc.

  void showLanguageOptions(BuildContext context) {
    Get.bottomSheet(
      Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.translate),
            title: const Text('English'),
            onTap: () {
              // Handle English language selection
              Get.updateLocale(const Locale('en', 'US'));
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.translate),
            title: const Text('Khmer'), // Assuming Khmer is a language option
            onTap: () {
              // Handle Khmer language selection
              Get.updateLocale(const Locale('km', 'KH'));
              Get.back();
            },
          ),
          // Add more language options as needed
        ],
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  void logout() {
    // Implement your logout logic here (e.g., clear session, navigate to login)
    print('Logging out...');
    Get.offAllNamed('/login'); // Example navigation after logout
  }
}
