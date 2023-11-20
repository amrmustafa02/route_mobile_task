import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_mobile_task/config/routes/routes.dart';
import 'package:route_mobile_task/features/post_details/presentation/pages/post_details_page.dart';
import 'package:route_mobile_task/features/posts/domain/entities/post_entity.dart';
import 'package:route_mobile_task/features/posts/presentation/pages/posts_page.dart';
import 'package:route_mobile_task/features/splash/presentation/pages/splash_page.dart';

class AppRoutes {
  static Route? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const PostsPage(),
        );

      case Routes.postDetails:
        PostEntity args = routeSettings.arguments as PostEntity;
        return MaterialPageRoute(
          builder: (context) => PostDetailsPage(post: args),
        );
    }
    return null;
  }
}
