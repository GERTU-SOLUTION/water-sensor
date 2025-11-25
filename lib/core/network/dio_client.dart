import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_paths.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiRouteConfig.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // Хэрвээ хүсвэл interceptor нэмэж болно (лог гэх мэт)
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
});
