import 'package:flutter/material.dart';

class SupportMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // サポートメニュー（赤枠）
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // 横幅をリストと揃える
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            'サポートメニュー',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left, // 左寄せ
          ),
        ),
        // 他のフッター部分（白背景に赤文字）
        Container(
          color: Colors.white, // 背景は白
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 左寄せ
            children: [
              Text('ページ上部へ', style: TextStyle(color: Colors.red)),
              SizedBox(height: 12.0), // 間隔を広げる
              Text('ご利用ガイド', style: TextStyle(color: Colors.red)),
              SizedBox(height: 12.0), // 間隔を広げる
              Text('お問い合わせ', style: TextStyle(color: Colors.red)),
              SizedBox(height: 16.0), // 下との間隔を広げる
              // 利用規約部分（黒文字で中央寄せ）
              Center(
                child: Text(
                  '利用規約   特定商取引法に基づく表記   個人情報保護方針   運営\n'
                  '当コンテンツの内容・文章・画像等の無断使用を禁じます。\n'
                  '© 2024 株式会社〇〇',
                  style: TextStyle(color: Colors.black, fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
