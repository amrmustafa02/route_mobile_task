import 'package:dartz/dartz.dart';
import 'package:route_mobile_task/core/error/MyError.dart';
import 'package:route_mobile_task/features/post_details/data/models/comment_model.dart';

abstract class PostDetailsDataSource {
  Future<List<CommentModel>> getPostComments(num postId);
}
