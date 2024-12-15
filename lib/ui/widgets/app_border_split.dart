import 'dart:ui';

import 'package:flutter/material.dart';

class AppBorderSplit extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;
  final double strokeWidth;
  final BorderRadius borderRadius;

  AppBorderSplit({
    required this.dashWidth,
    required this.dashSpace,
    required this.color,
    required this.strokeWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final outerRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = borderRadius.toRRect(outerRect);
    final path = Path()..addRRect(rrect);
    final dashPath = _createDashedPath(path);

    canvas.drawPath(dashPath, paint);
  }

  Path _createDashedPath(Path source) {
    final dashPath = Path();
    double distance = 0.0;
    for (PathMetric pathMetric in source.computeMetrics()) {
      while (distance < pathMetric.length) {
        final length = dashWidth;
        final end = distance + length;
        final pathSegment = pathMetric.extractPath(distance, end);
        dashPath.addPath(pathSegment, Offset.zero);
        distance += dashWidth + dashSpace;
      }
    }
    return dashPath;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
