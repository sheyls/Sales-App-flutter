import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/services/local_storage_service.dart';
//import 'package:induccion_flutter/presentation/login_screen/models/user_model.dart';
import 'package:induccion_flutter/repositories/auth_repository.dart';
import 'package:induccion_flutter/repositories/auth_repository_imp.dart';
import 'package:induccion_flutter/routes/routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LocalStorageService storageService = LocalStorageService();
  var isPasswordVisible = false.obs;

  final AuthRepository authRepository = AuthService();

  Future<bool> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    final result = await authRepository.login(email, password);
    if (result['success']) {
      // Guardar usuario en almacenamiento local si es necesario
      if (result.containsKey('user')) {
        await storageService.saveUser(result['user']);
      }
      Get.snackbar('login'.tr, 'login_success'.tr);
      Get.offNamed(AppRoutes.homeScreen);
      return true;
    } else {
      Get.snackbar('Error', 'login_failed'.tr);
      return false;
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}


      
      

