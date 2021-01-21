import 'package:flutter/material.dart';
import 'package:personal_expenses_2/bars/bottom_bar.dart';
import 'package:personal_expenses_2/constants.dart';
import 'package:personal_expenses_2/screens/chart.dart';
import 'package:personal_expenses_2/screens/history.dart';
import 'package:personal_expenses_2/screens/profile.dart';
import 'package:personal_expenses_2/Widgets/centeredFab.dart';
import 'package:personal_expenses_2/screens/home.dart';

import 'models/Transactions.dart';

class HomeBody extends StatefulWidget {
  static const routeName = 'HomeBody';
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

  List<Transaction> _transactions = kTransaction;
  List<Transaction> _alltransactions = kAllTransactions;
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

  void setIncome(double value) {
    setState(() {
      _incomeValue += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: TabBarView(
        children: [
          Chart(),
          Home(
            allTransactions: _alltransactions,
            expensesValue: _expensesValue,
            incomeValue: _incomeValue,
            transactions: _transactions,
            setIncome: setIncome,
          ),
          History(
            myListOfTransactions: _transactions,
          ),
          Profile(),
        ],
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      bottomNavigationBar: BottomNavBarFinal(
        tabController: _tabController,
      ),
      floatingActionButton: FAB(_addNewTransaction, _tabController),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
