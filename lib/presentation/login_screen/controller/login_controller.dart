import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/repositories/auth_repository_Imp.dart';
import 'package:induccion_flutter/repositories/auth_repository.dart';
import 'package:induccion_flutter/routes/routes.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GetStorage storage = GetStorage();
  var isPasswordVisible = false.obs;

  final AuthRepository authRepository = AuthRepositoryImpl();

  Future<bool> login() async {
    final email = emailController.text;
    final password = passwordController.text;
    final response = await authRepository.login(email, password);

    if (response['token'] != null) {
        storage.write('token', response['token']);
        storage.write('userName', response['user']['name']);
        storage.write('userId', response['user']['id']);
        Get.snackbar('login'.tr, 'login_success'.tr);
        Get.offAllNamed(AppRoutes.homeScreen);
        return true;
      } else {
        print('Token not found in response');
        Get.snackbar('Error', 'login_failed'.tr);
        return false;
      }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}


      
      

