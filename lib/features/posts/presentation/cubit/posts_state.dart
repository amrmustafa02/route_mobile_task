part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsErrorState extends PostsState {
  String message;

  PostsErrorState(this.message);
}

// ignore: must_be_immutable
class PostsSuccess extends PostsState {
  List<PostEntity>? posts;

  PostsSuccess({required this.posts});
}
