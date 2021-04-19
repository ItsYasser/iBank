import 'package:flutter/material.dart';
import 'package:personal_expenses_2/constants.dart';
import 'package:personal_expenses_2/home_navigator.dart';
import 'package:personal_expenses_2/screens/home.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ? aaa
      // ! aa
      // * aaaa
      //
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        primarySwatch: kSwatchColor,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      home: HomeBody(),
      routes: {
        Home.routeName: (ctx) => Home(),
        HomeBody.routeName: (ctx) => HomeBody(),
      },
    );
  }
}
