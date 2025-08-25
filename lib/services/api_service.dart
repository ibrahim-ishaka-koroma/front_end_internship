import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://api.restful-api.dev/objects'),
  );

  Future<List<Map<String, dynamic>>> getAllObjects() async {
    try {
      final response = await _dio.get('/');
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      throw Exception('Error fetching objects: $e');
    }
  }

  Future<Map<String, dynamic>> createObject(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/', data: data);
      return response.data;
    } catch (e) {
      throw Exception('Error creating object: $e');
    }
  }

  Future<Map<String, dynamic>> updateObject(
    String id,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await _dio.put('/$id', data: data);
      return response.data;
    } catch (e) {
      throw Exception('Error updating object: $e');
    }
  }

  Future<void> deleteObject(String id) async {
    try {
      await _dio.delete('/$id');
    } catch (e) {
      throw Exception('Error deleting object: $e');
    }
  }
}
