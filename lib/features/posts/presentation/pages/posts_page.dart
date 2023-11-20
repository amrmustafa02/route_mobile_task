import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:route_mobile_task/config/injection/di.dart';
import 'package:route_mobile_task/core/utils/app_strings.dart';
import 'package:route_mobile_task/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_mobile_task/features/posts/presentation/widgets/posts_page_body.dart';
import '../../../../core/components/loading_item.dart';
import '../widgets/post_item.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [],
      ),
      body: BlocProvider(
        create: (context) => getIt<PostsCubit>()..fetchPosts(),
        child: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {

            if (state is PostsInitial) {
              return const LoadingItem();
            }

            if (state is PostsErrorState) {
              return Container(
                margin: const EdgeInsets.all(8),
                child: const Center(
                  child: Text(
                    "Something went wrong, Please try again later",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              );
            }

            if (state is PostsSuccess) {
              return const PostsPageBody();
            }

            return Container();
          },
        ),
      ),
    );
  }
}
