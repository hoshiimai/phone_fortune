import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

// エラーメッセージ用のProvider
@riverpod
class ErrorMessage extends _$ErrorMessage {
  @override
  String? build() {
    return null;
  }

  // エラーメッセージを設定するメソッド
  void setError(String? message) {
    state = message;
  }
}
