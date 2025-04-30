import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/slide_show_controller.dart';

class SlideShowView extends GetView<SlideShowController> {
  const SlideShowView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Hello World🌍🌍',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
