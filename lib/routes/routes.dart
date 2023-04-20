import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hero_to_zero/routes/route_names.dart';
import 'package:hero_to_zero/src/auth/presentation/login.dart';
import 'package:hero_to_zero/src/auth/presentation/inital_page.dart';
import 'package:hero_to_zero/src/auth/presentation/register.dart';
import 'package:hero_to_zero/src/splash_screen/splash_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final token = ref.watch(myTokenProvider);
  return GoRouter(
    initialLocation:
        token ? '/${RouteNames.dashboard}' : '/${RouteNames.initalPage}',
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/${RouteNames.initalPage}',
        name: RouteNames.initalPage,
        builder: (context, state) => const InitalPage(),
      ),
      GoRoute(
        path: '/${RouteNames.login}',
        name: RouteNames.login,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/${RouteNames.register}',
        name: RouteNames.register,
        builder: (context, state) => const Register(),
      ),
    ],
  );
});
