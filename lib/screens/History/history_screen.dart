import 'package:flutter/material.dart';
import 'package:personal_expenses_2/bars/app_bar.dart';
import 'package:personal_expenses_2/models/Transactions.dart';
import 'package:personal_expenses_2/screens/home/BottomNav/centeredFab.dart';
import 'package:personal_expenses_2/screens/home/Second_Half/T_Cards.dart';
import 'package:personal_expenses_2/screens/home/components/custom_clipper3.dart';
import 'package:personal_expenses_2/screens/home/home_screen.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import 'DateCard.dart';

class History extends StatefulWidget {
  final List<Transaction> myListOfTransactions;
  final double realHeight;
  final double realWidth;
  History({this.myListOfTransactions, this.realHeight, this.realWidth});

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
    for (int i = 0; i <= 4; i++) {
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
    return Scaffold(
      extendBodyBehindAppBar: false,
      // extendBody: true,
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: widget.realWidth * 0.045, top: widget.realWidth * 0.045),
            child: Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveFlutter.of(context).fontSize(2.1),
              ),
            ),
          ),
          SizedBox(
            height: widget.realHeight * 0.03,
          ),
          Container(
            height: widget.realHeight * 0.17,
            child: ListView.builder(
                itemCount: showListofDates().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var list = showListofDates();
                  return list[index];
                }),
          ),
          SizedBox(
            height: widget.realHeight * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.realWidth * 0.045),
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
            height: widget.realHeight * 0.02,
          ),
          TransactionCards(
            realHeight: widget.realHeight,
            transactions: _newList,
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
