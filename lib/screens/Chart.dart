import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Container(
          height: 200,
          width: double.infinity,
          // color: Colors.red,
          child: AspectRatio(
            aspectRatio: 1.3,
            child: Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                          borderData: FlBorderData(show: false),
                          centerSpaceRadius: double.infinity,
                          sectionsSpace: 0,
                          // read about it in the below section
                          sections: [
                            PieChartSectionData(
                              value: 25,
                              color: Colors.amber,
                              showTitle: false,
                            ),
                            PieChartSectionData(
                              value: 25,
                              showTitle: false,
                              color: Colors.blue,
                            ),
                            PieChartSectionData(
                              value: 25,
                              showTitle: false,
                              color: Colors.green,
                            ),
                            PieChartSectionData(
                              value: 25,
                              showTitle: false,
                              color: Colors.deepPurple,
                            ),
                          ]),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Indicator(
                      text: "Entertainement",
                      color: Colors.blue,
                      isSquare: false,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}
