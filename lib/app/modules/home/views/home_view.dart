import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile2/app/modules/home/model/Product.dart';
import 'package:image_network/image_network.dart';
import '../controllers/home_controller.dart';
// Ensure this import is correct

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [_buildHeader(), Expanded(child: _buildGrid(context))],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
        backgroundColor: const Color.fromRGBO(230, 158, 243, 1),
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

  Widget _buildGrid(context) {
    final HomeController controller = Get.find();
    List<Data> item = controller.productList;
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
        itemCount: item.length,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [], // You can add favorite icon here
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0),

                      child: Center(
                        child: InkWell(
                          child: ImageNetwork(
                            onTap: () {
                              showModalBottomSheet(
                                // backgroundColor: Colors.transparent,
                                // allows rounded corners
                                context: context,
                                isScrollControlled: true,

                                // Add this line
                                builder: (BuildContext context) {
                                  return Container(
                                    // Add this line
                                    height:
                                        MediaQuery.of(
                                          context,
                                        ).size.height, // make it full screen
                                    child: SingleChildScrollView(
                                      padding: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(
                                              context,
                                            ).viewInsets.bottom,
                                        left: 16,
                                        right: 16,
                                        top: 16,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /// Location & Delivery Time
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            12,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              16,
                                                            ),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            blurRadius: 5,
                                                          ),
                                                        ],
                                                      ),
                                                      child: const Row(
                                                        children: [
                                                          Icon(
                                                            Icons.location_on,
                                                            size: 28,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8.0),
                                                  const Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Location",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Please select your location",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8.0),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            12,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              16,
                                                            ),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            blurRadius: 5,
                                                          ),
                                                        ],
                                                      ),
                                                      child: const Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .access_time_outlined,
                                                            size: 28,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8.0),
                                                  const Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Delivery Time",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "25-30 minutes",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                          ///Food Image
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 16.0,
                                            ),
                                            child: Container(
                                              height: 360,
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.grey,
                                              ),
                                              child: ImageNetwork(
                                                image: "${item[index].image}",
                                                height: 350.0,
                                                width: 240.0,
                                                duration: 1500,
                                                curve: Curves.easeIn,
                                                onPointer: true,
                                                debugPrint: false,
                                                backgroundColor: Colors.blue,
                                                fitAndroidIos: BoxFit.cover,
                                                fitWeb: BoxFitWeb.cover,
                                                onLoading: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              ),
                                            ),
                                          ),

                                          /// Food Title & Price
                                          Text(
                                            item[index].title.toString(),
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          /// Quantity Selector
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Rp. ${item[index].price}",
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.pink,
                                                ),
                                              ),
                                              Obx(
                                                () => Row(
                                                  children: [
                                                    _quantityButton(
                                                      Icons.remove,
                                                      controller.decrement,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 8.0,
                                                          ),
                                                      child: Text(
                                                        '${controller.quantity}',
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    _quantityButton(
                                                      Icons.add,
                                                      controller.increment,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),

                                          /// Recipe Description
                                          const SizedBox(height: 8.0),
                                          const Text(
                                            "Recipe:",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            item[index].title.toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(
                                            maxLines: 3,
                                            " is a light and fresh comfort food classic. Made with a few simple ingredients such as tuna, mayonnaise, onion and celery...",
                                          ),
                                          const Text(
                                            "more",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            image: "${item[index].image}",
                            height: 190,
                            width: 190,
                            onLoading: const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      item[index].title.toString(),
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
                          "Rp. ${item[index].price}",
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
            ),
          );
        },
      );
    });
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
