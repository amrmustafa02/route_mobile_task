import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_mobile_task/core/error/MyError.dart';
import 'package:route_mobile_task/core/error/ServerError.dart';
import 'package:route_mobile_task/core/utils/app_assets.dart';
import 'package:route_mobile_task/features/posts/data/models/post_model.dart';
import 'package:route_mobile_task/features/posts/data/models/user_model.dart';
import 'package:route_mobile_task/features/posts/domain/entities/post_entity.dart';
import 'package:route_mobile_task/features/posts/domain/entities/user_entity.dart';
import 'package:route_mobile_task/features/posts/domain/repositories/posts_repo.dart';
import 'package:route_mobile_task/features/posts/domain/use_cases/use_case.dart';

@LazySingleton(as: UseCase<List<PostEntity>>)
class PostsUseCase extends UseCase<List<PostEntity>> {
  PostsRepo postsRepo;

  PostsUseCase(this.postsRepo);

  Future<Either<MyError, List<PostEntity>>> _fetchPosts({int page = 1}) async {
    var posts = await postsRepo.fetchPosts(page: page);
    List<PostEntity> postsEntities = [];
    return posts.fold(
      (l) {
        return Left(l);
      },
      (posts) async {
        var postsState = await _createPostsEntity(posts);
        return postsState.fold(
          (l) => Left(l),
          (r) {
            postsEntities = r;
            return Right(postsEntities);
          },
        );
      },
    );
  }

  Future<Either<MyError, List<PostEntity>>> _createPostsEntity(
      List<PostModel> posts) async {
    List<PostEntity> postsEntities = [];

    for (var post in posts) {
      var userEntity = await _getUserData(post.userId!);
      userEntity.fold(
        (l) {
          UserEntity userEntity = UserEntity(
              userAvatar: AppAssets.manAvatar,
              isActive: false,
              userName: "Not Found",
              userEmail: "Not Found",
              userId: 1);
          PostEntity postEntity = PostEntity(
            user: userEntity,
            postTitle: post.title,
            postContent: post.body,
            postId: post.id
          );
          postsEntities.add(postEntity);
        },
        (user) {
          postsEntities.add(_createPostEntity(post, user));
        },
      );
    }

    return Right(postsEntities);
  }

  Future<Either<MyError, UserModel>> _getUserData(num userId) {
    return postsRepo.getUserData(userId);
  }

  PostEntity _createPostEntity(PostModel post, UserModel user) {
    String userAvatar =
        (user.gender == "male") ? AppAssets.manAvatar : AppAssets.womenAvatar;

    bool isActive = (user.status == "active") ? true : false;

    UserEntity userPost = UserEntity(
      userId: user.id,
      userEmail: user.email,
      userName: user.name,
      isActive: isActive,
      userAvatar: userAvatar,
    );

    return PostEntity(
        postId: post.id,
        postContent: post.body,
        postTitle: post.title,
        user: userPost);
  }

  @override
  Future<Either<MyError, List<PostEntity>>> call({int page = 1}) {
    return _fetchPosts(page: page);
  }
}
