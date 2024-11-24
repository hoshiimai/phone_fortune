import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_fortune/ui/favorite_page.dart';
import 'package:phone_fortune/ui/header.dart';
import '../blocs/tab_bloc.dart';
import '../blocs/tab_event.dart';
import '../blocs/tab_state.dart';
import 'fortune_list.dart';
import 'support_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // ヘッダー部分
              Header(),
              // タブバー部分
              BlocBuilder<TabBloc, TabState>(
                builder: (context, state) {
                  final bloc = context.read<TabBloc>();
                  final isLeftSelected =
                      state is TabUpdated && state.isLeftSelected();
                  final isRightSelected =
                      state is TabUpdated && state.isRightSelected();

                  return Container(
                    height: 48,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => bloc.add(TabSelected(0)),
                            child: Container(
                              color: isLeftSelected ? Colors.red : Colors.white,
                              child: Center(
                                child: Text(
                                  '占い師一覧',
                                  style: TextStyle(
                                    color: isLeftSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => bloc.add(TabSelected(1)),
                            child: Container(
                              color: isRightSelected ? Colors.red : Colors.white,
                              child: Center(
                                child: Text(
                                  'お気に入り',
                                  style: TextStyle(
                                    color: isRightSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // タブビューの内容部分
              Expanded(
                child: BlocBuilder<TabBloc, TabState>(
                  builder: (context, state) {
                    final isLeftSelected =
                        state is TabUpdated && state.isLeftSelected();

                    if (isLeftSelected) {
                      // 占い師一覧タブ
                      return ListView(
                        children: [
                          FortuneList(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(
                              child: Text(
                                '≫全ての鑑定士を見る',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SupportMenu(),
                        ],
                      );
                    } else {
                      // お気に入りタブ
                      return ListView(
                        children: [
                          FavoritePage(),
                          SupportMenu(),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}