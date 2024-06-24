import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/services/local_storage_service.dart';
import 'package:induccion_flutter/presentation/login_screen/models/user_model.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LocalStorageService storageService = LocalStorageService();

  void login() {
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
    } else {
      Get.snackbar('Login Failed', 'Invalid email or password');
    }
  }
}
