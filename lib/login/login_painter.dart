import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.30, size.height * 0.25);
    path.quadraticBezierTo((size.width * 0.30) + 20, (size.height * 0.25),
        (size.width * 0.30) + 25, (size.height * 0.25) - 5);
    path.lineTo(size.width * 0.70, 0);
    path.close();

    paint.color = const Color.fromRGBO(31, 48, 83, 1);
    canvas.drawPath(path, paint);

    path = Path();
    // path.lineTo(size.width * 0.98, 0.20);
    print('CurvePainter.paint ---> ${size.width * 0.60} ---> ${size.width * 0.60}');
    path.lineTo(size.width * 0.65, size.height * 0.0);
    path.lineTo(size.width * 0.50, size.height * 0.10);
    final midEndPoint = Offset((size.width * 0.5), (size.height * 0.2));
    final midControlPoint = Offset((size.width * 0.65), (size.height * 0.13));
    path.quadraticBezierTo(midEndPoint.dx, midEndPoint.dy,
        midControlPoint.dx, midControlPoint.dy);

    path.lineTo(size.width * 0.8, size.height * 0.0);

    // final midEndPoint = Offset(size.width * 0.50, size.height * 0.20);
    // final midControlPoint = Offset((size.width * 0.50) - 20, (size.height * 0.20)+10);
    // path.quadraticBezierTo(midEndPoint.dx, midEndPoint.dy,
    //     midControlPoint.dx, midControlPoint.dy);
    // path.lineTo(size.width * 0.35, size.height * 0.20);
    //
    // path.lineTo(size.width * 0.60, 0);

    paint.color = Colors.blueAccent.withOpacity(0.5);
    path.close();
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(size.width * 0.79, 0);
    path.lineTo(size.width * 0.38, size.height * 0.28);

    final lastEndPoint = Offset((size.width * 0.32) - 5, (size.height * 0.34));
    final lastControlPoint = Offset((size.width * 0.50), (size.height * 0.32));
    path.quadraticBezierTo(lastEndPoint.dx, lastEndPoint.dy,
        lastControlPoint.dx, lastControlPoint.dy);

    path.lineTo(size.width - 80, size.height * 0.30);

    final lastRightEndPoint = Offset((size.width - 40), (size.height * 0.30));
    final lastRightControlPoint = Offset((size.width), (size.height * 0.20));
    path.quadraticBezierTo(lastRightEndPoint.dx, lastRightEndPoint.dy,
        lastRightControlPoint.dx, lastRightControlPoint.dy);

    path.lineTo(size.width, size.height * .27);
    path.lineTo(size.width, size.height * 0);
//    path.quadraticBezierTo((size.width * 0.30) + 20, (size.height * 0.25),
//        (size.width * 0.30) + 25, (size.height * 0.25) - 5);
//     path.close();

    paint.color = Colors.blueAccent;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
