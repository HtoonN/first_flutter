import 'package:dio/dio.dart';
import 'package:my_project/Model/post_model.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.baseUrl =
        'https://jsonplaceholder.typicode.com'; // Example URL
  }

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _dio.get('/posts');
      return (response.data as List)
          .map((post) => Post.fromJson(post))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
