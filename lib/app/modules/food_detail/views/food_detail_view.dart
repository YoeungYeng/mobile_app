import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/food_detail_controller.dart';

class FoodDetailView extends GetView<FoodDetailController> {
  const FoodDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCEBF2), // Soft pink background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Location & Delivery Time
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5),
                            ],
                          ),
                          child: Row(
                            children: [Icon(Icons.location_on, size: 28)],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Please select your location",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.access_time_outlined, size: 28),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery Time",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "25-30 minutes",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              ///Food Image
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Container(
                  height: 360,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey,
                  ),
                  child: Image.asset(
                    'assets/image/logo.png', // Replace with your image
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              /// Food Title & Price
              Text(
                "Ji-Pyeong Tuna Salad",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              /// Quantity Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rp. 45,000",
                    style: TextStyle(fontSize: 18, color: Colors.pink),
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Row(
                          children: [
                            _quantityButton(Icons.remove, controller.decrement),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                '${controller.quantity}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            _quantityButton(Icons.add, controller.increment),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              /// Recipe Description
              SizedBox(height: 8.0),
              Text(
                "Recipe:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text("Tuna salad", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                maxLines: 3,
                " is a light and fresh comfort food classic. Made with a few simple ingredients such as tuna, mayonnaise, onion and celery...",
              ),
              Text("more", style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black12,
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
