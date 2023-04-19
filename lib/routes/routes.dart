import 'package:go_router/go_router.dart';
import 'package:hero_to_zero/routes/route_names.dart';
import 'package:hero_to_zero/src/auth/login.dart';
import 'package:hero_to_zero/src/auth/presentation/inital_page.dart';
import 'package:hero_to_zero/src/auth/register.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
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
