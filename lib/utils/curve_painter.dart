import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.3, size.height, size.width * 0.5, size.height * 0.69);
    // path.quadraticBezierTo(
    //     size.width * 0.4, size.height, size.width * 0.52, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.18,
        size.width * 1, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
