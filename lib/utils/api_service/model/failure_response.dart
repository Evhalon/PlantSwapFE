import 'package:plant_swap/utils/api_service/model/api_service_response.dart';

/// FailureResponse
class FailureResponse extends ApiServiceResponse {
  /// FailureResponse Constructor
  FailureResponse({required super.data, super.header, super.isRedirect = false});
}
