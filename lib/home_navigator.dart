import 'package:flutter/material.dart';
import 'package:personal_expenses_2/bars/bottom_bar.dart';
import 'package:personal_expenses_2/screens/Chart.dart';
import 'package:personal_expenses_2/screens/History/history_screen.dart';
import 'package:personal_expenses_2/screens/Profile.dart';
import 'package:personal_expenses_2/screens/home/BottomNav/centeredFab.dart';
import 'package:personal_expenses_2/screens/home/home_screen.dart';

import 'bars/app_bar.dart';
import 'models/Transactions.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    final realHeight = MediaQuery.of(context).size.height -
        buildAppBar(context).preferredSize.height -
        MediaQuery.of(context).padding.top;
    final realWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      extendBody: true,

      // appBar: buildAppBar(context),
      body: TabBarView(
        children: [
          Home(
            realHeight: realHeight,
            realWidth: realWidth,
            allTransactions: _alltransactions,
            expensesValue: _expensesValue,
            incomeValue: _incomeValue,
            transactions: _transactions,
          ),
          History(
            myListOfTransactions: _transactions,
            realHeight: realHeight,
            realWidth: realWidth,
          ),
          Chart(),
          Profile(),
        ],
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      bottomNavigationBar: BottomNavBarFinal(
        realHeight: realHeight,
        realWidth: realWidth,
        tabController: _tabController,
      ),
      floatingActionButton: FAB(_addNewTransaction),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
