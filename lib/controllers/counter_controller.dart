// lib/controllers/counter_controller.dart
import 'package:get/get.dart';
import 'package:induccion_flutter/repositories/icounter_repository.dart';

class CounterController extends GetxController {
  final ICounterRepository repository;

  CounterController(this.repository);

  var count = 0.obs;

  void increment() {
    count++;
    repository.setCount(count.value);
  }

  @override
  void onInit() {
    super.onInit();
    repository.getCount().then((value) => count.value = value);
  }
}