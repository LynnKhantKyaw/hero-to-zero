import 'package:go_router/go_router.dart';
import 'package:hero_to_zero/src/auth/login.dart';
import 'package:hero_to_zero/src/auth/presentation/inital_page.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'inital_page',
      builder: (context, state) => const InitalPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const Login(),
    )
  ],
);
