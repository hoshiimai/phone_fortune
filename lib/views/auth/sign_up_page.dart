import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import '../../providers/user_info_provider.dart' as user_model;
import '../../providers/blacklist_provider.dart';

class SignUpPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(user_model.userInfoProvider);
    final userInfoNotifier = ref.read(user_model.userInfoProvider.notifier);
    final blacklistAsync = ref.watch(blacklistProvider);

    // 年、月、日のリストを生成
    final years = List.generate(100, (index) => (DateTime.now().year - index).toString());
    final months = List.generate(12, (index) => (index + 1).toString().padLeft(2, '0'));
    final days = List.generate(31, (index) => (index + 1).toString().padLeft(2, '0'));

    return Scaffold(
      appBar: AppBar(title: Text('新規登録')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // お悩み
              Text("お悩み"),
              Wrap(
                spacing: 8.0,
                children: ['人生', '恋愛', '片思い', '復縁'].map((concern) {
                  return ChoiceChip(
                    label: Text(concern),
                    selected: userInfo.concern == concern,
                    onSelected: (selected) {
                      userInfoNotifier.updateConcern(selected ? concern : '');
                    },
                    selectedColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: userInfo.concern == concern ? Colors.white : Colors.black,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),

              // 性別
              Text("性別"),
              Wrap(
                spacing: 8.0,
                children: ['男性', '女性', 'その他'].map((gender) {
                  return ChoiceChip(
                    label: Text(gender),
                    selected: userInfo.gender == gender,
                    onSelected: (selected) {
                      userInfoNotifier.updateGender(selected ? gender : '');
                    },
                    selectedColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: userInfo.gender == gender ? Colors.white : Colors.black,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),

              // 生年月日
              Text("生年月日"),
              Row(
                children: [
                  DropdownButton<String>(
                    value: years.contains(userInfo.birthdate.split('-').first)
                        ? userInfo.birthdate.split('-').first
                        : null,
                    hint: Text("年"),
                    items: years.map((year) {
                      return DropdownMenuItem(value: year, child: Text(year));
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        final parts = userInfo.birthdate.split('-');
                        userInfoNotifier.updateBirthdate('$value-${parts.length > 1 ? parts[1] : ''}-${parts.length > 2 ? parts[2] : ''}');
                      }
                    },
                  ),
                  SizedBox(width: 8),
                  DropdownButton<String>(
                    value: months.contains(userInfo.birthdate.split('-').elementAtOrNull(1))
                        ? userInfo.birthdate.split('-').elementAtOrNull(1)
                        : null,
                    hint: Text("月"),
                    items: months.map((month) {
                      return DropdownMenuItem(value: month, child: Text(month));
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        final parts = userInfo.birthdate.split('-');
                        userInfoNotifier.updateBirthdate('${parts.first}-${value}-${parts.length > 2 ? parts[2] : ''}');
                      }
                    },
                  ),
                  SizedBox(width: 8),
                  DropdownButton<String>(
                    value: days.contains(userInfo.birthdate.split('-').elementAtOrNull(2))
                        ? userInfo.birthdate.split('-').elementAtOrNull(2)
                        : null,
                    hint: Text("日"),
                    items: days.map((day) {
                      return DropdownMenuItem(value: day, child: Text(day));
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        final parts = userInfo.birthdate.split('-');
                        userInfoNotifier.updateBirthdate('${parts.first}-${parts.elementAtOrNull(1) ?? ''}-$value');
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),

              // テキストフィールド群
              TextField(
                decoration: InputDecoration(labelText: "お名前（全角）"),
                onChanged: userInfoNotifier.updateName,
              ),
              TextField(
                decoration: InputDecoration(labelText: "フリガナ（カタカナ）"),
                onChanged: userInfoNotifier.updateFurigana,
              ),
              TextField(
                decoration: InputDecoration(labelText: "ニックネーム"),
                onChanged: userInfoNotifier.updateNickname,
              ),
              TextField(
                decoration: InputDecoration(labelText: "メールアドレス"),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  userInfoNotifier.updateEmail(value.trim());
                },
              ),
              SizedBox(height: 16),

              // 確認メール送信ボタン
              blacklistAsync.when(
                data: (blacklist) => ElevatedButton(
                  onPressed: () async {
                    final email = userInfo.email.trim();

                    // バリデーションチェック
                    String? errorMessage = validateInputs(userInfo, email);
                    if (errorMessage != null) {
                      _showDialog(context, "入力エラー", errorMessage);
                      return;
                    }

                    // ブラックリストチェック
                    if (isEmailBlacklisted(email, blacklist)) {
                      _showDialog(context, "エラー", "このメールアドレスは登録できません。サポートにお問い合わせください。");
                      return;
                    }

                    try {
                      // Firebase Auth: ユーザー作成 & 認証メール送信
                      final userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(email: email, password: 'temporaryPassword');
                      await userCredential.user?.sendEmailVerification();

                      // Firestore に仮登録データを保存
                      final userId = userCredential.user?.uid;
                      if (userId != null) {
                        await FirebaseFirestore.instance.collection('users').doc(userId).set({
                          'name': userInfo.name,
                          'email': userInfo.email,
                          'nickname': userInfo.nickname,
                          'furigana': userInfo.furigana,
                          'gender': userInfo.gender,
                          'maritalStatus': userInfo.maritalStatus,
                          'concern': userInfo.concern,
                          'birthdate': userInfo.birthdate,
                          'status': '未認証',
                          'created_at': Timestamp.now(),
                        });
                      }

                      // サンクスページに遷移
                      GoRouter.of(context).go('/thankyou');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        _showDialog(context, "登録済みメールアドレス", "このメールアドレスは既に登録されています。");
                      } else {
                        _showDialog(context, "エラー", "登録中にエラーが発生しました: ${e.message}");
                      }
                    } catch (e) {
                      _showDialog(context, "エラー", "登録中にエラーが発生しました: $e");
                    }
                  },
                  child: Text("確認メールを送信"),
                ),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Center(child: Text("エラーが発生しました: $error")),
              ),

              SizedBox(height: 16),

              // 既に登録済みの方はこちらボタン
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go('/verify_email');
                },
                child: Text("既に登録済みの方はこちら"),
              ),
            ],
          ),
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

  bool isEmailBlacklisted(String email, List<String> blacklist) {
    final domain = email.split('@').last;
    return blacklist.contains(email) || blacklist.contains(domain);
  }

  String? validateInputs(user_model.UserInfo userInfo, String email) {
    if (userInfo.concern.isEmpty) {
      return "お悩みを選択してください";
    }
    if (userInfo.gender.isEmpty) {
      return "性別を選択してください";
    }

    final birthdateParts = userInfo.birthdate.split('-');
    if (birthdateParts.length != 3 || birthdateParts.any((part) => part.isEmpty)) {
      return "生年月日の年・月・日をすべて選択してください";
    }

    if (userInfo.name.isEmpty || !RegExp(r'^[^\x00-\x7F]+$').hasMatch(userInfo.name)) {
      return "お名前を全角で入力してください";
    }
    if (userInfo.furigana.isEmpty || !RegExp(r'^[ァ-ンヴー\s]+$').hasMatch(userInfo.furigana)) {
      return "フリガナをカタカナで入力してください";
    }
    if (userInfo.nickname.isEmpty) {
      return "ニックネームを入力してください";
    }
    if (email.isEmpty || !RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(email)) {
      return "正しい形式のメールアドレスを入力してください";
    }
    return null;
  }
}
