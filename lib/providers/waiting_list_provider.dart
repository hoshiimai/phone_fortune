import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final waitingListProvider = StreamProvider.family<List<Map<String, dynamic>>, String>((ref, fortuneTellerId) {
  return FirebaseFirestore.instance
      .collection('waiting_list')
      .doc(fortuneTellerId)
      .snapshots()
      .map((snapshot) {
        if (snapshot.exists) {
          final data = snapshot.data();
          // usersフィールドが配列として存在する場合、それを取得する
          if (data != null && data['users'] is List) {
            return List<Map<String, dynamic>>.from(data['users']);
          }
        }
        return [];
      });
});
