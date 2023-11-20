import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:route_mobile_task/features/posts/domain/entities/post_entity.dart';
import 'package:route_mobile_task/features/posts/domain/use_cases/use_case.dart';


part 'posts_state.dart';

@lazySingleton
class PostsCubit extends Cubit<PostsState> {


  UseCase<List<PostEntity>> useCase;

  PostsCubit({required this.useCase}) : super(PostsInitial());

  Future<List<PostEntity>> fetchPosts({int page = 100}) async {

    List<PostEntity> posts = [];
    var response = await useCase.call(page: page);
    response.fold(
      (l) {

        emit(PostsErrorState(l.message!));
      },
      (r) {
        posts = r;
        emit(PostsSuccess(posts: posts));
      },
    );
    return posts;
  }

 }
