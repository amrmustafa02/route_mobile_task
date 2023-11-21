import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:route_mobile_task/features/posts/domain/entities/post_entity.dart';
import 'package:route_mobile_task/features/posts/domain/use_cases/use_case.dart';

part 'posts_state.dart';

@lazySingleton
class PostsCubit extends Cubit<PostsState> {
  final UseCase<List<PostEntity>> _useCase;
  List<PostEntity> _posts = [];

  PostsCubit({required UseCase<List<PostEntity>> useCase})
      : _useCase = useCase,
        super(PostsInitial());

  Future<List<PostEntity>> fetchPosts({int page = 100}) async {
    var response = await _useCase.call(page: page);
    response.fold(
      (l) {
        emit(PostsErrorState(l.message!));
      },
      (r) {
        _posts = r;
        emit(PostsSuccess());
      },
    );
    return _posts;
  }
}
