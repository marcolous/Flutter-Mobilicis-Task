import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://40.90.224.241:5000',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Dio get dio => _dio;
}
