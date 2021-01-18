import 'package:flutter/material.dart';
import 'package:personal_expenses_2/screens/home/components/custom_clipper3.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: MyCustomClipper3(radius: size.width * 0.06),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.07, vertical: size.height * 0.01),
        child: Container(
          height: size.height * 0.075,
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
              Icon(
                Icons.home,
                color: Color(0xff8A1AE6),
                size: ResponsiveFlutter.of(context).fontSize(3.1),
              ),
              Icon(
                Icons.settings_backup_restore,
                color: Colors.grey,
                size: ResponsiveFlutter.of(context).fontSize(3.1),
              ),
              Icon(
                Icons.bar_chart,
                color: Colors.grey,
                size: ResponsiveFlutter.of(context).fontSize(3.1),
              ),
              Icon(
                Icons.supervised_user_circle,
                color: Colors.grey,
                size: ResponsiveFlutter.of(context).fontSize(3.1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
