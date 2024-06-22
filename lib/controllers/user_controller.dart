import 'package:get/get.dart';
import 'package:induccion_flutter/models/user_model.dart';
import 'package:induccion_flutter/repositories/user_repository.dart';

class UserController extends GetxController {
  final IUserRepository userRepository;

  var user = Rx<User?>(null);

  UserController({required this.userRepository});

  Future<void> saveUser(User user) async {
    await userRepository.saveUser(user);
    this.user.value = user;
  }

  Future<void> loadUser() async {
    user.value = await userRepository.getUser();
  }

  Future<void> deleteUser() async {
    await userRepository.deleteUser();
    user.value = null;
  }
}
