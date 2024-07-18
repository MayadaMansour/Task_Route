import 'package:dio/dio.dart';

import '../../../../constants.dart';


import 'package:dio/dio.dart';

class DioFactory {
  final dio = createDio();

  DioFactory._private();

  static final _instance = DioFactory._private();

  factory DioFactory() => _instance;

  static Dio createDio() => Dio(
      BaseOptions(
          baseUrl: "https://dummyjson.com",
          receiveDataWhenStatusError: true,
          contentType: 'application/json',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 3),
          headers: {
            'lang': 'en',
          }
      )
  );
}

