import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/presentation/sale_note_screen/controller/sale_note_controller.dart';

class SaleNoteScreen extends StatelessWidget {
  final SaleNoteController controller = Get.put(SaleNoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Sale Note'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nombreEmpresaController,
              decoration: const InputDecoration(labelText: 'Nombre Empresa'),
            ),
            TextField(
              controller: controller.rutController,
              decoration: const InputDecoration(labelText: 'Rut'),
            ),
            TextField(
              controller: controller.direccionController,
              decoration: const InputDecoration(labelText: 'Dirección'),
            ),
            TextField(
              controller: controller.giroController,
              decoration: const InputDecoration(labelText: 'Giro'),
            ),
            TextField(
              controller: controller.netoController,
              decoration: const InputDecoration(labelText: 'Neto'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.ivaController,
              decoration: const InputDecoration(labelText: 'IVA'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.totalController,
              decoration: const InputDecoration(labelText: 'Total'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.skuController,
              decoration: const InputDecoration(labelText: 'SKU'),
            ),
            TextField(
              controller: controller.nombreProductoController,
              decoration: const InputDecoration(labelText: 'Nombre Producto'),
            ),
            TextField(
              controller: controller.cantidadController,
              decoration: const InputDecoration(labelText: 'Cantidad'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.detalleNetoController,
              decoration: const InputDecoration(labelText: 'Neto'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.detalleIvaController,
              decoration: const InputDecoration(labelText: 'IVA'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.detalleTotalController,
              decoration: const InputDecoration(labelText: 'Total'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.addDetalle,
              child: const Text('Agregar Detalle'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.saveSaleNote,
              child: const Text('Guardar Nota de Venta'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.detalles.length,
                itemBuilder: (context, index) {
                  final detalle = controller.detalles[index];
                  return ListTile(
                    title: Text(detalle.nombreProducto),
                    subtitle: Text('Cantidad: ${detalle.cantidad}, Neto: ${detalle.neto}, IVA: ${detalle.iva}, Total: ${detalle.total}'),
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
