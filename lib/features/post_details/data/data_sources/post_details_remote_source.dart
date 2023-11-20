import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_mobile_task/core/api/api_manager.dart';
import 'package:route_mobile_task/core/error/MyError.dart';
import 'package:route_mobile_task/core/error/ServerError.dart';
import 'package:route_mobile_task/features/post_details/data/data_sources/post_details_data_source.dart';
import 'package:route_mobile_task/features/post_details/data/models/comment_model.dart';

@LazySingleton(as: PostDetailsDataSource)
class PostDetailsRemoteSource extends PostDetailsDataSource {
  final ApiManager _apiManager;

  PostDetailsRemoteSource(this._apiManager);

  @override
  Future<List<CommentModel>> getPostComments(num postId) async {
    var commentsResponse = await _apiManager.getPostComments(postId);
    List<CommentModel> commentsModel = _handleComments(commentsResponse);
    return commentsModel;
  }

  List<CommentModel> _handleComments(List<dynamic> comments) {
    List<CommentModel> comments = [];

    for (var comment in comments) {
      comments.add(CommentModel.fromJson(comment));
    }

    return comments;
  }
}
