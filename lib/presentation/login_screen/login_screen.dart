import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/presentation/login_screen/controller/login_controller.dart';
import 'package:induccion_flutter/routes/routes.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await controller.login();
                if (result) {
                  Get.toNamed(AppRoutes.homeScreen);
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
