// lib/views/counter_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterController c = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('GetX Counter')),
      body: Center(
        child: Obx(() => Text('Clicks: ${c.count}')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
