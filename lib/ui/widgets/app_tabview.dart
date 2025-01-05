import 'package:flutter/material.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_dimensions.dart';
import 'package:callmobile/utils/app_styles.dart';

class AppTabView extends StatefulWidget {
  final int id;
  final String title;
  final int selectedTab;
  final Function()? onClick;
  final double? width;

  const AppTabView(
    this.id, {
    required this.title,
    required this.selectedTab,
    this.onClick,
    this.width,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _AppTabViewState();
}

class _AppTabViewState extends State<AppTabView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _alignmentAnimation = AlignmentTween(
      begin: _getAlignment(widget.selectedTab),
      end: _getAlignment(widget.selectedTab),
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  Alignment _getAlignment(int index) {
    return index == widget.id ? Alignment.center : Alignment.topCenter;
  }

  @override
  void didUpdateWidget(covariant AppTabView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedTab != oldWidget.selectedTab) {
      _alignmentAnimation = AlignmentTween(
        begin: _getAlignment(oldWidget.selectedTab),
        end: _getAlignment(widget.selectedTab),
      ).animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
      _animationController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isActive = widget.selectedTab == widget.id;
    return InkWell(
      onTap: () {
        widget.onClick?.call();
        setState(() {
          _alignmentAnimation = AlignmentTween(
            begin: _alignmentAnimation.value,
            end: _getAlignment(widget.id),
          ).animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
          _animationController.forward(from: 0);
        });
      },
      child: AnimatedBuilder(
        animation: _alignmentAnimation,
        builder: (context, child) {
          return Align(
            alignment: _alignmentAnimation.value,
            child: Container(
              height: 52,
              width: widget.width,
              decoration: BoxDecoration(
                gradient: isActive ? AppColors.gradient() : null,
                borderRadius: 100.borderRadiusAll,
                color: isActive ? null : Colors.transparent,
              ),
              padding: AppDimensions.sideMargins,
              child: Center(
                child: Text(
                  widget.title,
                  style: isActive
                      ? AppStyles.fontSize14(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                          height: 20 / 14,
                        )
                      : AppStyles.fontSize14(
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorDEDEDE,
                          height: 20 / 14,
                        ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
