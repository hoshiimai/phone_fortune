import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'views/auth/sign_up_page.dart';
import 'views/auth/thank_you_page.dart';
import 'views/fortune_teller_list_page.dart';
import 'views/loading_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

final GoRouter router = GoRouter(
  initialLocation: '/loading', // 初期ルートを /loading に設定
  routes: [
    GoRoute(
      path: '/loading',
      builder: (context, state) => LoadingPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/thankyou',
      builder: (context, state) => ThankYouPage(),
    ),
    GoRoute(
      path: '/fortune_tellers',
      builder: (context, state) => FortuneTellerListPage(),
    ),
  ],
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // アプリがバックグラウンドから復帰したときに認証状態を確認
      _checkAuthenticationStatus();
    }
  }

  /// 認証状態を確認し、仮登録処理を実行
  Future<void> _checkAuthenticationStatus() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // ユーザー情報をリロードして最新化
        await user.reload();
        final updatedUser = FirebaseAuth.instance.currentUser;

        if (updatedUser != null && updatedUser.emailVerified) {
          // 認証が完了していれば、Firestore を仮登録に更新
          await FirebaseFirestore.instance.collection('users').doc(updatedUser.uid).update({
            'status': '仮登録',
          });

          // 認証済みなら fortune_tellers に遷移
          router.go('/fortune_tellers');
        }
      } catch (e) {
        print("認証確認中にエラーが発生しました: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: '電話占いアプリ',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
