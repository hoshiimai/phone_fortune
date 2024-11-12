import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/fortune_teller_model.dart';

final fortuneTellerProvider = StreamProvider<List<FortuneTellerModel>>((ref) {
  return FirebaseFirestore.instance.collection('fortune_tellers').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) => FortuneTellerModel.fromDocumentSnapshot(doc)).toList();
  });
});
