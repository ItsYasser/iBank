import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      "Welcome Back, Yasser",
      style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(2.4)),
    ),
    centerTitle: false,
    actions: [
      GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.monetization_on,
          size: ResponsiveFlutter.of(context).fontSize(3),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.more_vert,
            size: ResponsiveFlutter.of(context).fontSize(3),
          ),
        ),
      ),
    ],
  );
}
