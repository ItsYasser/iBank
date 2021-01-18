import 'package:flutter/material.dart';
import 'package:personal_expenses_2/screens/AddTransaction_screen.dart';
import 'package:personal_expenses_2/screens/History/history_screen.dart';
import 'package:personal_expenses_2/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ? aaa
      // ! aa
      // * aaaa
      //

      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
      },
    );
  }
}
