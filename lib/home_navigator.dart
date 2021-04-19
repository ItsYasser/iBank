import 'package:flutter/material.dart';
import 'package:personal_expenses_2/bars/bottom_bar.dart';
import 'package:personal_expenses_2/constants.dart';
import 'package:personal_expenses_2/screens/chart.dart';
import 'package:personal_expenses_2/screens/history.dart';
import 'package:personal_expenses_2/screens/profile.dart';
import 'package:personal_expenses_2/Widgets/centeredFab.dart';
import 'package:personal_expenses_2/screens/home.dart';
import 'models/Income.dart';
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
    setIncomeValue();
    setExpensesValue();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  List<Transaction> _transactions = kTransaction;
  List<Income> _incomes = kIncomes;
  double _expensesValue = 0;
  double _incomeValue = 0;

  void _addNewTransaction(
      {String title, double amount, DateTime dateTime, Map category}) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: dateTime,
        category: category,
        // ! this should give a unique id to each transaction
        id: DateTime.now().toString());
    setState(() {
      _transactions.insert(0, newTx);
      _expensesValue += newTx.amount;
    });
  }

  void setIncomeValue() {
    for (int i = 0; i < _incomes.length; i++) {
      _incomeValue += _incomes[i].amount;
    }
  }

  void setExpensesValue() {
    for (int i = 0; i < _transactions.length; i++) {
      _expensesValue += _transactions[i].amount;
    }
  }

  void updateIncome(double value, DateTime date, String id) {
    _incomes.add(Income(
      amount: value,
      date: date,
      id: id,
    ));
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
          Home(
            expensesValue: _expensesValue,
            incomeValue: _incomeValue,
            transactions: _transactions,
            updateIncome: updateIncome,
          ),
          History(
            myListOfTransactions: _transactions,
          ),
          Chart(
            listOfTransactions: _transactions,
            listOfIncomes: _incomes,
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
