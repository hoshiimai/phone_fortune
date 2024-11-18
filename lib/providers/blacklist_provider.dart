import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Firebase からブラックリストを取得する非同期プロバイダ
final blacklistProvider = FutureProvider<List<String>>((ref) async {
  try {
    // Firestore の 'blacklist' コレクションを取得
    final snapshot = await FirebaseFirestore.instance.collection('blacklist').get();

    // ドキュメントから必要な値を抽出
    final blacklist = snapshot.docs.map((doc) {
      final data = doc.data();
      // 型安全な取得: 'value' フィールドが String 型であることを保証
      if (data['type'] == 'email' && data['value'] is String) {
        return data['value'] as String;
      }
      return null; // 型が異なる場合は無視
    }).whereType<String>().toList();

    return blacklist;
  } catch (e) {
    // エラー発生時のログ出力
    print('ブラックリスト取得中にエラーが発生しました: $e');
    return []; // 空リストを返すことで安全に終了
  }
});
