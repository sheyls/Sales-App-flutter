import 'package:get_storage/get_storage.dart';
import 'package:induccion_flutter/presentation/login_screen/models/user_model.dart';

class LocalStorageService {
  final box = GetStorage();

  Future<void> saveData(String key, Map<String, dynamic> value) async {
    await box.write(key, value);
  }
  
  UserModel? getUser() {
    final userData = box.read<Map<String, dynamic>>('user');
    if (userData != null) {
      return UserModel.fromJson(userData);
    }
    return null;
  }

  Future<void> removeUser() async {
    await box.remove('user');
  }

    Future<void> saveUser(UserModel user) async {
    await box.write('user', user.toJson());
  }

    List<String> getKeys() {
    return box.getKeys().cast<String>().toList();
  }

    Map<String, dynamic>? getData(String key) {
    return box.read<Map<String, dynamic>>(key);
  }
}
