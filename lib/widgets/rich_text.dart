import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String title;
  final String followingTitle;
  final double value;

  const RichTextWidget(this.title, this.followingTitle, this.value);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: "$title :",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(text: " ( " + followingTitle + ":"),
            TextSpan(
              text: " \$${value.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.purpleAccent[700],
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(text: " )"),
          ]),
    );
  }
}
