import 'package:cach_van/core/common/helpers/get_user.dart';
import 'package:dio/dio.dart';
import 'package:cach_van/core/utils/constants/api_end_points.dart';

class ApiService {
  final _baseUrl = 'http://10.0.1.148:8020/api/';
  // final _baseUrl = 'http://192.168.1.15:8020/api/';
  final Dio _dio;

  ApiService(this._dio) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final currentUser = getUser();
          if (currentUser.token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer ${currentUser.token}';
          }
          return handler.next(options);
        },
        onError: (e, handler) async {
          if (_shouldTryRefresh(e)) {
            final refreshed = await _refreshToken();
            if (refreshed) {
              final newUser = getUser();
              e.requestOptions.headers['Authorization'] = 'Bearer ${newUser.token}';

              try {
                final cloneResponse = await _dio.fetch(e.requestOptions);
                return handler.resolve(cloneResponse);
              } catch (e2) {
                return handler.next(e2 as DioException);
              }
            }
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Map<String, dynamic>> get({
    required String endPoint,
    required Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: queryParameters,
    );
    return Map<String, dynamic>.from(response.data);
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    final response = await _dio.post(
      '$_baseUrl$endPoint',
      queryParameters: query,
      data: data,
    );
    return Map<String, dynamic>.from(response.data);
  }

  bool _shouldTryRefresh(DioException e) {
    if (e.response?.statusCode != 401) return false;

    final path = e.requestOptions.path.toLowerCase();

    if (ApiEndPoints.authEndpoints.any(
      (endpoint) => path.contains(endpoint.toLowerCase()),
    )) {
      return false;
    }

    return true;
  }

  Future<bool> _refreshToken() async {
    final currentUser = getUser();
    if (currentUser.refreshToken.isEmpty) return false;

    try {
      final response = await _dio.post(
        '$_baseUrl${ApiEndPoints.refreshToken}',
        data: {
          'refreshToken': currentUser.refreshToken,
        },
      );

      final body = response.data as Map<String, dynamic>?;

      if (body == null || body['success'] != true) {
        return false;
      }

      final data = body['data'] as Map<String, dynamic>?;

      if (data == null) return false;

      final newToken = data['token'] as String? ?? '';
      final newRefresh = data['refreshToken'] as String? ?? '';
      final newExpires = data['expiresAtUtc'] as String? ?? '';

      if (newToken.isEmpty || newRefresh.isEmpty) {
        return false;
      }
      await updateUserTokens(
        token: newToken,
        refreshToken: newRefresh,
        expiresAtUtc: newExpires,
      );

      return true;
    } catch (_) {
      return false;
    }
  }
}
