import 'package:flutter/material.dart';

class MyCustomClipper3 extends CustomClipper<Path> {
  final double radius;

  MyCustomClipper3({this.radius});
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((size.width / 2) - radius, 0.0)
      ..arcToPoint(
        Offset((size.width / 2) + radius, 0),
        clockwise: false,
        radius: Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(MyCustomClipper3 oldClipper) => true;
}
