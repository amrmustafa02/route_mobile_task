import 'user_entity.dart';

class PostEntity {
 final num? postId;
 final String? postTitle;
 final String? postContent;
 final UserEntity? user;

  PostEntity({
    this.postId,
    this.postTitle,
    this.postContent,
    this.user,
  });
}
