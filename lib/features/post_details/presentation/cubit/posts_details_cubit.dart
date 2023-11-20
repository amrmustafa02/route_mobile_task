import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:route_mobile_task/features/post_details/domain/use_cases/use_case.dart';

import '../../data/models/comment_model.dart';

part 'posts_details_state.dart';

@injectable
class PostsDetailsCubit extends Cubit<PostsDetailsState> {
  final UseCase<List<CommentModel>> _useCase;

  PostsDetailsCubit(this._useCase) : super(PostsDetailsInitial());

  Future<void> getPostComment(num postId) async {
    var commentsResponse = await _useCase.getPostComments(postId);
    commentsResponse.fold(
      (l) {

        emit(PostsDetailsError(message: l.message!));
        return;
      },
      (r) {
        print(r);
        emit(PostsDetailsSuccess(comments: r));
        return;
      },
    );
  }
}
