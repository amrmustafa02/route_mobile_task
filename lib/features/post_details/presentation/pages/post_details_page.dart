import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_mobile_task/config/injection/di.dart';
import 'package:route_mobile_task/core/components/loading_item.dart';
import 'package:route_mobile_task/core/utils/app_colors.dart';
import 'package:route_mobile_task/features/post_details/presentation/cubit/posts_details_cubit.dart';
import 'package:route_mobile_task/features/post_details/presentation/widgets/comment_item.dart';
import 'package:route_mobile_task/features/posts/domain/entities/post_entity.dart';
import 'package:shimmer/shimmer.dart';

class PostDetailsPage extends StatelessWidget {
  final PostEntity post;

  const PostDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            getIt<PostsDetailsCubit>()..getPostComment(post.postId!),
        child: BlocConsumer<PostsDetailsCubit, PostsDetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // user details
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(post.user!.userAvatar!),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              post.user!.userName!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 22),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              post.user!.userEmail!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              post.user!.isActive! ? "Active" : "Inactive",
                              style: TextStyle(
                                  color: post.user!.isActive!
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  // post details
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    post.postTitle!,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: size.height * .20,
                    child: SingleChildScrollView(
                      child: Text(
                        post.postContent!,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  // comments
                  const Expanded(
                      child: LoadingItem()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
