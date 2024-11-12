import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:my_project/dio_service.dart';

// Provider for Dio instance
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

// Provider for ApiService
final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

// Provider to fetch posts data
final postsProvider = FutureProvider((ref) async {
  final apiService = ref.watch(apiServiceProvider);

  final res = await apiService.fetchPosts();
  print(res[0].title);
  return res;
});
