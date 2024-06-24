import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  final box = GetStorage();

  Future<void> saveData(String key, dynamic value) async {
    await box.write(key, value);
  }

  T? getData<T>(String key) {
    return box.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await box.remove(key);
  }
}
