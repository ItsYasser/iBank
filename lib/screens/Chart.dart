import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses_2/models/Income.dart';
import 'package:personal_expenses_2/models/Transactions.dart';
import 'package:personal_expenses_2/widgets/circle_chart.dart';
import 'package:personal_expenses_2/widgets/trying.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listOfTransactions;
  final List<Income> listOfIncomes;
  Chart({this.listOfTransactions, this.listOfIncomes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          padding: EdgeInsets.fromLTRB(20, 20, 20, 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleChart(listOfTransactions: List.from(listOfTransactions)),
              SizedBox(
                height: 30,
              ),
              BarChartSample2(
                listOftransactions: List.from(listOfTransactions),
                listOfIncomes: List.from(listOfIncomes),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
