import 'package:dio/dio.dart';

abstract class MyError {
  String? message;

  MyError({required this.message});
}
