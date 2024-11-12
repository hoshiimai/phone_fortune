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
                  backgroundImage: NetworkImage(fortuneTeller.imageUrl),
                ),
                title: Text(fortuneTeller.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fortuneTeller.specialty),
                    Text(
                      fortuneTeller.status,
                      style: TextStyle(
                        color: fortuneTeller.status == 'available' ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
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
