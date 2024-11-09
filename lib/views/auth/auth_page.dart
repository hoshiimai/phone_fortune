import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_providers.dart';

class AuthPage extends ConsumerWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String? _verificationId;

  // エラーメッセージを設定する関数
  void _setError(WidgetRef ref, String? message) {
    ref.read(errorMessageProvider.notifier).setError(message);
  }

  // 電話番号認証の処理
  Future<void> _verifyPhoneNumber(BuildContext context, WidgetRef ref) async {
    final String phoneNumber = _phoneController.text.trim();
    if (phoneNumber.isEmpty) {
      _setError(ref, "電話番号を入力してください");
      return;
    }

    String formattedPhoneNumber = phoneNumber;
    if (!formattedPhoneNumber.startsWith('+')) {
      formattedPhoneNumber = '+81' + formattedPhoneNumber.substring(1); // 日本の国番号を追加
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: formattedPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        context.go('/home'); // 自動サインイン成功時にホーム画面へ
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          _setError(ref, "電話番号の形式が正しくありません");
        } else if (e.code == 'too-short') {
          _setError(ref, "電話番号が短すぎます");
        } else {
          _setError(ref, "認証に失敗しました。しばらくしてからもう一度お試しください。");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        _setError(ref, null); // エラーメッセージをクリア
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
      timeout: Duration(seconds: 60),
    );
  }

  // SMSコードでのサインイン処理
  Future<void> _signInWithSmsCode(BuildContext context, WidgetRef ref) async {
    final String smsCode = _codeController.text.trim();
    if (_verificationId == null) {
      _setError(ref, "まず電話番号の認証を行ってください");
      return;
    }
    if (smsCode.isEmpty) {
      _setError(ref, "認証コードを入力してください");
      return;
    }

    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: smsCode,
    );

    try {
      await _auth.signInWithCredential(credential);
      context.go('/home'); // サインイン成功時にホーム画面に遷移
    } catch (e) {
      _setError(ref, "認証コードが正しくありません");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorMessage = ref.watch(errorMessageProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('電話番号でログイン'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "電話番号を入力 (+81...)",
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _verifyPhoneNumber(context, ref),  // contextを渡す
              child: Text("認証コードを送信"),
            ),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: "SMS認証コードを入力",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _signInWithSmsCode(context, ref),  // contextを渡す
              child: Text("サインイン"),
            ),
            if (errorMessage != null) // エラーメッセージを画面に表示
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
