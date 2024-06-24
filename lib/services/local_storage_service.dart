import 'package:get_storage/get_storage.dart';
import 'package:induccion_flutter/presentation/login_screen/models/user_model.dart';

class LocalStorageService {
  final box = GetStorage();

  Future<void> saveUser(UserModel user) async {
    await box.write('user', user.toJson());
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
}
