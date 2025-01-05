import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/app_listview.dart';
import 'package:callmobile/ui/widgets/common/creator_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/model/enum/enum_bottom_navigation_page.dart';

import '../../../utils/app_appbar.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_styles.dart';
import '../../base/base_page.dart';
import '../../base/interactor/page_states.dart';
import '../../widgets/app_text_field_search.dart';
import '../main/interactor/main_bloc.dart';
import 'interactor/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  SearchPageState createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
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
    return BlocListener<MainBloc, MainState>(
      bloc: Get.find<MainBloc>(),
      listenWhen: (p, c) => p.popPage != c.popPage,
      listener: (ctx, state) {
        if (state.popPage == BottomNavigationPage.search) {
          Navigator.of(context).popUntil((Route<dynamic> route) => route.settings.name == '/');
          Get.find<MainBloc>().add(const ResetPopPage());
        }
      },
      child: BlocProvider(
        create: (context) => Get.find<SearchBloc>()..add(const Init()),
        child: BlocConsumer<SearchBloc, SearchState>(
          listener: (BuildContext context, SearchState state) {},
          builder: (BuildContext context, SearchState state) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: const CustomAppBar(title: 'クリエイター検索', isShowLogo: true),
              body: BasePage(
                unFocusWhenTouchOutsideInput: true,
                child: Padding(
                  padding: AppDimensions.paddingTop,
                  child: Stack(
                    children: [
                      Container(decoration: AppDimensions.decoration),
                      AppTextFieldSearch(
                        controller: keywordController,
                        hintText: 'クリエイター検索',
                        gradient: AppColors.gradient(),
                        textStyleColor: AppColors.black,
                        onCompleted: (value) {
                          context.read<SearchBloc>().add(OnSearch(value));
                        },
                        onSearchClick: (value) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          context.read<SearchBloc>().add(OnSearch(value));
                        },
                      ),
                      state.creators.isEmpty
                          ? _emptyView(context, state)
                          : Padding(
                              padding: 16.paddingHorizontal.copyWith(top: 80),
                              child: AppListView(
                                itemCount: state.creators.length,
                                isLoading: state.loadingState == PageState.loading,
                                isLoadMore: state.loadingMoreState == PageState.loading,
                                loadMore: () {
                                  context.read<SearchBloc>().add(const OnLoadMore());
                                },
                                itemBuilder: (BuildContext context, int index) => CreatorItem(creator: state.creators[index]),
                                separatorBuilder: (BuildContext context, int index) => 10.height,
                              ),
                            )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _emptyView(BuildContext context, SearchState state) {
    return Center(
      child: Text(
        (state.keyword?.isEmpty ?? true) ? '' : 'クリエイターがありません。',
        style: AppStyles.fontSize16(fontWeight: FontWeight.w400, color: AppColors.black),
      ),
    );
  }
}
