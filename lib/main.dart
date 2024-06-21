// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/bindings/counter_binding.dart';
import 'package:induccion_flutter/views/counter_page.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: CounterBinding(),
      home: CounterPage(),
    );
  }
}
