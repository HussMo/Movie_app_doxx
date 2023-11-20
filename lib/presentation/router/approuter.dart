import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../ui/home/home_screen.dart';
import '../ui/movie/movie_screen.dart';
import '../ui/splash/splash_screen.dart';
import 'approutes.dart';
import 'arguments.dart';


//TODO ADD IMPORTS TO SKIP THIS ERROR
class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: AppRoutes.splash,
        builder: (BuildContext ctx, GoRouterState state) {
          return const SplashScreen();
        }),
    GoRoute(
        path: AppRoutes.home, builder: (BuildContext ctx, GoRouterState state) {
      return const HomeScreen();
    }),
    GoRoute(path: AppRoutes.movie,
        builder: (BuildContext ctx, GoRouterState state) {
          return MovieScreen(arguments: state.extra as MovieArguments,);
        }),
  ]);
}
