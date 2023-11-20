import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:route_mobile_task/config/routes/routes.dart';
import 'package:route_mobile_task/core/utils/app_strings.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );

    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: size.width / 2,
                  height: size.width / 2,
                  child: const NeonPoint(
                    pointSize: 00,
                    pointColor: Colors.transparent,
                    spreadColor: Color(0xFF37454d),
                  ),
                ),
                const Text(
                  AppStrings.appName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ).animate().fadeIn(duration: const Duration(seconds: 1)),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: size.width / 4,
              child: const Divider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                "FROM INJOY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ).animate().fadeIn(duration: const Duration(seconds: 1)),
          ],
        ),
      ),
    );
  }
}
