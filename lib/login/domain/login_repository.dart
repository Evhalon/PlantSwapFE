import 'package:plant_swap/utils/api_service/model/api_service_response.dart';

abstract class LoginRepository{
  Future<ApiServiceResponse> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}
