import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/fortune_teller_model.dart';

class FortuneTellerDetailPage extends StatelessWidget {
  final String id;

  const FortuneTellerDetailPage({Key? key, required this.id}) : super(key: key);

  Future<FortuneTellerModel> fetchFortuneTeller() async {
    final doc = await FirebaseFirestore.instance.collection('fortune_tellers').doc(id).get();
    return FortuneTellerModel.fromJson(doc.data()!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('鑑定士詳細'),
      ),
      body: FutureBuilder<FortuneTellerModel>(
        future: fetchFortuneTeller(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('データの取得に失敗しました'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('データが存在しません'));
          }

          final fortuneTeller = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    fortuneTeller.imageUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  fortuneTeller.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '専門分野: ${fortuneTeller.specialty}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  'プロフィール:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  fortuneTeller.profile,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
