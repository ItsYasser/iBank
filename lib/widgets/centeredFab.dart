import 'package:flutter/material.dart';
import 'package:personal_expenses_2/screens/add_transaction.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class FAB extends StatelessWidget {
  final Function addTransaction;
  final TabController tabController;
  final double totalBalance;
  FAB(this.addTransaction, this.tabController, this.totalBalance);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveFlutter.of(context).scale(70),
      width: ResponsiveFlutter.of(context).verticalScale(35),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          elevation: 3,
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) =>
                    AddTransaction(addTransaction, tabController, totalBalance),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: Duration(milliseconds: 500),
              ),
            );
          },
          child: Icon(
            Icons.add,
            size: ResponsiveFlutter.of(context).fontSize(4),
          ),
        ),
      ),
    );
  }
}
