import 'package:flutter/material.dart';

class RefreshTokenData {
  late final String accessToken;

  RefreshTokenData({
    required this.accessToken,
  });

  RefreshTokenData.fromJson(Map<String, dynamic> json) {
    try {
      accessToken = json['newAccessToken'];
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
