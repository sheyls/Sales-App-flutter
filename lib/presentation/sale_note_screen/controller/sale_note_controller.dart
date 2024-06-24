import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/services/local_storage_service.dart';
import 'package:induccion_flutter/presentation/sale_note_screen/models/sale_note_model.dart';

class SaleNoteController extends GetxController {
  final nombreEmpresaController = TextEditingController();
  final rutController = TextEditingController();
  final direccionController = TextEditingController();
  final giroController = TextEditingController();
  final netoController = TextEditingController();
  final ivaController = TextEditingController();
  final totalController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController nombreProductoController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController detalleNetoController = TextEditingController();
  final TextEditingController detalleIvaController = TextEditingController();
  final TextEditingController detalleTotalController = TextEditingController();
  final detalles = <SaleDetail>[].obs; 
  
  final LocalStorageService storageService = LocalStorageService();

  void addDetalle() {
    try {
      final detalle = SaleDetail(
        sku: skuController.text,
        nombreProducto: nombreProductoController.text,
        cantidad: int.parse(cantidadController.text),
        neto: double.parse(detalleNetoController.text),
        iva: double.parse(detalleIvaController.text),
        total: double.parse(detalleTotalController.text),
      );
      detalles.add(detalle);
      clearDetalleFields();
    } catch (e) {
      Get.snackbar('Error', 'Invalid input. Please enter valid numbers for quantity, neto, iva, and total.');
    }
  }

  void clearDetalleFields() {
    skuController.clear();
    nombreProductoController.clear();
    cantidadController.clear();
    detalleNetoController.clear();
    detalleIvaController.clear();
    detalleTotalController.clear();
  }

  void saveSaleNote() async {
    try {
      final saleNote = SaleNote(
        nombreEmpresa: nombreEmpresaController.text,
        rut: rutController.text,
        direccion: direccionController.text,
        giro: giroController.text,
        neto: double.parse(netoController.text),
        iva: double.parse(ivaController.text),
        total: double.parse(totalController.text),
        detalles: detalles,
      );

      await storageService.saveData('sale_note_${DateTime.now().millisecondsSinceEpoch}', saleNote.toJson());
      Get.snackbar('Success', 'Sale note saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Invalid input. Please enter valid numbers for neto, iva, and total.');
    }
  }
}
