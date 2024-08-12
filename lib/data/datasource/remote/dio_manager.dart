
import 'package:dio/dio.dart';
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
    // Do something before request is sent.
    // If you want to resolve the request with custom data,
    // you can resolve a `Response` using `handler.resolve(response)`.
    // If you want to reject the request with a error message,
    // you can reject with a `DioException` using `handler.reject(dioError)`.
    return handler.next(options);
  },
  onResponse: (Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  },
  onError: (DioException error, ErrorInterceptorHandler handler) {
    // Do something with response error.
    // If you want to resolve the request with some custom data,
    // you can resolve a `Response` object using `handler.resolve(response)`.
    return handler.next(error);
  },
);
