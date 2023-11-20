import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:route_mobile_task/features/posts/domain/entities/post_entity.dart';
import 'package:route_mobile_task/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:route_mobile_task/core/components/loading_item.dart';
import 'package:route_mobile_task/features/posts/presentation/widgets/post_item.dart';

class PostsPageBody extends StatefulWidget {
  const PostsPageBody({super.key});

  @override
  _PostsPageBodyState createState() => _PostsPageBodyState();
}

class _PostsPageBodyState extends State<PostsPageBody> {

  final PagingController<int, PostEntity> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener(
      (pageKey) {
        pageKey++;
        _fetchPage(pageKey);
      },
    );
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await BlocProvider.of<PostsCubit>(context).fetchPosts(page: pageKey);
      _pagingController.appendPage(newItems, pageKey);
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) =>
      PagedListView<int, PostEntity>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<PostEntity>(
          firstPageProgressIndicatorBuilder: (context) => const LoadingItem(),
          itemBuilder: (context, item, index) => PostItem(
            postEntity: item,
          ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
