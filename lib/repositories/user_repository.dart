import 'package:get_storage/get_storage.dart';
import 'package:induccion_flutter/models/user_model.dart';

abstract class IUserRepository {
  Future<void> saveUser(User user);
  Future<User?> getUser();
  Future<void> deleteUser();
}

class UserRepository implements IUserRepository {
  final GetStorage storage = GetStorage();

  @override
  Future<void> saveUser(User user) async {
    await storage.write('user', user.toJson());
  }

  @override
  Future<User?> getUser() async {
    final data = storage.read('user');
    if (data != null) {
      return User.fromJson(data);
    }
    return null;
  }

  @override
  Future<void> deleteUser() async {
    await storage.remove('user');
  }
}
