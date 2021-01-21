import 'package:flutter/material.dart';
import 'package:personal_expenses_2/constants.dart';
import 'package:personal_expenses_2/models/Transactions.dart';
import 'package:personal_expenses_2/Widgets/transaction_card.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import '../Widgets/DateCard.dart';

class History extends StatefulWidget {
  final List<Transaction> myListOfTransactions;
  History({this.myListOfTransactions});

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int _index;
  List<Transaction> _newList = [];
  @override
  void initState() {
    super.initState();
    showListofTransactions(DateTime.now());
    _index = DateTime.now().day;
  }

  void showListofTransactions(DateTime date) {
    _newList.clear();
    for (Transaction tx in widget.myListOfTransactions) {
      if (tx.date.day == date.day) {
        _newList.add(tx);
      }
    }
    setState(() {
      _index = date.day;
    });
  }

  List<DateCard> showListofDates() {
    List<DateCard> newList = [];
    for (int i = 0; i <= kNumDays; i++) {
      DateTime date = DateTime.now().subtract(Duration(days: i));
      newList.add(DateCard(
        date: date,
        function: showListofTransactions,
        index: _index,
      ));
    }
    return newList;
  }

  @override
  Widget build(BuildContext context) {
    final realHeight = MediaQuery.of(context).size.height -
        buildAppBar(context).preferredSize.height -
        MediaQuery.of(context).padding.top;
    final realWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: realWidth * 0.045, top: realWidth * 0.045),
            child: Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveFlutter.of(context).fontSize(2.1),
              ),
            ),
          ),
          SizedBox(
            height: realHeight * 0.03,
          ),
          Container(
            height: realHeight * 0.17,
            child: ListView.builder(
                itemCount: showListofDates().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var list = showListofDates();
                  return list[index];
                }),
          ),
          SizedBox(
            height: realHeight * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: realWidth * 0.045),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  "Transactions",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    color: Color(0xff5C01D0),
                    fontWeight: FontWeight.w500,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.725),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: realHeight * 0.02,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: realHeight * 0.01),
              height: realHeight * 0.45,
              padding: EdgeInsets.only(bottom: realHeight * 0.125),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: _newList.length <= 2
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceEvenly,
                  children: _newList.map((tx) {
                    return TransactionCard(
                      amount: tx.amount,
                      date: tx.date,
                      id: tx.id,
                      title: tx.title,
                      color: tx.color,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'History',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 6,
    );
  }
}
