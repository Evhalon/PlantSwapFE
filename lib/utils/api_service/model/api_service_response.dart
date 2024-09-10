/// ApiServiceResponse
abstract class ApiServiceResponse {
  /// ApiServiceResponse Constructor
  ApiServiceResponse({required this.data, this.header, this.isRedirect = false});

  /// response
  final dynamic data;

  /// headers
  final dynamic header;

  final bool isRedirect;
}
