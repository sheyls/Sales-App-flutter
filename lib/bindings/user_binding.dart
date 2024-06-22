import 'package:get/get.dart';
import 'package:induccion_flutter/controllers/user_controller.dart';
import 'package:induccion_flutter/repositories/user_repository.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IUserRepository>(() => UserRepository());
    Get.lazyPut(() => UserController(userRepository: Get.find()));
  }
}
