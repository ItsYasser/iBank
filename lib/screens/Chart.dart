import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses_2/models/Transactions.dart';
import 'package:personal_expenses_2/widgets/circle_chart.dart';
import 'package:personal_expenses_2/widgets/trying.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listOfTransactions;

  Chart({this.listOfTransactions}) {
    makeList();
  }
  List myList = [];
  void makeList() {
    double cpt;
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
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          "Charts",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CircleChart(myList: myList),
              SizedBox(
                height: 210,
              ),
              Text(
                "Janvier - Week 3",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "11 Oct - 17 OCT 2020",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              BarChartSample2(),
            ],
          ),
        ),
      ),
    );
  }
}
