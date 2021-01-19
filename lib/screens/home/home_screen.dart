import 'package:flutter/material.dart';
import 'package:personal_expenses_2/bars/app_bar.dart';
import 'package:personal_expenses_2/models/Transactions.dart';
import 'package:personal_expenses_2/screens/home/First_Half/LastT_SeeAll.dart';
import 'package:personal_expenses_2/screens/home/First_Half/TopHalf.dart';

import 'Second_Half/transaction_card.dart';

class Home extends StatelessWidget {
  static const String routeName = 'Home';

  final double realWidth;
  final double realHeight;
  final double incomeValue;
  final double expensesValue;
  final List<Transaction> allTransactions;
  final List<Transaction> transactions;

  const Home(
      {Key key,
      this.realWidth,
      this.realHeight,
      this.incomeValue,
      this.expensesValue,
      this.allTransactions,
      this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              income: incomeValue,
              expenses: expensesValue,
            ),
          ),
          SizedBox(
            height: realHeight * 0.025,
          ),
          LastTseeAll(
            transactions: allTransactions,
          ),
          Container(
            margin: EdgeInsets.only(top: realHeight * 0.01),
            height: realHeight * 0.45,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: transactions.length <= 2
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.spaceEvenly,
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
          ),
          SizedBox(
            height: realHeight * 0.009,
          ),
        ],
      ),
    );
  }
}

// class Home extends StatefulWidget {
//   static const String routeName = 'Home';
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   Future changeIncome(double incomeVal) {
//     return showModalBottomSheet<void>(
//         context: context,
//         builder: (BuildContext context) {
//           return Container(
//             height: 200,
//             color: Colors.purple[200],
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Text('Your Current income : ${incomeVal.toString()}'),
//                   ElevatedButton(
//                     child: const Text('Close BottomSheet'),
//                     onPressed: () => Navigator.pop(context),
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       extendBodyBehindAppBar: true,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: realHeight * 0.46,
//             width: realWidth,
//             child: TopHalf(
//               income: _incomeValue,
//               expenses: _expensesValue,
//             ),
//           ),
//           SizedBox(
//             height: realHeight * 0.025,
//           ),
//           LastTseeAll(
//             transactions: _alltransactions,
//           ),
//           Container(
//             margin: EdgeInsets.only(top: realHeight * 0.01),
//             height: realHeight * 0.45,
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: _transactions.length <= 2
//                   ? MainAxisAlignment.start
//                   : MainAxisAlignment.spaceEvenly,
//               children: _transactions.map((tx) {
//                 return TransactionCard(
//                   amount: tx.amount,
//                   date: tx.date,
//                   id: tx.id,
//                   title: tx.title,
//                   color: tx.color,
//                 );
//               }).toList(),
//             ),
//           ),
//           SizedBox(
//             height: realHeight * 0.009,
//           ),
//         ],
//       ),
//     );
//   }
// }
