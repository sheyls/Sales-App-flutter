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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Image.asset(
              'assets/images/logo.jpeg',
              height: 70,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 16),
                    Obx(() => TextField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            labelText: 'password'.tr,
                            suffixIcon: IconButton(
                              icon: Icon(controller.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                          ),
                          obscureText: !controller.isPasswordVisible.value,
                        )),
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
            ),
          ),
        ],
      ),
    );
  }
}
