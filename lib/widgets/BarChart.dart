import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_2/constants.dart';

class TheBarChart extends StatefulWidget {
  final List listOftransactions;
  final List listOfIncomes;
  TheBarChart({this.listOftransactions, this.listOfIncomes});
  @override
  State<StatefulWidget> createState() => TheBarChartState();
}

class TheBarChartState extends State<TheBarChart> {
  final Color leftBarColor = kPrimaryColor;
  final Color rightBarColor = const Color(0xffff5182);
  final Color nullBarColor = Colors.grey.withOpacity(0.2);
  final double width = 7;
  List myList = [];
  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex;
  List itemList;

  makeList() {
    if (widget.listOftransactions.isNotEmpty) {
      for (int i = 0; i < 7; i++) {
        var dayVar = DateTime.now().subtract(Duration(days: i));
        double expenses = 0;
        double incomes = 0;
        for (int j = 0; j < widget.listOftransactions.length; j++) {
          if (widget.listOftransactions[j].date.day == dayVar.day &&
              widget.listOftransactions[j].date.month == dayVar.month &&
              widget.listOftransactions[j].date.year == dayVar.year) {
            expenses += widget.listOftransactions[j].amount;
          }
        }
        for (int j = 0; j < widget.listOfIncomes.length; j++) {
          if (widget.listOfIncomes[j].date.day == dayVar.day &&
              widget.listOfIncomes[j].date.month == dayVar.month &&
              widget.listOfIncomes[j].date.year == dayVar.year) {
            incomes += widget.listOfIncomes[j].amount;
          }
        }
        widget.listOftransactions.removeWhere((element) {
          return (element.date.day == dayVar.day &&
              element.date.month == dayVar.month &&
              element.date.year == dayVar.year);
        });
        widget.listOfIncomes.removeWhere((element) {
          return (element.date.day == dayVar.day &&
              element.date.month == dayVar.month &&
              element.date.year == dayVar.year);
        });
        myList.add({
          'expense': expenses,
          'income': incomes,
          'day': dayVar,
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    makeList();

    int i = -1;
    final items = myList.reversed.map((e) {
      i++;

      return makeGroupData(
          i,
          num.parse((e['expense'] / 1000).toStringAsFixed(2)),
          num.parse((e['income'] / 1000).toStringAsFixed(2)));
    }).toList();

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${DateFormat(DateFormat.MONTH).format(DateTime.now())} - ${DateTime.now().year}",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            //11 -- 17
            "${DateTime.now().subtract(Duration(days: 6)).day} ${DateFormat(DateFormat.ABBR_MONTH).format(DateTime.now().subtract(Duration(days: 6)))} ----> ${DateTime.now().day} ${DateFormat(DateFormat.ABBR_MONTH).format(DateTime.now())} \n",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Card(
              margin: EdgeInsets.all(3),
              elevation: 1.2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 6, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        makeTransactionsIcon(),
                        const SizedBox(
                          width: 38,
                        ),
                        const Text(
                          'Transactions',
                          style: TextStyle(color: Colors.indigo, fontSize: 22),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          'state',
                          style: TextStyle(color: Colors.amber, fontSize: 16),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: BarChart(
                          BarChartData(
                            maxY: 20,
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (value) => const TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                margin: 20,
                                getTitles: (double value) {
                                  switch (value.toInt()) {
                                    case 6:
                                      return DateFormat(DateFormat.ABBR_WEEKDAY)
                                          .format(myList[0]['day'])
                                          .substring(0, 2);
                                    case 5:
                                      return DateFormat(DateFormat.ABBR_WEEKDAY)
                                          .format(myList[1]['day'])
                                          .substring(0, 2);
                                    case 4:
                                      return DateFormat(DateFormat.ABBR_WEEKDAY)
                                          .format(myList[2]['day'])
                                          .substring(0, 2);
                                    case 3:
                                      return DateFormat(DateFormat.ABBR_WEEKDAY)
                                          .format(myList[3]['day'])
                                          .substring(0, 2);
                                    case 2:
                                      return DateFormat(DateFormat.ABBR_WEEKDAY)
                                          .format(myList[4]['day'])
                                          .substring(0, 2);
                                    case 1:
                                      return DateFormat(DateFormat.ABBR_WEEKDAY)
                                          .format(myList[5]['day'])
                                          .substring(0, 2);
                                    case 0:
                                      return DateFormat(DateFormat.ABBR_WEEKDAY)
                                          .format(myList[6]['day'])
                                          .substring(0, 2);
                                    default:
                                      return '';
                                  }
                                },
                              ),
                              leftTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (value) => const TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                margin: 32,
                                reservedSize: 14,
                                getTitles: (value) {
                                  if (value == 1) {
                                    return '1K';
                                  } else if (value == 5) {
                                    return '5K';
                                  } else if (value == 10) {
                                    return '10K';
                                  } else if (value == 15) {
                                    return '15K';
                                  } else if (value == 20) {
                                    return '20K';
                                  } else {
                                    return '';
                                  }
                                },
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: showingBarGroups,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                            child:
                                indicators(context, rightBarColor, "Income")),
                        Expanded(
                            child:
                                indicators(context, leftBarColor, "Expenses")),
                        Expanded(
                            child:
                                indicators(context, nullBarColor, "Not Yet")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget indicators(BuildContext context, Color color, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 15),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: color,
            radius: 5,
          ),
          const SizedBox(
            width: 7,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1 == 0 ? 20 : y1,
        colors: y1 != 0 ? [leftBarColor] : [nullBarColor],
        width: width,
      ),
      BarChartRodData(
        y: y2 == 0 ? 20 : y2,
        colors: y2 != 0 ? [rightBarColor] : [nullBarColor],
        width: width,
      ),
    ]);
  }

  Widget makeTransactionsIcon() {
    const double width = 4.5;
    const double space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.blue.withOpacity(0.7),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.amber.withOpacity(0.6),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.blue,
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.amber.withOpacity(0.6),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.blue.withOpacity(0.7),
        ),
      ],
    );
  }
}
