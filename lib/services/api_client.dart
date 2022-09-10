import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class Client {
  String baseUrl = 'https://videoapp-2020.herokuapp.com/';
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(ApiInterceptor());
    _dio.options.baseUrl = baseUrl;
    return _dio;
  }
}

class ApiInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    GetStorage prefs = GetStorage();
    var token = prefs.read('token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
