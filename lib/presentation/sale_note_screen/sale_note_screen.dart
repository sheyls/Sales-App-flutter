import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/presentation/sale_note_screen/controller/sale_note_controller.dart';

class SaleNoteScreen extends StatelessWidget {
  final SaleNoteController controller = Get.put(SaleNoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('create_sales_note'.tr),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nombreEmpresaController,
              decoration: InputDecoration(labelText: 'nombre_empresa'.tr),
            ),
            TextField(
              controller: controller.rutController,
              decoration: InputDecoration(labelText: 'rut'.tr),
            ),
            TextField(
              controller: controller.direccionController,
              decoration: InputDecoration(labelText: 'direccion'.tr),
            ),
            TextField(
              controller: controller.giroController,
              decoration: InputDecoration(labelText: 'giro'.tr),
            ),
            TextField(
              controller: controller.netoController,
              decoration: InputDecoration(labelText: 'neto'.tr),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.ivaController,
              decoration: InputDecoration(labelText: 'iva'.tr),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.totalController,
              decoration: InputDecoration(labelText: 'total'.tr),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.skuController,
              decoration: InputDecoration(labelText: 'sku'.tr),
            ),
            TextField(
              controller: controller.nombreProductoController,
              decoration: InputDecoration(labelText: 'nombre_producto'.tr),
            ),
            TextField(
              controller: controller.cantidadController,
              decoration: InputDecoration(labelText: 'cantidad'.tr),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.detalleNetoController,
              decoration: InputDecoration(labelText: 'neto'.tr),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.detalleIvaController,
              decoration: InputDecoration(labelText: 'iva'.tr),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.detalleTotalController,
              decoration: InputDecoration(labelText: 'total'.tr),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.addDetalle,
              child: Text('agregar_detalle'.tr),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.saveSaleNote,
              child: Text('guardar_nota_venta'.tr),
            ),
            SizedBox(height: 20),
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.detalles.length,
                itemBuilder: (context, index) {
                  final detalle = controller.detalles[index];
                  return ListTile(
                    title: Text(detalle.nombreProducto),
                    subtitle: Text(
                      '${'cantidad'.tr}: ${detalle.cantidad}, ${'neto'.tr}: ${detalle.neto}, ${'iva'.tr}: ${detalle.iva}, ${'total'.tr}: ${detalle.total}'
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
