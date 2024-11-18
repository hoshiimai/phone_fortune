import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/blacklist_provider.dart';

class VerifyEmailPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blacklistAsync = ref.watch(blacklistProvider);

    return Scaffold(
      appBar: AppBar(title: Text('メールアドレス確認')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'メールアドレス',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            blacklistAsync.when(
              data: (blacklist) => ElevatedButton(
                onPressed: () async {
                  final email = emailController.text.trim();

                  if (email.isEmpty || !RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(email)) {
                    _showDialog(context, "入力エラー", "正しい形式のメールアドレスを入力してください");
                    return;
                  }

                  // ブラックリストチェック
                  if (isEmailBlacklisted(email, blacklist)) {
                    _showDialog(context, "エラー", "このメールアドレスは登録できません。サポートにお問い合わせください。");
                    return;
                  }

                  // 認証メールの再送信または未登録のチェック
                  try {
                    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: 'temporaryPassword',
                    );

                    final user = userCredential.user;
                    if (user != null && !user.emailVerified) {
                      await user.sendEmailVerification();
                      _showDialog(context, "認証メール送信", "認証メールを再送しました。メールをご確認ください。");
                    } else if (user != null && user.emailVerified) {
                      _showDialog(context, "既に認証済み", "このメールアドレスは既に認証されています。");
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      _showSignUpDialog(context);
                    } else if (e.code == 'too-many-requests') {
                      _showDialog(context, "エラー", "リクエストが多すぎます。しばらく待ってからもう一度お試しください。");
                    } else {
                      _showDialog(context, "エラー", "処理中にエラーが発生しました: ${e.message}");
                    }
                  }
                },
                child: Text("認証メールを再送信"),
              ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text("エラーが発生しました: $error")),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/signup');
              },
              child: Text("新規登録はこちら"),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("閉じる"),
          ),
        ],
      ),
    );
  }

  void _showSignUpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("未登録"),
        content: Text("このメールアドレスは未登録です。新規登録を行ってください。"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              GoRouter.of(context).go('/signup');
            },
            child: Text("新規登録"),
          ),
        ],
      ),
    );
  }

  bool isEmailBlacklisted(String email, List<String> blacklist) {
    final domain = email.split('@').last;
    return blacklist.contains(email) || blacklist.contains(domain);
  }
}
