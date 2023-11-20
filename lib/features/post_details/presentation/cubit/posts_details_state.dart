part of 'posts_details_cubit.dart';

@immutable
abstract class PostsDetailsState {}

class PostsDetailsInitial extends PostsDetailsState {}

class PostsDetailsSuccess extends PostsDetailsState {
  List<CommentModel> comments;

  PostsDetailsSuccess({required this.comments});
}

class PostsDetailsError extends PostsDetailsState {
  String message;

  PostsDetailsError({required this.message});
}
