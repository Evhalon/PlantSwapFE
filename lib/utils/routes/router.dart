import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_swap/home/presentation/screens/home_screen.dart';
import 'package:plant_swap/login/presentation/screens/login_screen.dart';
import 'package:plant_swap/utils/routes/routes_constants.dart';

class AppRouter {
  AppRouter._();

  static final AppRouter _instance = AppRouter._();
  static AppRouter get instance => _instance;
  final routeObserver = RouteObserver<ModalRoute<void>>();
  GoRouter router = GoRouter(routes: [
    GoRoute(
        path: RouteConstantsPath.home,
        name: RouteConstantsName.home,
        pageBuilder: (context, state) =>
            const MaterialPage(child: HomeScreen())),
    GoRoute(
        path: RouteConstantsPath.login,
        name: RouteConstantsName.login,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        }),
  ]);
}
