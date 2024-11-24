import 'package:flutter/material.dart';
import 'package:phone_fortune/models/fortune_teller.dart';
import 'fortune_teller_list.dart';

class FavoritePage extends StatelessWidget {
  final List<FortuneTeller> favoriteTellers = [
    FortuneTeller(
      name: '海馬風水',
      status: '鑑定中',
      queue: '6人待ち',
      price: '1分350円',
      time: '21:00〜23:30',
    ),
    FortuneTeller(
      name: '天草五郎時貞',
      status: '待機中',
      queue: '0人待ち',
      price: '1分380円',
      time: '23:00〜27:00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 鑑定士一覧
          FortuneTellerList(tellers: favoriteTellers),

          // 説明部分
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'お気に入り済みの鑑定師には登録時の以下の情報がシェアされます。',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  color: Colors.white, // 背景色を白に変更
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // お名前 & 生年月日
                      Row(
                        children: [
                          // お名前
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.person, color: Colors.black),
                                SizedBox(width: 8.0),
                                Text('お名前', style: TextStyle(fontSize: 12.0)),
                              ],
                            ),
                          ),
                          // 生年月日
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.cake, color: Colors.black),
                                SizedBox(width: 8.0),
                                Text('生年月日', style: TextStyle(fontSize: 12.0)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      // ニックネーム & お悩み相談
                      Row(
                        children: [
                          // ニックネーム
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.group, color: Colors.red),
                                SizedBox(width: 8.0),
                                Text(
                                  'ニックネーム',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // お悩み相談
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.chat, color: Colors.red), // 塗りつぶしの吹き出しアイコン
                                SizedBox(width: 8.0),
                                Text(
                                  'お悩み相談',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  '優先的に鑑定予約の希望を送信することが可能です。\n'
                  '注) スタンバイバイス1枚使用。\n'
                  '先生より確認が取れました時点で優先予約とさせていただきます。',
                  style: TextStyle(fontSize: 12.0, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
