import 'package:get/get.dart';

class HomeController extends GetxController {
  final foodItems =
      <FoodItems>[
        FoodItems(
          name: 'Ji-Pyeong Tuna Salad',
          price: 45.000,
          image: "assets/image/logo.png",
          isFavorite: false.obs,
        ),
        FoodItems(
          name: 'Another Tuna Salad',
          price: 50.000,
          image: "assets/image/logo.png",
          isFavorite: false.obs,
        ),
        FoodItems(
          name: 'Ji-Pyeong Tuna Salad',
          price: 45.000,
          image: "assets/image/logo.png",
          isFavorite: false.obs,
        ),
        FoodItems(
          name: 'Another Tuna Salad',
          price: 50.000,
          image: "assets/image/logo.png",
          isFavorite: false.obs,
        ),
        FoodItems(
          name: 'Ji-Pyeong Tuna Salad',
          price: 45.000,
          image: "assets/image/logo.png",
          isFavorite: false.obs,
        ),
        FoodItems(
          name: 'Another Tuna Salad',
          price: 50.000,
          image: "assets/image/logo.png",
          isFavorite: false.obs,
        ),
      ].obs;

  void toggleFavorite(FoodItems item) {
    item.isFavorite.value = !item.isFavorite.value;
  }

  @override
  void onInit() {
    super.onInit();
    // You can perform any initialization here
  }

  @override
  void onReady() {
    super.onReady();
    // Called after the widget is built and the initial dependencies are injected.
  }

  @override
  void onClose() {
    super.onClose();
    // Called when the controller is being removed from memory
  }
}

class FoodItems {
  final String name;
  final double price;
  final String image;
  final RxBool isFavorite;

  FoodItems({
    required this.name,
    required this.price,
    required this.image,
    required this.isFavorite,
  });
}
