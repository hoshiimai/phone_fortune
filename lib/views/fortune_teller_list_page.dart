import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/fortune_teller_provider.dart';
import '../providers/waiting_list_provider.dart';

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
              final waitingListAsyncValue = ref.watch(waitingListProvider(fortuneTeller.id));

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(fortuneTeller.imageUrl),
                ),
                title: Text(fortuneTeller.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fortuneTeller.specialty),
                    waitingListAsyncValue.when(
                      data: (waitingList) {
                        final waitingCount = waitingList.length;
                        return Text(
                          '待機中: $waitingCount 人',
                          style: TextStyle(
                            color: waitingCount > 0 ? Colors.red : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                      loading: () => Text('待機人数を取得中...'),
                      error: (error, stack) => Text('エラーが発生しました'),
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
