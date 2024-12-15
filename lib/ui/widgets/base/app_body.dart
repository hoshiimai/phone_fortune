import 'package:flutter/material.dart';
import 'package:callmobile/ui/base/interactor/page_states.dart';
import 'package:callmobile/ui/widgets/app_circular_progress.dart';
import 'package:callmobile/ui/widgets/app_full_loading.dart';
import 'package:callmobile/utils/app_colors.dart';

/// Generic Widget to be used mostly inside a Scaffold body
/// You must pass at least a page state and a success widget
class AppBody extends StatelessWidget {
  final PageState pageState;
  final Widget success;
  final Widget? initial;
  final Widget? loading;
  final Widget? failure;

  const AppBody({
    super.key,
    required this.pageState,
    required this.success,
    this.initial,
    this.loading,
    this.failure,
  });

  @override
  Widget build(BuildContext context) {
    return _bodyContent(context);
  }

  Widget _bodyContent(BuildContext context) {
    switch (pageState) {
      case PageState.initial:
        return initial ?? success;
      case PageState.loading:
        return loading ?? const Center(child: AppCircularProgress(color: AppColors.primary));
      case PageState.loadingFull:
        return Stack(
          children: [
            success,
            const AppFullLoading(),
          ],
        );
      case PageState.failure:
        return failure ?? success;
      case PageState.success:
        return success;
      case PageState.login:
        return const SizedBox.shrink();
    }
  }
}
