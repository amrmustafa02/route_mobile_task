import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_mobile_task/core/api/api_manager.dart';
import 'package:route_mobile_task/core/error/MyError.dart';
import 'package:route_mobile_task/core/error/ServerError.dart';
import 'package:route_mobile_task/features/posts/data/data_sources/posts_data_source.dart';
import 'package:route_mobile_task/features/posts/data/models/post_model.dart';
import 'package:route_mobile_task/features/posts/data/models/user_model.dart';

@LazySingleton(as: PostsDataSource)
class PostsRemoteDataSource extends PostsDataSource {
  ApiManager apiManager;

  PostsRemoteDataSource(this.apiManager);

  @override
  Future<Either<MyError, List<PostModel>>> fetchPosts({int page = 1}) async {
    try {
      var posts = await apiManager.getPosts(page: page);
      return Right(handlePosts(posts));
    } catch (e) {
      return left(ServerError(message: e.toString()));
    }
  }

  List<PostModel> handlePosts(List<dynamic> posts) {
    List<PostModel> postsModel = [];
    for (var post in posts) {
      postsModel.add(PostModel.fromJson(post));
    }
    return postsModel;
  }

  @override
  Future<Either<MyError, UserModel>> getUser(num userId) async {
    try {
      var user = await apiManager.getUserData(userId);
      return Right(UserModel.fromJson(user));
    } catch (e) {
      return Left(ServerError(message: e.toString()));
    }
  }
}
