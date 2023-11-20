import 'package:dartz/dartz.dart';
import 'package:route_mobile_task/core/api/api_manager.dart';
import 'package:route_mobile_task/core/error/MyError.dart';
import 'package:route_mobile_task/features/posts/data/models/post_model.dart';
import 'package:route_mobile_task/features/posts/data/models/user_model.dart';

abstract class PostsDataSource {
  Future<Either<MyError, List<PostModel>>> fetchPosts({int page = 1});

  Future<Either<MyError, UserModel>> getUser(num userId);
}
