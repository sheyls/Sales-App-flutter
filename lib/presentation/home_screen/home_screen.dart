import 'package:flutter/material.dart';
import 'package:induccion_flutter/services/local_storage_service.dart';
import 'package:induccion_flutter/presentation/login_screen/models/user_model.dart';

class MyHomePage extends StatelessWidget {
  final storageService = LocalStorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Storage Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                UserModel user = UserModel(
                  nombre: 'Sheyla',
                  apellido: 'Leyva',
                  email: 'sheyla@example.com',
                  password: 'password123',
                );
                await storageService.saveUser(user);
              },
              child: Text('Save User'),
            ),
            ElevatedButton(
              onPressed: () {
                UserModel? user = storageService.getUser();
                if (user != null) {
                  print('User: ${user.nombre} ${user.apellido}, Email: ${user.email}');
                } else {
                  print('No user found');
                }
              },
              child: Text('Get User'),
            ),
          ],
        ),
      ),
    );
  }
}
