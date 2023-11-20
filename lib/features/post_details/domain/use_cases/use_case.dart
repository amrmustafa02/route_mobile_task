import 'package:dartz/dartz.dart';
import 'package:route_mobile_task/core/error/MyError.dart';

abstract class UseCase<T> {
  Future<Either<MyError, T>> getPostComments(num postId);
}
