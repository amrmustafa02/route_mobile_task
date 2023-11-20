import 'package:dio/dio.dart';
import 'package:route_mobile_task/core/api/api_manager.dart';

Future<void> main() async {
  ApiManager api = ApiManager();
 var s = await api.getUserData(5746829);
 print(s);
}