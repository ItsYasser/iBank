import 'package:flutter/material.dart';
import 'package:personal_expenses_2/models/Transactions.dart';
import 'package:personal_expenses_2/widgets/transaction_card.dart';

class AllTransactions extends StatelessWidget {
  final List<Transaction> listOfTransactions;

  AllTransactions({Key key, this.listOfTransactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Transactions'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: listOfTransactions.map((e) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TransactionCard(
                title: e.title,
                amount: e.amount,
                date: e.date,
                id: e.id,
                color: e.category['color'],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
