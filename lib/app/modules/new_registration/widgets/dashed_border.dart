import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double dashWidth;
  final double dashGap;

  DashedBorderPainter({
    this.strokeWidth = 0.5,
    this.color = Colors.grey,
    this.dashWidth = 5.0,
    this.dashGap = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    const double startX = 0.0;
    final double endX = size.width;

    double currentX = startX;

    while (currentX < endX) {
      final double dashEndX = currentX + dashWidth;
      final double lineEndX = dashEndX <= endX ? dashEndX : endX;
      canvas.drawLine(
        Offset(currentX, (size.height + 0.5)),
        Offset(lineEndX, (size.height + 0.5)),
        paint,
      );
      currentX += dashWidth + dashGap;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
