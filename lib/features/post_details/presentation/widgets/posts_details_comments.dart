import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_mobile_task/features/post_details/presentation/cubit/posts_details_cubit.dart';

import '../../../../core/components/loading_item.dart';
import 'comment_item.dart';

class PostsDetailsComments extends StatelessWidget {
  const PostsDetailsComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PostsDetailsCubit, PostsDetailsState>(
        builder: (context, state) {
          if (state is PostsDetailsInitial) return const LoadingItem();

          if (state is PostsDetailsError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
            );
          }

          if (state is PostsDetailsSuccess) {
            var comments = state.comments;
            return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) => CommentItem(
                commentModel: comments[index],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
