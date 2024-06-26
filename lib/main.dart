import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:induccion_flutter/routes/routes.dart';
import 'package:induccion_flutter/theme/theme_helper.dart';
import 'package:induccion_flutter/localization/app_localization.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sales App',
      theme: AppTheme.theme,
      initialRoute: AppRoutes.loginScreen,
      getPages: AppRoutes.pages,
      locale: const Locale('es', 'CL'),
      fallbackLocale: const Locale('es', 'CL'),
      translations: AppLocalization(),
    );
  }
}
