import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_fortune/views/auth/auth_page.dart';
import 'views/auth/sign_up_page.dart';
import 'views/home/home_page.dart';
import 'views/fortune_teller_list_page.dart';
import 'views/fortune_teller_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

// GoRouterのルート設定
final GoRouter _router = GoRouter(
  initialLocation: FirebaseAuth.instance.currentUser == null ? '/signup' : '/fortune_tellers',
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
    GoRoute(
      path: '/fortune_tellers',
      builder: (context, state) => FortuneTellerListPage(),
      routes: [
        GoRoute(
          path: ':id',  
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return FortuneTellerDetailPage(id: id);
          },
        ),
      ],
    ),
  ],
  // redirectの追加
  redirect: (context, state) {
    final isSignedIn = FirebaseAuth.instance.currentUser != null;
    final isGoingToSignIn = state.matchedLocation == '/signin' || state.matchedLocation == '/signup';

    if (!isSignedIn && !isGoingToSignIn) {
      // サインインしていないユーザーが保護されたページにアクセスした場合
      return '/signin';
    } else if (isSignedIn && isGoingToSignIn) {
      // サインインしているユーザーがサインイン/サインアップページにアクセスした場合
      return '/home';
    }
    return null;
  },
);

