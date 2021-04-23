import 'package:flutter/material.dart';
import 'package:personal_expenses_2/components/BNB_clipper.dart';

class BottomNavBarFinal extends StatelessWidget {
  final TabController tabController;

  const BottomNavBarFinal({this.tabController});

  @override
  Widget build(BuildContext context) {
    final realHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        56;
    final realWidth = MediaQuery.of(context).size.width;
    return ClipPath(
      clipper: MyCustomClipper3(radius: realWidth * 0.06),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: realWidth * 0.07, vertical: realHeight * 0.01),
        child: Container(
          height: realHeight * 0.085,
          width: double.infinity,
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
          child: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.transparent,
            tabs: tabs(),
            controller: tabController,
          ),
        ),
      ),
    );
  }
}

List<Widget> tabs() {
  return <Widget>[
    Icon(
      Icons.home,
    ),
    Icon(
      Icons.settings_backup_restore,
    ),
    Icon(
      Icons.bar_chart,
    ),
    Icon(
      Icons.supervised_user_circle,
    ),
  ];
}
