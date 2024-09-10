import 'package:flutter/material.dart';
import 'package:plant_swap/utils/routes/router.dart';

class App extends StatelessWidget {
  const App({super.key,});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.instance.router;
    return MaterialApp.router(
      title: 'PlantSwap',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      builder: (context, child) => RawGestureDetector(
        child: Scaffold(
          body: SafeArea(child: child ?? const SizedBox()),
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }
}
