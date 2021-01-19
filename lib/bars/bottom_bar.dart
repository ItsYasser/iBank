import 'package:flutter/material.dart';
import 'package:personal_expenses_2/screens/home/components/custom_clipper3.dart';

class BottomNavBarFinal extends StatelessWidget {
  final realWidth;
  final realHeight;
  final TabController tabController;

  const BottomNavBarFinal(
      {this.realWidth, this.realHeight, this.tabController});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper3(radius: realWidth * 0.06),
      child: Padding(
        // padding: EdgeInsets.only(
        //     left: realWidth * 0.07,
        //     right: realWidth * 0.07,
        //     bottom: realHeight * 0.015),
        padding: EdgeInsets.symmetric(
            horizontal: realWidth * 0.07, vertical: realHeight * 0.01),
        child: Container(
          height: realHeight * 0.085,
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
          child: TabBar(
            labelColor: Colors.deepPurple,
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
