import 'package:apex/core/network/data_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

String _baseUrl ='https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1/';

class  RetrofitClientInstance {

 static RetrofitClientInstance _instance = RetrofitClientInstance._internal();
  late Dio _dio;
  GetDataService? _client;

  RetrofitClientInstance._internal([String? authToken = '']) {
    _dio = Dio();
    //_dio.options.headers
    _dio.options.responseType = ResponseType.json;
    _dio.options.headers["accept"] = "application/json";
    _dio.options.headers["Authorization"] =
    authToken?.isEmpty == true ? '' : 'Bearer $authToken';
    _dio.options.connectTimeout = const Duration(seconds: 30);
    if (!kReleaseMode) {
      _dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
    }

    _client = GetDataService(_dio, baseUrl: _baseUrl);
  }

  static RetrofitClientInstance getInstance() {
    return _instance;
  }

  GetDataService? getDataService() {
    return _client;
  }

  void setToken(String? authToken) {
    _instance = RetrofitClientInstance._internal(authToken);
  }

}