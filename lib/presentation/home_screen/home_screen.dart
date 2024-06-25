import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenid@ a Sales App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.saleNoteScreen),
              child: const Text('Agregar Venta'),
            ),
            const SizedBox(height: 20), // Añade espacio entre los botones
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.saleNoteReportScreen),
              child: const Text('Ver Reporte de Ventas'),
            ),
          ],
        ),
      ),
    );
  }
}
