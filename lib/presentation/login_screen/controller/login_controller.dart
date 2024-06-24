import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/services/local_storage_service.dart';
import 'package:induccion_flutter/presentation/login_screen/models/user_model.dart';
import 'package:induccion_flutter/repositories/auth_repository.dart';
import 'package:induccion_flutter/repositories/auth_repository_imp.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LocalStorageService storageService = LocalStorageService();

  final AuthRepository authRepository = AuthService();

  Future<bool> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    // Aquí podrías agregar la lógica de autenticación real.
    if (email == 'sheyla@example.com' && password == 'password123') {
      UserModel user = UserModel(
        nombre: 'Sheyla',
        apellido: 'Leyva',
        email: email,
        password: password,
      );
      storageService.saveUser(user);
      Get.snackbar('Login Successful', 'Welcome, ${user.nombre}!');
      return true;

   // final result = await authRepository.login(email, password);
   // if (result['success']) {
   //   Get.snackbar('Login Successful', 'Welcome!');
    } else {
   //  Get.snackbar('Login Failed', result['message']);
      Get.snackbar('Login Failed', 'Invalid email or password');
      return false;

    }
  }
}