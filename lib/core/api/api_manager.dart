import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_mobile_task/core/api/end_points.dart';

@singleton
class ApiManager {
  static const _baseUrl = "https://gorest.co.in/public/v2";

  late Dio _dio;

  ApiManager() {
    _dio = Dio();
  }

  Future<List<dynamic>> getPosts({int page = 1}) async {

    var response = await _dio
        .get(_baseUrl + EndPoints.posts, queryParameters: {"page": page});

    return response.data;
  }

  Future<dynamic> getUserData(num userId) async {
    var response = await _dio.get("$_baseUrl${EndPoints.user}/$userId");
    return response.data;
  }

  Future<List<dynamic>> getPostComments(num postId) async {
    var response = await _dio
        .get("$_baseUrl${EndPoints.posts}/$postId${EndPoints.comments}");
    return response.data;
  }
}
