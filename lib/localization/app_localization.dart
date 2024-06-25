import 'package:get/get.dart';
import 'es_cl/es_cl_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'es_CL': esCL,
  };
}
