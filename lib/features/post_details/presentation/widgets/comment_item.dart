import 'package:flutter/material.dart';
import 'package:route_mobile_task/core/utils/app_assets.dart';
import 'package:route_mobile_task/features/post_details/data/models/comment_model.dart';

import '../../../../core/utils/app_colors.dart';

class CommentItem extends StatelessWidget {
  final CommentModel commentModel;

  const CommentItem({super.key, required this.commentModel});

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
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AppAssets.manAvatar),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                commentModel.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            commentModel.body ?? "",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
