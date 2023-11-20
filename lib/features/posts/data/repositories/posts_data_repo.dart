import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_mobile_task/core/error/MyError.dart';
import 'package:route_mobile_task/features/posts/data/data_sources/posts_data_source.dart';
import 'package:route_mobile_task/features/posts/data/models/post_model.dart';
import 'package:route_mobile_task/features/posts/data/models/user_model.dart';
import 'package:route_mobile_task/features/posts/domain/repositories/posts_repo.dart';

@LazySingleton(as: PostsRepo)
class PostsDataRepo extends PostsRepo {
  PostsDataSource dataSource;

  PostsDataRepo(this.dataSource);

  @override
  Future<Either<MyError, List<PostModel>>> fetchPosts({int page = 1}) {
    return dataSource.fetchPosts(page: page);
  }

  @override
  Future<Either<MyError, UserModel>> getUserData(num userId) {
    return dataSource.getUser(userId);
  }
}
