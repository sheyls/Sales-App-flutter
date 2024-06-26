import 'package:dio/dio.dart';
import 'package:get/get.dart' as Get;
import 'package:get_storage/get_storage.dart';
import 'package:induccion_flutter/core/helpers/constants.dart';

class ApiService {
  final Dio dio = Dio();
  final GetStorage storage = GetStorage();
  final String _baseUrl = '${url()}/api/v1';

  ApiService();

  Future<Response> getWithToken(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final token = storage.read('token');

    if (token == null) {
      throw Exception('No se encontró un token almacenado');
    }

    final options = Options(headers: {'Authorization': 'Bearer $token'});

    try {
      final response = await dio.get(_baseUrl + path,
          queryParameters: queryParameters, options: options);
      return response;
    } catch (error) {
      print(error.toString());
      return Response(
          statusCode: 500, requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> postWithToken(String path, dynamic data) async {
    final token = storage.read('token');

    if (token == null) {
      throw Exception('No se encontró un token almacenado');
    }

    final options = Options(headers: {'Authorization': 'Bearer $token'});

    try {
      final response =
          await dio.post(_baseUrl + path, data: data, options: options);
      return response;
    } catch (error) {
      print(error.toString());
      return Response(
          statusCode: 500, requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.get(_baseUrl + path, queryParameters: queryParameters);
      return response;
    } catch (error) {
      print(error.toString());
      return Response(
          statusCode: 500, requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.delete(_baseUrl + path, queryParameters: queryParameters);
      return response;
    } catch (error) {
      print(error.toString());
      return Response(
          statusCode: 500, requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await dio.post(_baseUrl + path, data: data);
      print('Response data: ${response.data}');
      return response;
    } catch (error) {
      print(error.toString());
      return Response(
          statusCode: 500, requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> postFormData(String path, Map<String, dynamic> data) async {
    try {
      FormData formData = FormData.fromMap(data);
      final response = await dio.post(_baseUrl + path, data: formData);
      return response;
    } catch (error) {
      if (error is DioError && error.response?.statusCode == 401) {
        storage.erase();
        Get.Get.offAllNamed('/auth/login');
      }

      print(error.toString());
      return Response(
          statusCode: 500, requestOptions: RequestOptions(path: ''));
    }
  }
}
