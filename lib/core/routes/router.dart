import 'package:fitness_app/pages/exercise_edit_page.dart';
import 'package:fitness_app/pages/exercises_page.dart';
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
  exercises,
  exerciseEdit,
}

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: "/exercises",
    routes: [
      GoRoute(
        path: "/",
        name: Routes.home.name,
        redirect: (context, state) => "/exercises",
        builder: (context, state) {
          return HomePage();
        },
      ),
      GoRoute(
        path: "/exercises",
        name: Routes.exercises.name,
        builder: (context, state) {
          var weekday = int.tryParse(state.queryParams['weekday'] ?? "") ??
              DateTime.now().weekday;
          return ExercisesPage(weekdayNum: weekday);
        },
      ),
      GoRoute(
        path: "/exerciseEdit",
        name: Routes.exerciseEdit.name,
        builder: (context, state) {
          int? weekday;
          int? exerciseIndex;
          try {
            weekday = int.parse(state.queryParams['weekday']!);
            exerciseIndex = int.parse(state.queryParams['exerciseIndex']!);
          } catch (e) {
            context.goNamed(Routes.home.name);
          }

          return ExerciseEditPage(
              weekdayNum: weekday!, exerciseIndex: exerciseIndex!);
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
