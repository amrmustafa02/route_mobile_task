import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:route_mobile_task/core/utils/app_colors.dart';
import 'package:route_mobile_task/features/posts/domain/entities/post_entity.dart';

import '../../../../config/routes/routes.dart';

class PostItem extends StatelessWidget {
  final PostEntity postEntity;

  const PostItem({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.bgPostColor,
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(postEntity.user!.userAvatar!),
                  ),
                  Visibility(
                    visible: postEntity.user!.isActive!,
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  postEntity.user!.userName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            postEntity.postTitle!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 16,
            ),
            postEntity.postContent!,
            trimLines: 4,
            colorClickableText: Colors.white,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'More',
            trimExpandedText: 'Less',
            moreStyle:
                TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8)),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(EneftyIcons.lovely_outline),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.postDetails,
                      arguments: postEntity);
                },
                icon: const Icon(EneftyIcons.message_2_outline),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(EneftyIcons.send_2_outline),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
