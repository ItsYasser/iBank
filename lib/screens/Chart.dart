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
          child: Row(
            children: [
              Expanded(
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
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Indicator(
                    text: "Entertainement",
                    color: Colors.blue,
                    percentage: 25,
                  ),
                  Indicator(
                    text: "Entertainement",
                    color: Colors.green,
                    percentage: 25,
                  ),
                  Indicator(
                    text: "Entertainement",
                    color: Colors.deepPurple,
                    percentage: 25,
                  ),
                  Indicator(
                    text: "Entertainement",
                    color: Colors.amber,
                    percentage: 25,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final double percentage;
  const Indicator({
    Key key,
    this.color,
    this.text,
    this.percentage,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: color,
            radius: 9,
            child: Container(
              height: 10,
              width: 10,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "${percentage.round()} %",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          ),
        ],
      ),
    );
  }
}
