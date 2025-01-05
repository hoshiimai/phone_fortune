import 'package:flutter/material.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

class AppRadioButtonGroup extends StatelessWidget {
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String?> onChanged;
  final Axis direction;
  final LinearGradient gradient;
  final LinearGradient? secondaryGradient;
  final double height;

  const AppRadioButtonGroup({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    required this.gradient,
    this.height = 62,
    this.direction = Axis.vertical,
    this.secondaryGradient,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> radioButtons = options.map((String option) {
      final isSelected = selectedOption == option;
      final updatedGradient = secondaryGradient != null && selectedOption != options.first ? secondaryGradient : gradient;
      return Expanded(
        child: GestureDetector(
          onTap: () {
            onChanged.call(option);
          },
          child: Container(
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(9999.radius),
                border: isSelected ? null : Border.all(color: AppColors.colorBCBDCB),
                gradient: isSelected ? updatedGradient : null),
            padding: 8.paddingVertical,
            child: direction == Axis.horizontal
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: SizedBox.shrink(),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Radio<String>(
                          fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                            return (isSelected) ? AppColors.white : AppColors.colorBCBDCB;
                          }),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: option,
                          groupValue: selectedOption,
                          onChanged: onChanged,
                          splashRadius: 20,
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox.shrink(),
                      ),
                      Padding(
                        padding: 2.paddingBottom,
                        child: Text(
                          option,
                          style: AppStyles.fontSize14(color: isSelected ? AppColors.white : AppColors.color616161),
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: SizedBox.shrink(),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        option,
                        style: AppStyles.fontSize14(color: isSelected ? AppColors.white : AppColors.color616161),
                      ),
                      5.height,
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Radio<String>(
                          fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                            return (isSelected) ? AppColors.white : AppColors.colorBCBDCB;
                          }),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: option,
                          groupValue: selectedOption,
                          onChanged: onChanged,
                          splashRadius: 20,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    }).toList();

    final items = <Widget>[];
    for (int i = 0; i < radioButtons.length; i++) {
      if (i == 0) {
        items.add(radioButtons[i]);
      } else {
        items.add(20.width);
        items.add(radioButtons[i]);
      }
    }

    return Row(
      children: items,
    );
  }
}
