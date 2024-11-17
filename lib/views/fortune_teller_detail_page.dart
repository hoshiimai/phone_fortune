import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/fortune_teller_model.dart';

class FortuneTellerDetailPage extends StatelessWidget {
  final String id;

  const FortuneTellerDetailPage({required this.id});

  // 「並ぶ」ボタンを押したときにFirestoreにユーザーを追加する関数
  Future<void> joinWaitingList(String fortuneTellerId, String userId) async {
    final docRef = FirebaseFirestore.instance.collection('waiting_list').doc(fortuneTellerId);

    await docRef.set({
      'users': FieldValue.arrayUnion([{
        'userId': userId,
        'timestamp': Timestamp.now(),
      }])
    }, SetOptions(merge: true)); // `SetOptions(merge: true)` で既存データに追記
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('鑑定士詳細'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('fortune_tellers').doc(id).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('データの取得に失敗しました'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('データが存在しません'));
          } else {
            final data = snapshot.data!.data() as Map<String, dynamic>;
            final fortuneTeller = FortuneTellerModel.fromJson(data).copyWith(id: id);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fortuneTeller.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('専門分野: ${fortuneTeller.specialty}'),
                  SizedBox(height: 8),
                  Text('プロフィール: ${fortuneTeller.profile}'),
                  SizedBox(height: 8),
                  Text('ステータス: ${fortuneTeller.status}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // 現在のユーザーID（仮で'currentUserId'）を設定して「並ぶ」機能を実行
                      joinWaitingList(id, 'currentUserId').then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('並びました！'))
                        );
                      }).catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('並ぶのに失敗しました: $error'))
                        );
                      });
                    },
                    child: Text('並ぶ'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
