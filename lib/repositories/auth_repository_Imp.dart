import 'auth_repository.dart';
import 'package:induccion_flutter/services/api_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService _apiService = ApiService();

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _apiService.post('/auth/login', {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      print('Login response: ${response.data}');
      return response.data;
    } else {
      print('Login failed with status: ${response.statusCode}');
      throw Exception('Credenciales incorrectas');
    }
  }
}
