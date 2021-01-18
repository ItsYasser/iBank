import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_2/models/Transactions.dart';
import 'package:personal_expenses_2/screens/AddTransaction_screen.dart';
import 'package:personal_expenses_2/screens/History/history_screen.dart';
import 'package:personal_expenses_2/screens/home/BottomNav/BottomNavBar.dart';
import 'package:personal_expenses_2/screens/home/BottomNav/centeredFab.dart';
import 'package:personal_expenses_2/screens/home/First_Half/LastT_SeeAll.dart';
import 'package:personal_expenses_2/screens/home/First_Half/TopHalf.dart';
import 'package:personal_expenses_2/screens/home/Second_Half/T_Cards.dart';
import 'package:personal_expenses_2/screens/home/components/custom_clipper3.dart';
import 'package:personal_expenses_2/screens/home/components/two_curvesClipper.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import 'Second_Half/transaction_card.dart';

List<Transaction> _transactions = [
  // Transaction(
  //     amount: 60.01,
  //     color: Colors.pink,
  //     date: DateTime.now(),
  //     title: 'New Shoes'),
  Transaction(
      amount: 60.02,
      color: Colors.pink,
      date: DateTime.now(),
      title: 'New Shoes'),
  Transaction(
      amount: 60.03,
      color: Colors.pink,
      date: DateTime.now(),
      title: 'New Shoes'),
];

List<Transaction> _alltransactions = [
  Transaction(
      amount: 60.01,
      color: Colors.pink,
      date: DateTime.now(),
      title: 'New Shoes'),
  Transaction(
      amount: 60.02,
      color: Colors.pink,
      date: DateTime.now(),
      title: 'New Shoes'),
  Transaction(
      amount: 60.03,
      color: Colors.pink,
      date: DateTime.now(),
      title: 'New Shoes'),
];
double _expensesValue = 764000.6;
double _incomeValue = 8500000;

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addNewTransaction(
      {String title, double amount, DateTime dateTime, Color color}) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: dateTime,
        color: color,
        id: DateTime.now().toString());
    setState(() {
      if (_transactions.length >= 3) {
        _transactions.removeLast();
      }
      _transactions.insert(0, newTx);
      // _transactions.add(newTx);
      _alltransactions.insert(0, newTx);
      _expensesValue -= newTx.amount;
      // print(newTx.title);
    });
  }

  Future changeIncome(double incomeVal) {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: Colors.purple[200],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Your Current income : ${incomeVal.toString()}'),
                  ElevatedButton(
                    child: const Text('Close BottomSheet'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final realHeight = MediaQuery.of(context).size.height -
        buildAppBar(context).preferredSize.height -
        MediaQuery.of(context).padding.top;
    final realWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: realHeight * 0.46,
            width: realWidth,
            child: TopHalf(
              income: _incomeValue,
              expenses: _expensesValue,
            ),
          ),
          SizedBox(
            height: realHeight * 0.025,
          ),
          LastTseeAll(
            transactions: _alltransactions,
          ),
          Container(
            margin: EdgeInsets.only(top: realHeight * 0.01),
            height: realHeight * 0.45,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: _transactions.length <= 2
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.spaceEvenly,
              children: _transactions.map((tx) {
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
          SizedBox(
            height: realHeight * 0.009,
          ),
        ],
      ),
      bottomNavigationBar: ClipPath(
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
                  onPressed: () {},
                  color: Color(0xff8A1AE6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  iconSize: ResponsiveFlutter.of(context).fontSize(3.1),
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings_backup_restore,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return HistoryScreen(
                        myListOfTransactions: _transactions,
                      );
                    }));
                  },
                  color: Colors.grey,
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
      floatingActionButton: FAB(_addNewTransaction),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Welcome Back, Yasser",
        style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(2.4)),
      ),
      centerTitle: false,
      actions: [
        GestureDetector(
          onTap: () {
            changeIncome(_incomeValue);
          },
          child: Icon(
            Icons.monetization_on,
            size: ResponsiveFlutter.of(context).fontSize(3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.more_vert,
              size: ResponsiveFlutter.of(context).fontSize(3),
            ),
          ),
        ),
      ],
    );
  }
}
