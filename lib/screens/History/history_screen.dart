import 'package:flutter/material.dart';
import 'package:personal_expenses_2/models/Transactions.dart';
import 'package:personal_expenses_2/screens/home/BottomNav/BottomNavBar.dart';
import 'package:personal_expenses_2/screens/home/BottomNav/centeredFab.dart';
import 'package:personal_expenses_2/screens/home/First_Half/LastT_SeeAll.dart';
import 'package:personal_expenses_2/screens/home/Second_Half/T_Cards.dart';
import 'package:personal_expenses_2/screens/home/components/custom_clipper3.dart';
import 'package:personal_expenses_2/screens/home/home_screen.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import 'DateCard.dart';

class HistoryScreen extends StatefulWidget {
  List<Transaction> myListOfTransactions;
  HistoryScreen({this.myListOfTransactions});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    showListofTransactions(DateTime.now());
  }

  List<Transaction> newList = [];
  void showListofTransactions(DateTime date) {
    newList.clear();
    for (Transaction tx in widget.myListOfTransactions) {
      if (tx.date.day == date.day) {
        newList.add(tx);
      }
    }
    _index = date.day;
    setState(() {});
  }

  int _index = DateTime.now().day;
  // void updateColor(int index) {

  // }
  // void printa(DateTime date) {
  //   print("works ?");
  //   print(date.day);
  //   print("works ?");
  //   print("works ?");
  //   print("works ?");
  // }

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
    final realHeight = MediaQuery.of(context).size.height -
        buildAppBar(context).preferredSize.height -
        MediaQuery.of(context).padding.top;
    final realWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: realWidth * 0.045),
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
          TransactionCards(
            realHeight: realHeight,
            transactions: newList,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        // padding: EdgeInsets.only(bottom: realWidth * 0.03),
        padding: EdgeInsets.only(bottom: 0),
        child: ClipPath(
          clipper: MyCustomClipper3(radius: realWidth * 0.06),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: realWidth * 0.07, vertical: realHeight * 0.01),
            child: Container(
              height: realHeight * 0.085,
              width: double.infinity,
              // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) {
                        return HomeScreen();
                      }));
                    },
                    color: Colors.grey,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    iconSize: ResponsiveFlutter.of(context).fontSize(3.1),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings_backup_restore,
                    ),
                    onPressed: () {},
                    color: Color(0xff8A1AE6),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    iconSize: ResponsiveFlutter.of(context).fontSize(3.1),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.bar_chart,
                    ),
                    onPressed: () {},
                    color: Colors.grey,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    iconSize: ResponsiveFlutter.of(context).fontSize(3.1),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.supervised_user_circle,
                    ),
                    onPressed: () {},
                    color: Colors.grey,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    iconSize: ResponsiveFlutter.of(context).fontSize(3.1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FAB(null),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List lista = [
    DateCard(),
    DateCard(),
    DateCard(),
    DateCard(),
    DateCard(),
  ];

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(color: Colors.black),
      title: Text(
        'History',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.more_vert,
            color: Colors.black,
            size: ResponsiveFlutter.of(context).fontSize(3),
          ),
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
