import 'package:flutter/material.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

class AppOptionDialog<T> extends StatelessWidget {
  const AppOptionDialog({
    super.key,
    required this.items,
    this.beforeSelected,
    this.textStyle,
    required this.onSelectedItem,
    required this.getName,
  });

  final List<T> items;
  final T? beforeSelected;
  final TextStyle? textStyle;
  final Function(T, int?) onSelectedItem;
  final String Function(T) getName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) =>
                    const Divider(color: AppColors.white, height: 1),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      onSelectedItem(items[index], index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0).copyWith(top: 20),
                      child: SizedBox(
                        height: 24,
                        child: Text(
                          getName(items[index]),
                          style: AppStyles.fontSize14(
                            color: items[index] == beforeSelected
                                ? AppColors.primary
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
