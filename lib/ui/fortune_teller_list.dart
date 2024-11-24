import 'package:flutter/material.dart';
import 'package:phone_fortune/models/fortune_teller.dart';

class FortuneTellerList extends StatelessWidget {
  final List<FortuneTeller> tellers;

  FortuneTellerList({required this.tellers});

  /// ステータスに基づいて背景色を返すメソッド
  Color _getStatusColor(String status) {
    switch (status) {
      case '鑑定中':
        return Colors.red.shade400;
      case '待機中':
        return Colors.green.shade400;
      case '準備中':
        return Colors.blue.shade300;
      case '離席中':
        return Colors.grey.shade400;
      default:
        return Colors.grey; // デフォルト色
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: tellers.length,
      separatorBuilder: (context, index) => Divider(color: Colors.grey),
      itemBuilder: (context, index) {
        final teller = tellers[index];
        final statusColor = _getStatusColor(teller.status);

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 左側: 画像
              Container(
                width: 60.0,
                height: 60.0,
                color: Colors.grey.shade300,
                child: Icon(Icons.person, size: 40.0, color: Colors.grey.shade600),
              ),
              SizedBox(width: 16.0),
              // 中央: テキスト情報
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teller.name,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '${teller.price}   現在${teller.queue}がこの占い師を見ています',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '本日の待機予定時間: ${teller.time}',
                      style: TextStyle(fontSize: 12.0, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              // 右側: ステータス
              Container(
                width: 80.0,
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      teller.status,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      teller.queue.split('待ち')[0],
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '待ち',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
