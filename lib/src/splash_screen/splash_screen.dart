import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hero_to_zero/routes/route_names.dart';
import 'package:hero_to_zero/shared/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _inital();
    super.initState();
  }

  void _inital() async {
    await Future.delayed(const Duration(seconds: 3))
        .then((value) => GoRouter.of(context).pushNamed(RouteNames.initalPage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: const FlutterLogo(
                style: FlutterLogoStyle.markOnly,
              ),
            ).animate(
              onPlay: (controller) {
                controller.repeat();
              },
            ).shimmer(
                color: Colors.blue,
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 1500)),
            kDividerV,
            const Text(
              'Power by Nyi Ma Lay...',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ).animate(
              onPlay: (controller) {
                controller.repeat();
              },
            ).shimmer(
                color: Colors.blue,
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 1500)),
          ],
        ),
      ),
    );
  }
}
