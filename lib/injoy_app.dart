import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_mobile_task/config/routes/app_routes.dart';
import 'package:route_mobile_task/config/routes/routes.dart';
import 'package:route_mobile_task/core/utils/app_colors.dart';

class InjoyApp extends StatelessWidget {
  const InjoyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
            titleTextStyle:
                GoogleFonts.playfair(fontSize: 28, fontWeight: FontWeight.bold),
            backgroundColor: AppColors.primaryColor,
            shadowColor: Colors.transparent),
      ),
      themeMode: ThemeMode.dark,
      initialRoute: Routes.splashPage,
      onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
    );
  }
}
