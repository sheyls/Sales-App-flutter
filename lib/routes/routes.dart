import 'package:get/get.dart';
import 'package:induccion_flutter/presentation/login_screen/login_screen.dart';
import 'package:induccion_flutter/presentation/login_screen/binding/login_binding.dart';
import 'package:induccion_flutter/presentation/sale_note_screen/sale_note_screen.dart';
import 'package:induccion_flutter/presentation/sale_note_screen/binding/sale_note_binding.dart';
import 'package:induccion_flutter/presentation/sale_note_report_screen/sale_note_report_screen.dart';
import 'package:induccion_flutter/presentation/sale_note_report_screen/controller/sale_note_report_controller.dart';
import 'package:induccion_flutter/presentation/home_screen/home_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';
  static const String homeScreen = '/home_screen';
  static const String saleNoteScreen = '/sale_note';
  static const String saleNoteReportScreen = '/sale_note_report';

  static List<GetPage> pages = [
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),
        GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: saleNoteScreen,
      page: () => SaleNoteScreen(),
      binding: SaleNoteBinding(),
    ),
    GetPage(
      name: saleNoteReportScreen,
      page: () => SaleNoteReportScreen(),
      binding: BindingsBuilder(() => Get.lazyPut<SaleNoteReportController>(() => SaleNoteReportController())),
    ),
  ];
}
