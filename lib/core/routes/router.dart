import 'package:fitness_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/core/services/auth_service.dart';
import 'package:fitness_app/pages/home_page.dart';
import 'package:fitness_app/pages/login_page.dart';
import 'package:fitness_app/pages/not_found_page.dart';

enum Routes {
  login,
  register,
  home,
}

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: Routes.home.name,
        builder: (context, state) {
          return HomePage();
        },
      ),
      GoRoute(
        path: "/login",
        name: Routes.login.name,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: "/register",
        name: Routes.register.name,
        builder: (context, state) {
          return const RegisterPage();
        },
      ),
    ],
    redirect: (context, state) {
      final isAuth = AuthService().user != null;

      final isLoggingIn =
          state.location == "/login" || state.location == "/register";
      if (isLoggingIn) return isAuth ? "/" : null;

      return isAuth ? null : "/login";
    },
    errorBuilder: (context, state) => const NotFoundPage(),
  );
});
