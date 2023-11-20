import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_mobile_task/core/error/MyError.dart';
import 'package:route_mobile_task/features/post_details/data/models/comment_model.dart';
import 'package:route_mobile_task/features/post_details/domain/repositories/posts_details_repo.dart';
import 'package:route_mobile_task/features/post_details/domain/use_cases/use_case.dart';

@LazySingleton(as: UseCase<List<CommentModel>>)
class PostDetailsUseCase implements UseCase<List<CommentModel>> {
  PostDetailsRepo _repo;

  PostDetailsUseCase(this._repo);

  @override
  Future<Either<MyError, List<CommentModel>>> getPostComments(num postId) {
    return _repo.getPostComments(postId);
  }
}
