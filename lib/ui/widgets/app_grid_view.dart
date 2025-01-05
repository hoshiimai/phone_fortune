import 'package:callmobile/utils/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';

import 'package:callmobile/ui/widgets/app_circular_progress.dart';
import 'package:callmobile/utils/app_colors.dart';

class AppGridView extends StatelessWidget {
  final Axis scrollDirection;
  final int itemCount;
  final Widget? Function(BuildContext context, int index, double heightItem) itemBuilder;
  final Function()? refresh;
  final VoidCallback? loadMore;
  final bool isLoadMore;
  final bool isLoading;
  final int crossAxisCount;
  final double axisSpacing;
  final double itemRatio;
  final int spaceHorizontal;
  final ScrollPhysics? scrollPhysics;

  const AppGridView({
    super.key,
    this.scrollDirection = Axis.vertical,
    required this.itemCount,
    required this.itemBuilder,
    this.refresh,
    this.loadMore,
    this.isLoading = false,
    this.isLoadMore = false,
    this.crossAxisCount = 2,
    this.axisSpacing = 6,
    this.itemRatio = 1.6,
    this.spaceHorizontal = 10,
    this.scrollPhysics = const NeverScrollableScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollNotification) {
        if (scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent / 2) {
          if (!isLoadMore) loadMore?.call();
        }
        return true;
      },
      child: refresh != null
          ? RefreshIndicator(
              onRefresh: () async {
                await refresh?.call();
              },
              child: _mainGridView(),
            )
          : _mainGridView(),
    );
  }

  Widget _mainGridView() {
    final double heightItem =
        ((Get.width - (spaceHorizontal * 2 + axisSpacing)) / (crossAxisCount * itemRatio)) +
            axisSpacing;
    final rows = ((isLoadMore ? itemCount + 1 : itemCount) / crossAxisCount).ceil();
    final double heightWidget = heightItem * rows;

    return Stack(
      children: [
        if (isLoading) ...[
          Padding(
              padding: EdgeInsets.only(bottom: AppDimensions.bottomHeight),
              child: const AppCircularProgress(color: AppColors.primary)),
        ] else if (itemCount == 0 && !isLoadMore)
          Padding(
            padding: EdgeInsets.only(bottom: AppDimensions.bottomHeight),
            // child: const CustomNoDataWidget(),
          ),
        SizedBox(
          height: scrollPhysics == const NeverScrollableScrollPhysics() ? heightWidget : null,
          child: GridView.builder(
            shrinkWrap: true,
            padding: spaceHorizontal.paddingHorizontal,
            itemCount: isLoadMore && itemCount != 0 ? itemCount + 1 : itemCount,
            physics: scrollPhysics,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: axisSpacing,
              crossAxisSpacing: axisSpacing,
              childAspectRatio: itemRatio,
            ),
            itemBuilder: (context, index) {
              if (index == itemCount) {
                return const Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  ),
                );
              }
              return itemBuilder(context, index, heightWidget);
            },
          ),
        ),
      ],
    );
  }
}
