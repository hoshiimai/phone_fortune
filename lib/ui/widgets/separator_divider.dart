import 'package:flutter/material.dart';

// Enum class for divider style
enum XelaDividerStyle { solid, dotted, dashed }

// Enum class for divider orientaion
enum XelaDividerOrientation { horizontal, vertical }

class XelaDivider extends StatefulWidget {
  final XelaDividerStyle style;
  final XelaDividerOrientation orientation;
  final Color color;

  const XelaDivider({
    super.key,
    this.style = XelaDividerStyle.solid,
    this.orientation = XelaDividerOrientation.horizontal,
    this.color = Colors.grey,
  });

  @override
  State<StatefulWidget> createState() => _XelaDividerState();
}

class _XelaDividerState extends State<XelaDivider> {
  _XelaDividerState();

  @override
  Widget build(BuildContext context) {
    if (widget.style == XelaDividerStyle.solid) {
      if (widget.orientation == XelaDividerOrientation.horizontal) {
        return Divider(
          height: 1,
          thickness: 1,
          color: widget.color,
        );
      } else {
        return VerticalDivider(
          width: 1,
          thickness: 1,
          color: widget.color,
        );
      }
    }
    if (widget.orientation == XelaDividerOrientation.horizontal) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashWidth = (widget.style == XelaDividerStyle.dashed ? 8 : 2).floorToDouble();
          final dashCount =
              (boxWidth / ((widget.style == XelaDividerStyle.dashed ? 1.5 : 3) * dashWidth))
                  .floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: widget.style == XelaDividerStyle.dotted ? 2 : 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: widget.color),
                ),
              );
            }),
          );
        },
      );
    } else {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var boxHeight = constraints.constrainHeight();
          if (boxHeight == double.infinity) {
            boxHeight = 0;
          }
          final dashHeight = (widget.style == XelaDividerStyle.dashed ? 8 : 2).floorToDouble();
          final dashCount =
              (boxHeight / ((widget.style == XelaDividerStyle.dashed ? 1.5 : 3) * dashHeight))
                  .floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: widget.style == XelaDividerStyle.dotted ? 2 : 1,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: widget.color),
                ),
              );
            }),
          );
        },
      );
    }
  }
}
