import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:callmobile/core/model/response/model/user.dart';
import 'package:callmobile/utils/app_constants.dart';

class AppShared {
  static const String keyName = AppConstants.appDatabaseName;

  //  Key to open Box
  static const String keyBox = '${keyName}_shared';

  final String _keyFcmToken = "${keyName}_keyFCMToken";
  final String _keyLanguageCode = "${keyName}_keyLanguageCode";
  final String _keyTokenValue = "${keyName}_keyTokenValue";
  final String _keyRefreshTokenValue = "${keyName}_keyRefreshTokenValue";
  final String _keyUserValue = "${keyName}_keyUserValue";
  final String _keyIsSelectedLanguage = "${keyName}_keyIsSelectedLanguage";
  final String _keyNotificationUnread = "${keyName}_keyNotificationUnread";
  final String _keyRef = "${keyName}_keyRef";

  final Box<dynamic> _box;

  AppShared(this._box);

  Box getBox() => _box;

  Future<void> setTokenFcm(String firebaseToken) async {
    _box.put(_keyFcmToken, firebaseToken);
  }

  String? getTokenFcm() => _box.get(_keyFcmToken);

  Future<void> setNotificationUnread(bool value) async {
    _box.put(_keyNotificationUnread, value);
  }

  bool getNotificationUnread() {
    final bool value = _box.get(_keyNotificationUnread) ?? false;
    return value;
  }

  Stream<bool> watchNotificationUnread() {
    return _box.watch(key: _keyNotificationUnread).transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          final value = data.value;
          sink.add(value is bool ? value : false);
        },
      ),
    );
  }

  Future<void> setLanguageCode(String languageCode) => _box.put(_keyLanguageCode, languageCode);

  String? getLanguageCode() => _box.get(_keyLanguageCode);

  Future<void> setAccessTokenValue(String tokenValue) => _box.put(_keyTokenValue, tokenValue);
  Future<void> clearAccessTokenValue() async {
    _box.delete(_keyTokenValue);
  }

  String? getAccessTokenValue() => _box.get(_keyTokenValue);

  Future<void> setRefreshTokenValue(String tokenValue) =>
      _box.put(_keyRefreshTokenValue, tokenValue);
  Future<void> clearRefreshTokenTokenValue() async {
    _box.delete(_keyRefreshTokenValue);
  }

  String? getRefreshToken() => _box.get(_keyRefreshTokenValue);

  Stream<String?> watchTokenValue() {
    return _box.watch(key: _keyTokenValue).transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          final value = data.value;
          sink.add(value is String ? value : null);
        },
      ),
    );
  }

  Future<int> clear() => _box.clear();

  Future<void> setUser(User? user) async {
    _box.put(_keyUserValue, jsonEncode(user?.toJson()));
  }

  User? getUser() {
    final userJson = _box.get(_keyUserValue);
    if (userJson != null) {
      final json = jsonDecode(userJson);
      return User.fromJson(Map<String, dynamic>.from(json));
    }
    return null;
  }

  Future<void> clearUser() async {
    _box.delete(_keyUserValue);
  }

  Stream<User?> watchUser() {
    return _box.watchWithInitial(key: _keyUserValue).map((event) {
      final userJson = event.value;
      User? user;
      if (userJson != null) {
        final json = jsonDecode(userJson);
        user = User.fromJson(Map<String, dynamic>.from(json));
      }
      return user;
    });
  }

  Future<void> setIsSelectedLanguage() => _box.put(_keyIsSelectedLanguage, true);
  bool getIsSelectedLanguage() => _box.get(_keyIsSelectedLanguage, defaultValue: false) ?? false;

  Future<void> clearUserData() async {
    _box.delete(_keyUserValue);
    _box.delete(_keyTokenValue);
    _box.delete(_keyRefreshTokenValue);
    _box.delete(_keyFcmToken);
  }

  Future<void> saveRefCode(String ref) => _box.put(_keyRef, ref);

  String getRefCode() => _box.get(_keyRef, defaultValue: "") ?? "";

  Future<void> setIncomingCall(bool value) => _box.put('hasIncomingCall', value);
  bool isHasIncomingCall() => _box.get('hasIncomingCall', defaultValue: false) ?? false;
  Future<void> setOffer(Map value) => _box.put('offer', value);
  Map getOffer() => _box.get('offer', defaultValue: {}) ?? {};
}

extension BoxExtensions on Box {
  Stream<BoxEvent> watchWithInitial({required String key}) {
    Future.delayed(const Duration(milliseconds: 50), () {
      var obj = get(key);
      put(key, obj);
    });
    return watch(key: key);
  }
}
