import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_swap/routes/routes_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.push(RouteConstantsPath.login);
        },
        child: const Text("Home Screen"));
  }
}
