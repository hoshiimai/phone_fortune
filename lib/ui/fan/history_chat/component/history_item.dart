import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/model/enum/type_call.dart';
import '../../../../core/model/response/model/room.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/app_utils.dart';

class HistoryItem extends StatelessWidget {
  final Room room;
  const HistoryItem(this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    final name = room.creatorInfo?.fullName ?? '';
    return InkWell(
      onTap: () {
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: Row(
            children: [
              SizedBox(width: 20, height: 16, child: SvgPicture.asset(room.status.icon)),
              15.width,
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              if (room.status != TypeCall.cancel) ...[
                5.width,
                Text("(${AppUtils.formatDuration(room.callTiming ?? 0)})",
                    style: AppStyles.fontSize12(height: 18 / 12, color: AppColors.black)),
              ]
            ],
          )),
          18.width,
          Text(AppUtils.formatTimeToShort(room.createdAt.toLocal()),
              style: AppStyles.fontSize12(height: 18 / 12, color: AppColors.colorBEBEBE)),
        ]),
      ),
    );
  }
}
