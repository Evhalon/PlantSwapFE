import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plant_swap/app.dart';
import 'package:plant_swap/utils/api_service/api_service.dart';
final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: getIt<Dio>()));
}
void main() {
  setupLocator();
  runApp(const App());
}
