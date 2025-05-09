import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile2/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:mobile2/form/login/views/login_view.dart';

import 'app/routes/app_pages.dart';

void    main() {
  runApp(
    GetMaterialApp(
      title: "Small Team",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,

    ),
  );
}
