import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:route_mobile_task/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: AppColors.bgPostColor,
            highlightColor: Colors.white.withOpacity(0.1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(8),
              width: size.width,
              height: size.height*.17,
            ).animate().moveX(duration: const Duration(milliseconds: 200)),
          );
        },
      ),
    );
  }
}
