import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:movas_example/helper/logger.dart';

class Config {
  static const String PRODUCTION_URL = "https://jsonplaceholder.typicode.com";
}

class AppHttpService {
  final BuildContext context;
  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  var dio = Dio();

  Options _cacheOptions = buildCacheOptions(null);

  AppHttpService(this.context, {String baseUrl = Config.PRODUCTION_URL}) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 200000;
    dio.options.receiveTimeout = 50000;
    _cacheOptions = _cacheOptions.merge(
      contentType: Headers.formUrlEncodedContentType,
    );

    dio.interceptors.add(_dioCacheManager.interceptor);

    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options) {
        return options;
      }, onResponse: (Response response) {
        logger.info("response:");
        logger
            .info("HTTP Response  ${response.request.path} \n${response.data}");
      }, onError: (DioError error) {
        var data = jsonDecode(error.response.data);
        return data;
      }),
    );
  }
}
