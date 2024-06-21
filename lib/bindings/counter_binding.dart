// lib/bindings/counter_binding.dart
import 'package:get/get.dart';
import 'package:induccion_flutter/controllers/counter_controller.dart';
import 'package:induccion_flutter/repositories/counter_repository.dart';
import 'package:induccion_flutter/repositories/icounter_repository.dart';

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICounterRepository>(() => CounterRepository());
    Get.lazyPut(() => CounterController(Get.find()));
  }
}
