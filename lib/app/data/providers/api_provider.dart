import 'package:dio/dio.dart';
import '../models/user_model.dart';

class ApiProvider {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://api.restful-api.dev/objects'),
  );

  Future<List<UserModel>> fetchObjects() async {
    try {
      final response = await _dio.get('/');
      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch objects: $e');
    }
  }

  Future<UserModel> createObject(UserModel user) async {
    try {
      final response = await _dio.post('/', data: user.toJson());
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create object: $e');
    }
  }

  Future<UserModel> updateObject(UserModel user) async {
    try {
      final response = await _dio.put('/${user.id}', data: user.toJson());
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update object: $e');
    }
  }

  Future<void> deleteObject(String id) async {
    try {
      await _dio.delete('/$id');
    } catch (e) {
      throw Exception('Failed to delete object: $e');
    }
  }
}
