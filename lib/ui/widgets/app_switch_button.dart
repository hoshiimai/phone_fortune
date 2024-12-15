import 'package:flutter/material.dart';
import 'package:callmobile/utils/app_colors.dart';

class AppSwitchButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final Color activeTextColor;
  final Color inactiveTextColor;

  const AppSwitchButton(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.activeColor,
      this.inactiveColor = Colors.grey,
      this.activeText = '',
      this.inactiveText = '',
      this.activeTextColor = Colors.white70,
      this.inactiveTextColor = Colors.white70});

  @override
  State<StatefulWidget> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<AppSwitchButton> with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
          },
          child: SizedBox(
            height: 18,
            width: 38,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 35.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: _circleAnimation.value == Alignment.centerRight
                          ? null
                          : AppColors.colorE9E9E9,
                      gradient: _circleAnimation.value == Alignment.centerRight
                          ? AppColors.gradientSwitch()
                          : null,
                    ),
                  ),
                ),
                Align(
                  alignment: _circleAnimation.value,
                  child: Container(
                    width: 18.0,
                    height: 18.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _circleAnimation.value == Alignment.centerLeft
                            ? AppColors.colorCFCFCF
                            : null,
                        gradient: _circleAnimation.value == Alignment.centerLeft
                            ? null
                            : AppColors.gradient()),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
