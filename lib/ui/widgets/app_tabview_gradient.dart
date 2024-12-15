import 'package:flutter/material.dart';
import 'package:callmobile/ui/widgets/app_gradient_text.dart';
import 'package:callmobile/utils/app_colors.dart';

class AppTabViewGradient extends StatefulWidget {
  final int id;
  final String title;
  final int selectedTab;
  final Function()? onClick;
  final double? width;

  const AppTabViewGradient(
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

class _AppTabViewState extends State<AppTabViewGradient> with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(covariant AppTabViewGradient oldWidget) {
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
            child: SizedBox(
              height: 52,
              width: widget.width,
              child: Center(
                child: AppGradientText(
                  text: widget.title,
                  textAlign: TextAlign.center,
                  gradient: isActive ? AppColors.gradient() : AppColors.gradientOffline(),
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
