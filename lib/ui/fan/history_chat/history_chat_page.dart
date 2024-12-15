import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../locale/locale_key.dart';
import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_styles.dart';
import '../../base/base_page.dart';
import '../../base/interactor/page_states.dart';
import '../../widgets/base/app_body.dart';
import 'component/history_item.dart';
import 'interactor/history_chat_bloc.dart';

class HistoryChatPage extends StatefulWidget {
  final bool isShowLogo;
  final String? title;
  const HistoryChatPage({super.key, this.isShowLogo = false, this.title});

  @override
  State<HistoryChatPage> createState() => _HistoryChatPageState();
}

class _HistoryChatPageState extends State<HistoryChatPage> {
  @override
  Widget build(BuildContext context) {
    return _mainView(context);
  }

  Widget _mainView(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<HistoryChatBloc>()..add(const Init()),
      child: BlocConsumer<HistoryChatBloc, HistoryChatState>(
        listener: (BuildContext context, HistoryChatState state) {},
        builder: (BuildContext context, HistoryChatState state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              title: widget.title ?? LocaleKey.historyChat.tr,
              iconLeading: AppAssets.ic_back_2_svg,
              isShowLogo: widget.isShowLogo,
            ),
            body: BasePage(
              child: Padding(
                padding: AppDimensions.paddingTop,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: 40.borderRadiusTop,
                        ),
                        child: AppBody(
                            pageState: state.status,
                            success: NotificationListener(
                              onNotification: (ScrollNotification scrollNotification) {
                                if (scrollNotification.metrics.pixels >=
                                    scrollNotification.metrics.maxScrollExtent / 2) {
                                  if (state.loadMoreStatus != PageState.loading &&
                                      state.totalPages > 0 &&
                                      state.currentPage < state.totalPages) {
                                    context
                                        .read<HistoryChatBloc>()
                                        .add(const OnLoadHistory(isReset: false));
                                  }
                                }
                                return true;
                              },
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  context
                                      .read<HistoryChatBloc>()
                                      .add(const OnLoadHistory(isReset: true));
                                  await Future<void>.delayed(const Duration(milliseconds: 500));
                                },
                                child: state.groupRoomsByDate.isNotEmpty
                                    ? _mainListView(state)
                                    : _emptyView(),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _mainListView(HistoryChatState state) {
    return Padding(
      padding: 16.paddingTop,
      child: ListView(
        padding: 0.paddingVertical,
        children: state.groupRoomsByDate.entries.map((entry) {
          final paddingTop =  state.groupRoomsByDate.entries.first.key == entry.key ? 9.0 : 25.0;
          return Padding(
            padding: AppDimensions.sideMargins.copyWith(top: paddingTop),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key,
                  style: AppStyles.fontSize12(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                15.height,
                Container(
                    padding: AppDimensions.sideMargins,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppColors.colorDEDEDE,
                      ),
                      borderRadius: 10.borderRadiusAll,
                    ),
                    child: ListView.separated(
                        shrinkWrap: true,
                        padding: 0.paddingAll,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) => HistoryItem(entry.value[index]),
                        separatorBuilder: (_, index) => const Divider(
                              height: 0.5,
                              color: AppColors.colorBEBEBE,
                            ),
                        itemCount: entry.value.length))
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _emptyView() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          (((Get.height - 352) / 2) - 32).toInt().height,
          Center(
            child: Text(
              LocaleKey.noData.tr,
              style: AppStyles.fontSize16(fontWeight: FontWeight.w400, color: AppColors.black),
            ),
          ),
          24.height,
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<HistoryChatBloc>();
  }
}
