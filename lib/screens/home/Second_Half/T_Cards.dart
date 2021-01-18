import 'package:flutter/material.dart';
import 'package:personal_expenses_2/screens/home/Second_Half/transaction_card.dart';

class TransactionCards extends StatelessWidget {
  final double realHeight;
  final List transactions;
  TransactionCards({@required this.realHeight, @required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: realHeight * 0.017),
      height: realHeight * 0.45,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: transactions.map((tx) {
          return TransactionCard(
            amount: tx.amount,
            date: tx.date,
            id: tx.id,
            title: tx.title,
            color: tx.color,
          );
        }).toList(),
      ),
    );
  }
}
