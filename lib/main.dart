import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'bindings/user_binding.dart';
import 'views/user_form_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: UserBinding(),
      initialRoute: '/user_form',
      getPages: [
        GetPage(name: '/user_form', page: () => UserFormPage(), binding: UserBinding()),
      ],
    );
  }
}
