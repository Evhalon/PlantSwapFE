import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_swap/login/domain/login_repository_impl.dart';

part '../../../utils/bloc/sign_up_bloc_state.dart';

class SignUpBlocCubit extends Cubit<ApiState> {
  SignUpBlocCubit() : super(ApiInitial());

  void signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    try {
      final response = await LoginRepositoryImpl().signUp(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      if(response.data != null){
        emit(ApiSuccessState<bool>(data: true));
      } else {
        emit(ApiErrorState());
      }
    } on Exception catch (e, stacktrace) {
      log("SignUp error -> $e");
      log("SignUp stack -> $stacktrace");
    }
  }
}
