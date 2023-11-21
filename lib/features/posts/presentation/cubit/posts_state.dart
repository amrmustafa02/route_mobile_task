part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsErrorState extends PostsState {
  final String message;

  PostsErrorState(this.message);
}

class PostsSuccess extends PostsState {}
