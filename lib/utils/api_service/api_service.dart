import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_swap/utils/api_service/model/api_service_response.dart';
import 'package:plant_swap/utils/api_service/model/failure_response.dart';
import 'package:plant_swap/utils/api_service/model/success_response.dart';


/// classe [ApiService]
class ApiService {
  /// constructor
  ApiService({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  /// get
  Future<ApiServiceResponse> get({
    required String endpoint,
    required Map<String, dynamic> queryParameters,
    CancelToken? cancelToken,
    bool logResponse = true,
  }) async {
    try {
      debugPrint(
        'Endpoint: $endpoint',
      );
      debugPrint('QueryParameters: $queryParameters');

      final response = await _dio.get<dynamic>(
        endpoint,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );

      debugPrint(
        'Status code $endpoint: ${response.statusCode}',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return SuccessResponse(
          data: response.data,
          header: response.headers,
          isRedirect: response.isRedirect,
        );
      }

      debugPrint(
        'Status code $endpoint: ${response.statusCode}',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (logResponse) {
          debugPrint('Response $endpoint: ${response.data}');
        }

        return SuccessResponse(
          data: response.data,
          header: response.headers,
          isRedirect: response.isRedirect,
        );
      }
      debugPrint(
        'Status not 200 $endpoint: ${response.data}',
      );

      return FailureResponse(
        data: response.data,
        header: response.headers,
        isRedirect: response.isRedirect,
      );
    } on DioException catch (err) {
      return FailureResponse(data: 'error $err');
    } on FormatException catch (err) {
      debugPrint('Invalid Format $err');
      return FailureResponse(data: 'Invalid Format');
    } catch (e) {
      debugPrint('Error $endpoint: $e');
      return FailureResponse(data: 'Invalid Error');
    }
  }

  /// post
  Future<ApiServiceResponse> post({
    required String endpoint,
    required Object data,
    Map<String, dynamic>? headers,
    bool? followRedirects,
    String? contentType,
    CancelToken? cancelToken,
  }) async {
    debugPrint('Endpoint: $endpoint');
    debugPrint('Input: $data');
    debugPrint('Headers: $headers');

    try {
      final response = await _dio.post<dynamic>(
        endpoint,
        data: data,
        options: Options(
          headers: headers,
          followRedirects: followRedirects ?? true,
          contentType: contentType,
        ),
        cancelToken: cancelToken,
      );
      debugPrint('Status code $endpoint: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(
          'Response $endpoint: ${response.data}',
        );
        debugPrint(
          'Extra $endpoint: ${response.extra}',
        );
        return SuccessResponse(
          data: response.data,
          header: response.headers,
          isRedirect: response.isRedirect,
        );
      }
      debugPrint(
        'Status not 200 $endpoint: ${response.data}',
      );

      return FailureResponse(
        data: response.data,
        header: response.headers,
        isRedirect: response.isRedirect,
      );
    } on DioException catch (err) {
      debugPrint(
        'Error $endpoint: $err',
      );
      return FailureResponse(data: 'login_generic_error');
    } on FormatException {
      debugPrint('Invalid Format: FormatException');
      return FailureResponse(data: 'Invalid Format');
    } catch (e) {
      debugPrint(
        'Error $endpoint: $e',
      );
      return FailureResponse(data: 'Invalid Error');
    }
  }

  Future<ApiServiceResponse> delete({
    required String endpoint,
    required Object data,
    Map<String, dynamic>? headers,
    bool? followRedirects,
    CancelToken? cancelToken,
  }) async {
    debugPrint('Endpoint: $endpoint');
    debugPrint('Input: $data');
    debugPrint('Headers: $headers');

    try {
      final response = await _dio.delete<dynamic>(
        endpoint,
        data: data,
        options: Options(
          headers: headers,
          followRedirects: followRedirects ?? true,
        ),
        cancelToken: cancelToken,
      );
      debugPrint(
        'Status code $endpoint: ${response.statusCode}',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(
          'Response: ${response.data}',
        );
        return SuccessResponse(
          data: response.data,
          header: response.headers,
          isRedirect: response.isRedirect,
        );
      }
      debugPrint(
        'Status not 200 $endpoint: ${response.data}',
      );

      return FailureResponse(
        data: response.data,
        header: response.headers,
        isRedirect: response.isRedirect,
      );
    } on DioException catch (err) {
      debugPrint(
        'Error $endpoint: $err',
      );
      return FailureResponse(data: 'login_generic_error');
    } on FormatException {
      debugPrint('Invalid Format: FormatException');
      return FailureResponse(data: 'Invalid Format');
    } catch (e) {
      debugPrint('Error $endpoint: $e');
      return FailureResponse(data: 'Invalid Error');
    }
  }

  bool isJSON(dynamic str) {
    try {
      jsonDecode(str.toString());
    } catch (e) {
      return false;
    }
    return true;
  }
}
