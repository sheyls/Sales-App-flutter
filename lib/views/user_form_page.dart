import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induccion_flutter/controllers/user_controller.dart';
import 'package:induccion_flutter/models/user_model.dart';

class UserFormPage extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                User user = User(
                  name: nameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
                userController.saveUser(user);
                Get.snackbar("Success", "User saved successfully!");
              },
              child: Text("Save User"),
            ),
          ],
        ),
      ),
    );
  }
}
