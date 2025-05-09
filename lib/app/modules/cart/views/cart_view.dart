import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile2/app/routes/app_pages.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  // Sample list of cart items (replace with your actual data)
  final List<Map<String, String>> cartItems = const [
    {'name': 'Jinopeng Salad', 'price': '\$20.55'},
    {'name': 'Another Item', 'price': '\$15.99'},
    {'name': 'Yet Another Salad', 'price': '\$22.75'},
    {'name': 'Yet Another Salad', 'price': '\$22.75'},
    {'name': 'Yet Another Salad', 'price': '\$22.75'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(250, 228, 243, 1),
        body: Center(
          child: Column(
            children: [
              Image.asset("assets/image/logo.png", width: 100, height: 100),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        Routes.PAYMENT,
                      ); // Connect to controller logic
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Continues your checkout'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          // Display one item per row (vertically)
                          childAspectRatio: 4 / 1,
                          // Adjust aspect ratio as needed
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                        ),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            vertical: BorderSide(color: Colors.grey),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/image/logo.png",
                                width: 80,
                                height: 80,
                              ),
                              const SizedBox(width: 8.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text("1 Item ${item['name']}"),
                                  Text(item['price']!),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Icon(Icons.timelapse, size: 30), Text("Delivery")],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
