import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_mobile_task/core/error/MyError.dart';
import 'package:route_mobile_task/core/error/ServerError.dart';
import 'package:route_mobile_task/features/post_details/data/data_sources/post_details_data_source.dart';
import 'package:route_mobile_task/features/post_details/data/models/comment_model.dart';
import 'package:route_mobile_task/features/post_details/domain/repositories/posts_details_repo.dart';

@LazySingleton(as: PostDetailsRepo)
class PostDetailsDataRepo extends PostDetailsRepo {
  final PostDetailsDataSource _dataSource;

  PostDetailsDataRepo(this._dataSource);

  @override
  Future<Either<MyError, List<CommentModel>>> getPostComments(
      num postId) async {
    try {
      var comments = await _dataSource.getPostComments(postId);
      return Right(comments);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDio(e));
      } else {
        return Left(ServerError(message: e.toString()));
      }
    }
  }
}
