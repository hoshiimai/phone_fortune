import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 左上のハンバーガーボタン
          Container(
            color: Colors.red,
            width: 56.0,
            height: 56.0,
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          // 中央のサイトロゴ部分
          Text(
            'サイトロゴ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          // 右上のポイント部分
          Container(
            color: Colors.red,
            width: 56.0,
            height: 56.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('*', style: TextStyle(color: Colors.white, fontSize: 16)),
                Text('POINT', style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}