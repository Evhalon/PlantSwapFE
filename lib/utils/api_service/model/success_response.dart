import 'package:plant_swap/utils/api_service/model/api_service_response.dart';

/// SuccessResponse
class SuccessResponse extends ApiServiceResponse {
  /// SuccessResponse Constructor
  SuccessResponse(
      {required super.data, super.header, super.isRedirect = false});
}
