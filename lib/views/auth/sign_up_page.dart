import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_providers.dart';

class SignUpPage extends ConsumerWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String? _verificationId;
  String? _gender;

  // エラーメッセージを設定する関数
  void _setError(WidgetRef ref, String? message) {
    ref.read(errorMessageProvider.notifier).setError(message);
  }

  // Firestoreにユーザー情報を保存するメソッド
  Future<void> _saveUserData(User user) async {
    final userRef = _firestore.collection('users').doc(user.uid);
    await userRef.set({
      'uid': user.uid,
      'phoneNumber': user.phoneNumber,
      'username': _usernameController.text.trim(),
      'birthdate': _birthdateController.text.trim(),
      'gender': _gender,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true)); // ドキュメントが存在しない場合のみ作成
  }

  // 電話番号の認証コード送信処理
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

    _verificationId = null; // 送信前にリセット

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: formattedPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          context.go('/home'); // 自動サインイン成功時にホーム画面へ
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'credential-already-in-use') {
            _setError(ref, "この電話番号は既に使用されています。");
          } else if (e.code == 'invalid-phone-number') {
            _setError(ref, "電話番号の形式が正しくありません");
          } else {
            _setError(ref, "認証に失敗しました。しばらくしてからもう一度お試しください。");
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId; // 新しいverificationIdを保持
          _setError(ref, null); // エラーメッセージをクリア
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
        timeout: Duration(seconds: 60),
      );
    } catch (e) {
      _setError(ref, "予期しないエラーが発生しました。もう一度お試しください。");
    }
  }

  // SMSコードでのサインイン処理
  Future<void> _signInWithSmsCode(BuildContext context, WidgetRef ref) async {
    final String smsCode = _codeController.text.trim();
    if (_verificationId == null) {
      _setError(ref, "認証コードが送信されていません。もう一度お試しください");
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
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      await _saveUserData(userCredential.user!);  // Firestoreにユーザー情報を保存
      context.go('/home'); // ホーム画面に遷移
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-verification-code') {
          _setError(ref, "認証コードが正しくありません");
        } else if (e.code == 'session-expired') {
          _setError(ref, "セッションが期限切れです。もう一度お試しください");
        } else {
          _setError(ref, "認証に失敗しました。エラーコード: ${e.code}");
        }
      } else {
        _setError(ref, "予期しないエラーが発生しました。もう一度お試しください");
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorMessage = ref.watch(errorMessageProvider);

    return Scaffold(
      appBar: AppBar(title: Text('新規登録')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: "電話番号を入力 (+81...)"),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "ユーザー名"),
              ),
              TextField(
                controller: _birthdateController,
                decoration: InputDecoration(labelText: "生年月日 (YYYY-MM-DD)"),
              ),
              DropdownButtonFormField<String>(
                value: _gender,
                items: ['男性', '女性', 'その他'].map((gender) {
                  return DropdownMenuItem(value: gender, child: Text(gender));
                }).toList(),
                onChanged: (value) {
                  _gender = value;
                },
                decoration: InputDecoration(labelText: "性別"),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _verifyPhoneNumber(context, ref),
                child: Text("認証コードを送信"),
              ),
              TextField(
                controller: _codeController,
                decoration: InputDecoration(labelText: "SMS認証コードを入力"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _signInWithSmsCode(context, ref),  // 「サインアップ」ボタンで呼び出し
                child: Text("サインアップ"),
              ),
              if (errorMessage != null) // エラーメッセージを表示
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(errorMessage, style: TextStyle(color: Colors.red)),
                ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => context.go('/signin'), // サインイン画面に遷移
                child: Text(
                  "すでに登録済みの方はこちら",
                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
