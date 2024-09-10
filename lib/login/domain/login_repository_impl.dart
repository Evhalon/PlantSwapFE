import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:plant_swap/login/domain/login_repository.dart';
import 'package:plant_swap/utils/api_service/api_service.dart';
import 'package:plant_swap/utils/api_service/model/api_service_response.dart';
import 'package:plant_swap/utils/api_service/model/failure_response.dart';
import 'package:plant_swap/utils/api_service/model/success_response.dart';
import 'package:plant_swap/utils/utils_constants.dart';

class LoginRepositoryImpl extends LoginRepository {
  /// Private field to hold the ApiService instance
  final ApiService _apiService;

  /// LoginRepositoryImpl Constructor
  LoginRepositoryImpl() : _apiService = GetIt.instance<ApiService>();

  @override
  Future<ApiServiceResponse> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final response = await _apiService.post(
        endpoint: '${UtilsConstants.authApiBaseUrl}/signup',
        data: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
        },
      );
      log("RESPONSE $response");
      return SuccessResponse(data: response.data);
    } catch (e) {
      return FailureResponse(data: 'Sign up failed: $e');
    }
  }
}
