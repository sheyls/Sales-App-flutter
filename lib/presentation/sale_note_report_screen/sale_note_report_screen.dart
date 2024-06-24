import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/presentation/sale_note_report_screen/controller/sale_note_report_controller.dart';

class SaleNoteReportScreen extends StatelessWidget {
  final SaleNoteReportController controller = Get.put(SaleNoteReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporte de Notas de Venta'),
      ),
      body: Obx(() {
        if (controller.saleNotes.isEmpty) {
          return Center(child: Text('No hay notas de venta.'));
        } else {
          return ListView.builder(
            itemCount: controller.saleNotes.length,
            itemBuilder: (context, index) {
              final saleNote = controller.saleNotes[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Empresa: ${saleNote.nombreEmpresa}', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('RUT: ${saleNote.rut}'),
                      Text('Dirección: ${saleNote.direccion}'),
                      Text('Giro: ${saleNote.giro}'),
                      Text('Neto: ${saleNote.neto}'),
                      Text('IVA: ${saleNote.iva}'),
                      Text('Total: ${saleNote.total}'),
                      Divider(),
                      Text('Detalles:', style: TextStyle(fontWeight: FontWeight.bold)),
                      ...saleNote.detalles.map((detalle) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text('${detalle.nombreProducto} - Cantidad: ${detalle.cantidad}, Neto: ${detalle.neto}, IVA: ${detalle.iva}, Total: ${detalle.total}'),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
