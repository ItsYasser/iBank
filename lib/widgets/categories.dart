import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Categories extends StatelessWidget {
  final double realWidth;
  final double realHeight;
  final Color color;
  final text;
  final character;
  final Function function;
  final bool lastIndex;
  const Categories({
    Key key,
    this.realWidth,
    this.realHeight,
    this.color,
    this.text,
    this.function,
    this.lastIndex,
    this.character,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      right: realWidth * 0.035, left: realWidth * 0.018),
                  height: realHeight * 0.05,
                  width: realWidth * 0.023,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                  ),
                ),
              ],
            ),
            Radio(
              activeColor: Colors.purple[400],
              value: text,
              groupValue: character,
              onChanged: (value) {
                function({
                  'text': value,
                  'color': color,
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: realHeight * 0.01,
        ),
        !lastIndex
            ? Divider(
                color: Colors.grey.withOpacity(0.2),
                height: realHeight * 0.0008,
                thickness: 1,
                endIndent: realWidth * 0.03,
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
