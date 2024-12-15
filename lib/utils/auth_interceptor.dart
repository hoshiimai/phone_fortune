import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as get_x;

import '../../utils/app_shared.dart';
import 'app_pages.dart';

class AuthInterceptor extends Interceptor {
  bool _isRefreshing = false;
  List<Map<dynamic, dynamic>> failedRequests = [];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST: ${options.uri}\n'
        'data=${options.data}\n'
        'method=${options.method}\n'
        'headers=${options.headers}\n'
        'queryParameters=${options.queryParameters}');
    final appShared = get_x.Get.find<AppShared>();
    final token = appShared.getAccessTokenValue();
    if (token != null) {
      log('Authorization bearer $token');
      options.headers.putIfAbsent('Authorization', () => 'bearer $token');
    }
    final languageCode = appShared.getLanguageCode();
    options.queryParameters.putIfAbsent('lang', () => languageCode ?? 'en');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    log('RESPONSE: ${response.realUri}\n Body: ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('RESPONSE: ${err.response?.realUri}\n Body: ${err.response?.data}');
    final appShared = get_x.Get.find<AppShared>();
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      try {
        failedRequests.add({'response': err.response, 'handler': handler});
        if (!_isRefreshing) {
          // Refresh token
          // final isRefreshSuccess = await refreshToken();
          // // Retry failed requests
          // if (isRefreshSuccess) {
          //   retryRequest(appShared.getAccessTokenValue()!);
          // } else {
          //   _logOut(appShared);
          // }
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
    if (err.response?.statusCode == HttpStatus.paymentRequired) {
      // Force logout when receive 402
      _logOut(appShared);
    } else {
      return super.onError(err, handler);
    }
  }

  // Future<bool> refreshToken() async {
  //   final appShared = get_x.Get.find<AppShared>();
  //   final refreshToken = appShared.getRefreshToken();
  //   if (refreshToken?.isEmpty ?? true) {
  //     _logOut(appShared);
  //     return false;
  //   }
  //   _isRefreshing = true;
  //   try {
  //     return get_x.Get.find<IAuthRepository>().refreshToken(refreshToken!).then((response) async {
  //       return response.fold((error) {
  //         // Force logout
  //         showErrorToast(error.message);
  //         _logOut(appShared);
  //         return false;
  //       }, (refreshTokenData) async {
  //         // Update new access token
  //         await appShared.setAccessTokenValue(refreshTokenData.accessToken);
  //         return true;
  //       });
  //     });
  //   } catch (e) {
  //     // Handle token refresh failure
  //     _logOut(appShared);
  //     return false;
  //   }
  // }

  Future retryRequest(String accessToken) async {
    // Retry the request after the token has been refreshed.
    for (var i = 0; i < failedRequests.length; i++) {
      debugPrint('RETRYING[$i] => PATH: ${failedRequests[i]['response'].requestOptions.path}');
      final requestOptions = failedRequests[i]['response'].requestOptions as RequestOptions;
      requestOptions.headers = {
        'Authorization': 'Bearer $accessToken',
      };
      await get_x.Get.find<Dio>().fetch(requestOptions).then(
            failedRequests[i]['handler'].resolve,
            onError: (error) => failedRequests[i]['handler'].reject(error as DioException),
          );
    }
    _isRefreshing = false;
    failedRequests = [];
  }

  void _logOut(AppShared appShared) {
    appShared.clearUserData();

    get_x.Get.offNamedUntil(AppPages.signIn, (route) => false);
  }
}
