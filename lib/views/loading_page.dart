import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateBasedOnAuthState();
    });
  }

  /// 認証状態に基づいてリダイレクト
  Future<void> _navigateBasedOnAuthState() async {
    final user = FirebaseAuth.instance.currentUser;

    try {
      if (user != null) {
        await user.reload();
        final updatedUser = FirebaseAuth.instance.currentUser;

        if (updatedUser != null && updatedUser.emailVerified) {
          // 認証済みの場合
          GoRouter.of(context).go('/fortune_tellers');
        } else {
          // 認証メール未確認の場合
          GoRouter.of(context).go('/verify_email');
        }
      } else {
        // 未登録の場合
        GoRouter.of(context).go('/signup');
      }
    } catch (e) {
      print("認証状態の確認中にエラー: $e");
      GoRouter.of(context).go('/signup'); // エラー時もサインアップページに遷移
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
