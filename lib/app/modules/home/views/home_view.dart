import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
// Ensure this import is correct

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),

      body: Column(children: [_buildHeader(), Expanded(child: _buildGrid())]),
      bottomNavigationBar: _buildBottomNavigationBar(),
      backgroundColor: const Color.fromRGBO(230, 158, 243, 1),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Center(
          child: Image.asset("assets/image/logo.png", width: 90, height: 90),
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
                        // Handle search
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

  Widget _buildGrid() {
    return Obx(
      () => GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: controller.foodItems.length,
        itemBuilder: (_, index) {
          final FoodItems item = controller.foodItems[index];
          return _foodItem(item, index);
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (index) {
        // Handle navigation based on the index
        print('Bottom navigation item tapped: $index');
      },
    );
  }

  Widget _foodItem(FoodItems item, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align items to the start
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Align favorite icon to the end
              children: [
                InkWell(
                  child: Obx(
                    () => Icon(
                      item.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          item.isFavorite.value
                              ? Colors.redAccent
                              : Colors.grey,
                      size: 24.0,
                    ),
                  ),
                  onTap: () => controller.toggleFavorite(item),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Center(
                child: Image.asset(
                  item.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              item.name,
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
                const Icon(
                  Icons.add_circle,
                  color: Colors.redAccent,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
