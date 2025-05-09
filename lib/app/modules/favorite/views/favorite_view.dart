import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(child: _buildGrid(context)),
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(250, 228, 243, 1),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Center(
          child: Image.asset("assets/image/logo.png", width: 200, height: 200),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              const Icon(Icons.menu, color: Colors.blue, size: 20.0),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: IconButton(
                      onPressed: () {
                        // TODO: Implement search logic
                      },
                      icon: const Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGrid(BuildContext context) {
    final controller = Get.find<FavoriteController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: controller.favoriteList.length,
        itemBuilder: (_, index) {
          final item = controller.favoriteList[index];

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.favorite, color: Colors.redAccent),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _showBottomSheet(context, item, controller);
                      },
                      child: ImageNetwork(
                        image: item.image ?? '',
                        height: 200,
                        width: 200,
                        onLoading: const CircularProgressIndicator(),
                        fitAndroidIos: BoxFit.cover,
                        fitWeb: BoxFitWeb.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                    child: Text(
                      item.title ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rp. ${item.price}",
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(Icons.add_circle, color: Colors.redAccent, size: 24.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  void _showBottomSheet(BuildContext context, item, FavoriteController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLocationDeliverySection(),
              const SizedBox(height: 16),
              Container(
                height: 360,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey,
                ),
                child: ImageNetwork(
                  image: item.image ?? '',
                  height: 350,
                  width: 240,
                  fitAndroidIos: BoxFit.cover,
                  fitWeb: BoxFitWeb.cover,
                  onLoading: const Center(child: CircularProgressIndicator()),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                item.title ?? '',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rp. ${item.price}",
                    style: const TextStyle(fontSize: 18, color: Colors.pink),
                  ),
                  Row(
                    children: [
                      _quantityButton(Icons.remove, controller.decrement),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Obx(() => Text(
                          '${controller.quantity.value}',
                          style: const TextStyle(fontSize: 18),
                        )),
                      ),
                      _quantityButton(Icons.add, controller.increment),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text("Recipe:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(item.title ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text(
                maxLines: 3,
                " is a light and fresh comfort food classic. Made with a few simple ingredients such as tuna, mayonnaise, onion and celery...",
              ),
              const Text("more", style: TextStyle(color: Colors.red)),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLocationDeliverySection() {
    return Column(
      children: [
        Row(
          children: [
            _iconBox(Icons.location_on),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Location", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Please select your location", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _iconBox(Icons.access_time_outlined),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Delivery Time", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("25-30 minutes", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _iconBox(IconData icon) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Icon(icon, size: 28),
      ),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black12,
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
