import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:induccion_flutter/presentation/login_screen/models/user_model.dart';
import 'package:induccion_flutter/services/local_storage_service.dart';
import 'package:induccion_flutter/repositories/auth_repository.dart';

class AuthService implements AuthRepository {
  final LocalStorageService storageService = LocalStorageService();

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    const url = 'https://induccion.test/api/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = UserModel(
        nombre: data['user']['nombre'],
        apellido: data['user']['apellido'],
        email: data['user']['email'],
        password: password,
        token: data['token'],
      );
      await storageService.saveUser(user);
      return {
        'success': true,
        'user': user,
      };
    } else {
      return {
        'success': false,
        'message': 'Invalid email or password',
      };
    }
  }
}
