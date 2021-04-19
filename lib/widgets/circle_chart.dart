import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CircleChart extends StatelessWidget {
  List myList = [];
  final List listOfTransactions;

  CircleChart({
    @required this.listOfTransactions,
  }) {
    makeList();
  }

  makeList() {
    int cpt;
    int total = listOfTransactions.length;
    while (listOfTransactions.isNotEmpty) {
      var first = listOfTransactions[0];
      cpt = 0;
      for (int j = 0; j < listOfTransactions.length; j++) {
        if (listOfTransactions[j].category['name'] == first.category['name']) {
          cpt += 1;
        }
      }
      listOfTransactions.removeWhere((element) {
        return element.category['name'] == first.category['name'];
      });
      myList.add({
        'name': first.category['name'],
        'color': first.category['color'],
        'value': (cpt / total),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // color: Colors.red,
      child: Row(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(show: false),
                centerSpaceRadius: double.infinity,
                sectionsSpace: 0,
                sections: myList.map((e) {
                  return PieChartSectionData(
                    radius: 28,
                    value: e['value'],
                    color: e['color'],
                    showTitle: false,
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: myList.map((e) {
              return Indicator(
                text: e['name'],
                color: e['color'],
                percentage: e['value'],
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final double percentage;
  const Indicator({
    Key key,
    this.color,
    this.text,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: color,
            radius: 8,
            child: Container(
              height: 9,
              width: 9,
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
          ShaderMask(
            shaderCallback: (bounds) => RadialGradient(
              center: Alignment.topCenter,
              radius: 1.0,
              colors: [color, color.withOpacity(0.7)],
              tileMode: TileMode.clamp,
            ).createShader(bounds),
            child: Text(
              "$text  ${(percentage * 100).round()}%",
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
