import 'package:flutter/material.dart';
import 'package:personal_expenses_2/constants.dart';
import 'package:personal_expenses_2/components/one_curveClipper.dart';
import 'package:personal_expenses_2/components/two_curvesClipper.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import 'ballance_info.dart';

// ignore: must_be_immutable
class TopHalf extends StatelessWidget {
  final double income;
  final double expenses;
  double total;
  TopHalf({this.income, this.expenses}) {
    total = income - expenses;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: OneCurve(),
            child: Container(height: size.height * 0.34, color: kOneCurveColor),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: TwoCurves(),
            child: Container(
              height: size.height * 0.15,
              color: kTwoCurvesColor,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 25,
          width: size.width - 50,
          child: Container(
            height: size.height * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total Ballance",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'USD  ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        ),
                      ),
                      TextSpan(
                          text: total.toStringAsFixed(2),
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(5.175),
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                  width: size.width - 100,
                  decoration: BoxDecoration(
                      color: Color(0xff5400BE),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ColumnInfo(
                        iconColor: Colors.greenAccent[400],
                        iconData: Icons.arrow_downward,
                        text: "Income",
                        value: income.toStringAsFixed(2),
                      ),
                      Container(
                        height: size.height * 0.06,
                        width: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      ColumnInfo(
                        iconColor: Colors.redAccent[400],
                        iconData: Icons.arrow_upward,
                        text: "Expenses",
                        value: expenses.toStringAsFixed(2),
                      ),
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/imag/bg.png"),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ]),
            // width: 50,
          ),
        )
      ],
    );
  }
}
