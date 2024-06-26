import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:induccion_flutter/presentation/login_screen/models/user_model.dart';
import 'package:induccion_flutter/repositories/auth_repository.dart';

class AuthService implements AuthRepository {

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    const ngrokUrl = 'https://9f9b-138-199-50-102.ngrok-free.app/api/v1/auth/login';
    try {
      final response = await http.post(
        Uri.parse(ngrokUrl),
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
          id: data['user']['id'],
          name: data['user']['name'],
          email: data['user']['email'],
          token: data['token'],
        );
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
    } catch (e) {
      print('Error: $e');
      return {
        'success': false,
        'message': 'Connection failed',
      };
    }
  }
}
