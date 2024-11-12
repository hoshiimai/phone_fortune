import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/fortune_teller_provider.dart';

class FortuneTellerListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fortuneTellersAsyncValue = ref.watch(fortuneTellerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('鑑定士一覧'),
      ),
      body: fortuneTellersAsyncValue.when(
        data: (fortuneTellers) {
          return ListView.builder(
            itemCount: fortuneTellers.length,
            itemBuilder: (context, index) {
              final fortuneTeller = fortuneTellers[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: fortuneTeller.imageUrl.isNotEmpty
                      ? NetworkImage(fortuneTeller.imageUrl)
                      : AssetImage('assets/images/default_avatar.png') as ImageProvider,
                  radius: 25,  // 画像サイズを50x50にする
                ),
                title: Text(fortuneTeller.name),
                subtitle: Text(fortuneTeller.specialty),
                onTap: () {
                  print('タップされました: ID = ${fortuneTeller.id}');
                  context.go('/fortune_tellers/${fortuneTeller.id}');
                },
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('データの取得に失敗しました')),
      ),
    );
  }
}
