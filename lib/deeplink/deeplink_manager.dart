import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:callmobile/deeplink/deep_link.dart';
import 'package:callmobile/extensions/string_extensions.dart';

class DeepLinkManager {
  DeepLinkManager();

  void initializeDeepLinking() async {
    // Todo: Handle Firebase DeepLinks

    // DynamicLinks.registerDeepLinks(callback: (uri) async {
    //   LogHelper.d('Deep Link Firebase');
    //   _handlerDeepLink(uri);
    // });

    // Demo
    final httpsUri = Uri(
        scheme: 'https',
        host: 'dart.dev',
        path: 'guides/libraries/library-tour',
        fragment: 'numbers');
    _handlerDeepLink(httpsUri);
  }

  void _handlerDeepLink(Uri uri) {
    try {
      debugPrint('Got uri: $uri ${uri.query}');
      _handlerDynamicDeepLink(uri);
    } catch (error) {
      debugPrint('DeepLinking error handling: $error');
    }
  }

  void _handlerDynamicDeepLink(Uri uri) {
    String? page = uri.queryParameters['navigation'];

    if (!page.isNullOrEmpty()) Get.toNamed(page!);
    // TODO Process after click deeplink
  }

  /// Handler Deeplink for notification
  Future<dynamic> handlerDeepLink({required DeepLink? deepLink}) async {
    if (deepLink == null) return;
    switch (deepLink.type) {
      case DeepLinkAction.systemNotice:
        // TODO: Handle this case.
        break;
    }
  }
}
