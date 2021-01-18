import 'package:flutter/material.dart';
import 'package:personal_expenses_2/screens/AddTransaction_screen.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class FAB extends StatelessWidget {
  Function addTransaction;
  FAB(this.addTransaction);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveFlutter.of(context).scale(70),
      width: ResponsiveFlutter.of(context).verticalScale(35),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: FloatingActionButton(
          backgroundColor: Color(0xff8A1AE6),
          elevation: 3,
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => AddTransaction(addTransaction),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: Duration(milliseconds: 200),
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
