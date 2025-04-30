import 'package:get/get.dart';

import '../../form/login/bindings/login_binding.dart';
import '../../form/login/views/login_view.dart';
import '../../form/loginform/bindings/loginform_binding.dart';
import '../../form/loginform/views/loginform_view.dart';
import '../../form/register/bindings/register_binding.dart';
import '../../form/register/views/register_view.dart';
import '../../view/slideShow/bindings/slide_show_binding.dart';
import '../../view/slideShow/views/slide_show_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SLIDE_SHOW,
      page: () => const SlideShowView(),
      binding: SlideShowBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGINFORM,
      page: () => const LoginformView(),
      binding: LoginformBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
  ];
}
