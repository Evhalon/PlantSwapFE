part of '../../home/presentation/bloc/sign_up_bloc_cubit.dart';

sealed class ApiState {}

final class ApiInitial extends ApiState {}

final class ApiLoadingState extends ApiState {}

final class ApiErrorState extends ApiState {}

final class ApiSuccessState<T> extends ApiState {
  ApiSuccessState({required this.data});

  final T data;
}
