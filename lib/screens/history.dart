import 'package:flutter/material.dart';
import 'package:personal_expenses_2/constants.dart';
import 'package:personal_expenses_2/models/Transactions.dart';
import 'package:personal_expenses_2/Widgets/transaction_card.dart';
import 'package:personal_expenses_2/widgets/LastT_SeeAll.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import '../Widgets/DateCard.dart';

class History extends StatefulWidget {
  final List<Transaction> transactions;
  History({this.transactions});

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int _index;
  List<Transaction> _listOfTransactions = [];
  @override
  void initState() {
    super.initState();
    getListOfTransactions(DateTime.now());
    _index = DateTime.now().day;
  }

  void getListOfTransactions(DateTime date) {
    _listOfTransactions.clear();
    for (Transaction tx in widget.transactions) {
      if (tx.date.day == date.day) {
        _listOfTransactions.add(tx);
      }
    }
    setState(() {
      _index = date.day;
    });
  }

  List<DateCard> getListofDateCards() {
    List<DateCard> newList = [];
    for (int i = 0; i < kNumDays; i++) {
      DateTime date = DateTime.now().subtract(Duration(days: i));
      newList.add(DateCard(
        date: date,
        function: getListOfTransactions,
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
                itemCount: getListofDateCards().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var list = getListofDateCards();
                  return list[index];
                }),
          ),
          SizedBox(
            height: realHeight * 0.05,
          ),
          LastTseeAll(
            transactions: _listOfTransactions,
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
                  mainAxisAlignment: _listOfTransactions.length <= 2
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceEvenly,
                  children: _listOfTransactions
                      .getRange(
                          0,
                          _listOfTransactions.length < 3
                              ? _listOfTransactions.length
                              : 3)
                      .map((tx) {
                    return TransactionCard(
                      amount: tx.amount,
                      date: tx.date,
                      id: tx.id,
                      title: tx.title,
                      category: tx.category,
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
