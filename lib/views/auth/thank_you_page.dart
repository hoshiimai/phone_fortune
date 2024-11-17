import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登録ありがとう')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "確認メールを送信しました。\nメール内のリンクをクリックしてください。",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // サインイン画面に戻る処理（必要に応じて変更）
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text("ホームに戻る"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
