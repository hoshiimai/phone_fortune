import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_fortune/views/auth/sign_up_page.dart';
import 'views/auth/auth_page.dart';
import 'views/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Flutterエンジンを初期化
  await Firebase.initializeApp();  // Firebaseの初期化
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: '電話占いアプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: FirebaseAuth.instance.currentUser == null ? '/signup' : '/home',
  routes: [
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => AuthPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
  ],
  redirect: (context, state) {
    final isSignedIn = FirebaseAuth.instance.currentUser != null;
    final isSignUp = state.uri.toString() == '/signup';

    // 既にサインインしている場合はホーム画面にリダイレクト
    if (isSignedIn && isSignUp) return '/home';
    if (!isSignedIn && state.uri.toString() == '/home') return '/signin';

    return null;
  },
);
