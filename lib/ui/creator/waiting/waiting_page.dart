import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/app_image.dart';
import 'package:callmobile/ui/widgets/app_listview.dart';
import 'package:callmobile/ui/widgets/common/creator_item.dart';
import 'package:callmobile/ui/widgets/common/fan_waiting_item.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../utils/app_appbar.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_styles.dart';
import '../../base/base_page.dart';
import '../../base/interactor/page_states.dart';
import 'interactor/waiting_bloc.dart';

class WaitingPage extends StatefulWidget {
  const WaitingPage({super.key});

  @override
  WaitingPageState createState() {
    return WaitingPageState();
  }
}

class WaitingPageState extends State<WaitingPage> {
  TextEditingController? keywordController;

  @override
  void initState() {
    super.initState();
    keywordController = TextEditingController();
  }

  @override
  void dispose() {
    keywordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<WaitingBloc>()..add(const Init()),
      child: BlocConsumer<WaitingBloc, WaitingState>(
        listener: (BuildContext context, WaitingState state) {},
        builder: (BuildContext context, WaitingState state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: const CustomAppBar(title: '順番待ちリスト', isShowLogo: true),
            body: BasePage(
              unFocusWhenTouchOutsideInput: true,
              child: Padding(
                padding: AppDimensions.paddingTop,
                child: Stack(
                  children: [
                    Container(decoration: AppDimensions.decoration),
                    Padding(
                      padding: 16.paddingAll,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '列',
                                style: AppStyles.fontSize14(
                                    color: AppColors.colorFF7B98, height: 21 / 14, fontWeight: FontWeight.w600),
                              ),
                              6.width,
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: AppColors.gradientCenterHorizontal(
                                      startColor: AppColors.colorFD5C87, endColor: AppColors.colorFF393F),
                                ),
                                child: Row(
                                  children: [
                                    const AppImage(
                                      image: AppAssets.ic_waiting_group_png,
                                      width: 16,
                                      height: 16,
                                    ),
                                    Text(
                                      '${state.fans.length}',
                                      style: AppStyles.fontSize16(
                                          color: AppColors.white, fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          24.height,
                          Expanded(
                              child: AppListView(
                                refresh: () {
                                  context.read<WaitingBloc>().add(const Init());
                                },
                                emptyMessage: 'クリエイターがありません。',
                                itemCount: state.fans.length,
                                isLoading: state.status == PageState.loading,
                                isLoadMore: state.loadingMoreState == PageState.loading,
                                loadMore: () {
                                  context.read<WaitingBloc>().add(const OnLoadMore());
                                },
                                itemBuilder: (BuildContext context, int index) => FanWaitingItem(
                                  index: index + 1,
                                  fan: state.fans[index],
                                  isShow: false,
                                ),
                                separatorBuilder: (BuildContext context, int index) => 10.height,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
