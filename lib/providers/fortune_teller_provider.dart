import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/fortune_teller_model.dart';

final fortuneTellerProvider = FutureProvider<List<FortuneTellerModel>>((ref) async {
  try {
    final querySnapshot = await FirebaseFirestore.instance.collection('fortune_tellers').get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      return FortuneTellerModel(
        id: doc.id,
        name: data['name'] ?? 'Unknown',
        specialty: data['specialty'] ?? 'Unknown Specialty',
        profile: data['profile'] ?? 'No profile available',
        imageUrl: data['imageUrl'] ?? '',
        status: data['status'] ?? 'Unavailable',
      );
    }).toList();
  } catch (e) {
    print("Firestoreデータ取得エラー: $e");
    throw Exception('データの取得に失敗しました');
  }
});
