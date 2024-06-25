import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/presentation/sale_note_report_screen/controller/sale_note_report_controller.dart';

class SaleNoteReportScreen extends StatelessWidget {
  final SaleNoteReportController controller = Get.put(SaleNoteReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('view_sales_notes'.tr),
      ),
      body: Obx(() {
        if (controller.saleNotes.isEmpty) {
          return Center(child: Text('no_sales_notes'.tr));
        } else {
          return ListView.builder(
            itemCount: controller.saleNotes.length,
            itemBuilder: (context, index) {
              final saleNote = controller.saleNotes[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${'empresa'.tr}: ${saleNote.nombreEmpresa}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('${'rut'.tr}: ${saleNote.rut}'),
                      Text('${'direccion'.tr}: ${saleNote.direccion}'),
                      Text('${'giro'.tr}: ${saleNote.giro}'),
                      Text('${'neto'.tr}: ${saleNote.neto}'),
                      Text('${'iva'.tr}: ${saleNote.iva}'),
                      Text('${'total'.tr}: ${saleNote.total}'),
                      const Divider(),
                      Text('${'detalles'.tr}:', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ...saleNote.detalles.map((detalle) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            '${detalle.nombreProducto} - ${'cantidad'.tr}: ${detalle.cantidad}, ${'neto'.tr}: ${detalle.neto}, ${'iva'.tr}: ${detalle.iva}, ${'total'.tr}: ${detalle.total}'
                          ),
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
