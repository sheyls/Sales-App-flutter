import 'package:get/get.dart';
import 'package:induccion_flutter/services/local_storage_service.dart';
import 'package:induccion_flutter/presentation/sale_note_screen/models/sale_note_model.dart';

class SaleNoteReportController extends GetxController {
  final LocalStorageService storageService = LocalStorageService();
  final saleNotes = <SaleNote>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSaleNotes();
  }

  void loadSaleNotes() {
    final keys = storageService.getKeys();
    final notes = keys
        .where((key) => key.startsWith('sale_note_'))
        .map((key) => SaleNote.fromJson(storageService.getData(key)!))
        .toList();
    saleNotes.assignAll(notes);
  }
}
