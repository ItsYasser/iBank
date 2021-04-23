import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_2/constants.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class DateCard extends StatefulWidget {
  final DateTime date;
  final Function function;
  final int index;
  DateCard({this.date, this.function, this.index});

  @override
  _DateCardState createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    double realWidth = MediaQuery.of(context).size.width;
    double realHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        widget.function(widget.date);
        setState(() {
          selected = true;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
            left: realWidth * 0.06,
            right: realWidth * 0.005,
            top: realHeight * 0.005,
            bottom: realHeight * 0.009),
        width: realWidth * 0.22,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            gradient: LinearGradient(
              stops: [0.6, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: widget.date.day == widget.index
                  ? [kDateCardColor, kDateCardColor.withOpacity(0.8)]
                  : [Colors.white, Colors.white],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 2),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: realHeight * 0.01,
            ),
            Text(
              widget.date.day.toString(),
              style: TextStyle(
                color: widget.date.day == widget.index
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveFlutter.of(context).fontSize(3),
              ),
            ),
            Text(
              DateFormat.MMM().format(widget.date),
              style: TextStyle(
                color: widget.date.day == widget.index
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
              ),
            ),
            SizedBox(
              height: realHeight * 0.025,
            ),
          ],
        ),
      ),
    );
  }
}
