import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'network_config.dart';

class DioManager {
  Dio getDioInstance() {
    final dio = Dio();
    final options = BaseOptions(
        headers: {'Content-Type': 'application/JSON'},
        baseUrl: NetworkConfig.baseURL,
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 50));
    dio.options = options;
    dio.interceptors.add(getInterceptors);
    return dio;
  }
}

final getInterceptors = InterceptorsWrapper(
  onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    // Do something before request is sent. Below is some sample code.

    // Add authentication token to the header
    options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
    // Log request details
    debugPrint('Request sent: ${options.path}');
    return handler.next(options);
  },
  onResponse: (Response response, ResponseInterceptorHandler handler) async {
    // Handle successful responses, logging, etc.
    debugPrint('Response[${response.statusCode}] => DATA: ${response.data}');

    return handler.next(response);
  },
  onError: (DioException error, ErrorInterceptorHandler handler) {
    // Do something with response error.

    // Handle errors, retry logic, logging, etc.
    debugPrint(
        'Error[${error.response?.statusCode}] => MESSAGE: ${error.message}');

    if (error.response?.statusCode == 401) {
      // Handle unauthorized error, refresh token logic, etc.
      debugPrint('Unauthorized! Refreshing token...');
    }
    return handler.next(error);
  },
);
