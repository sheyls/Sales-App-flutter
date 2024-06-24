import 'package:get/get.dart';
import 'package:induccion_flutter/presentation/sale_note_screen/controller/sale_note_controller.dart';

class SaleNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaleNoteController>(() => SaleNoteController());
  }
}
