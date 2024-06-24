import 'package:get/get.dart';
import 'package:induccion_flutter/presentation/login_screen/login_screen.dart';
import 'package:induccion_flutter/presentation/login_screen/binding/login_binding.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static List<GetPage> pages = [
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),
  ];
}
