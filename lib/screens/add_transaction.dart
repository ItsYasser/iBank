import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses_2/Widgets/date_picker.dart';
import 'package:personal_expenses_2/Widgets/rich_text.dart';
import 'package:personal_expenses_2/constants.dart';
import 'package:personal_expenses_2/Widgets/categories.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

Map<String, dynamic> categories = {
  'Text': ['Entertainement', 'Social & Lifestyle', 'Beauty & Health', 'Other'],
  'color': [Colors.blueAccent, Colors.purple, Colors.red, Colors.greenAccent],
};

class AddTransaction extends StatefulWidget {
  final TabController tabController;
  final double totalBallance;
  final Function addTransaction;
  AddTransaction(this.addTransaction, this.tabController, this.totalBallance);
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  Color _categoryColor;
  String _titleValue;
  String _category;

  double _amountValue;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _categoryColor = categories['color'][0];
    _category = categories['Text'][0];
  }

  void changeCategory(Map<dynamic, dynamic> category) {
    setState(() {
      _category = category['text'];
      _categoryColor = category['color'];
    });
  }

  void setDate(DateTime newDate) {
    _selectedDate = newDate;
  }

  List<Categories> getWidgetsOfCategories(
      {double realHeight, double realWidth}) {
    List<Categories> newList = [];
    bool lastIndex;

    for (int i = 0; i < categories['Text'].length; i++) {
      lastIndex = (i == (categories['Text'].length) - 1) ? true : false;
      newList.add(
        Categories(
          realHeight: realHeight,
          realWidth: realWidth,
          color: categories['color'][i],
          text: categories['Text'][i],
          character: _category,
          function: changeCategory,
          lastIndex: lastIndex,
        ),
      );
    }
    return newList;
  }

  @override
  Widget build(BuildContext context) {
    final realHeight = MediaQuery.of(context).size.height -
        buildAppBar(context).preferredSize.height -
        MediaQuery.of(context).padding.top;
    final realWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: realWidth * 0.05, right: realWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              buildText(context, "Title :"),
              const SizedBox(
                height: 15,
              ),
              TextField(
                onChanged: (value) {
                  _titleValue = value;
                },
                cursorColor: Theme.of(context).primaryColor,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Write your title here',
                ),
                autocorrect: false,
                style: kTextFieldTextStyle.copyWith(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              buildText(context, "Category :"),
              const SizedBox(
                height: 25,
              ),
              buildCategoryBox(realHeight, realWidth),
              const SizedBox(
                height: 30,
              ),
              RichTextWidget("Amount", "Your Balance", widget.totalBallance),
              const SizedBox(
                height: 25,
              ),
              TextField(
                onChanged: (value) {
                  _amountValue = double.parse(value);
                },
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.number,
                decoration: kTextFieldDecoration,
                autocorrect: false,
                style: kTextFieldTextStyle.copyWith(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DatePicker(
                updateDateValue: setDate,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildInkWell(context, realWidth, realHeight),
    );
  }

  Text buildText(BuildContext context, String name) {
    return Text(
      name,
      style: TextStyle(
        fontSize: ResponsiveFlutter.of(context).fontSize(2),
        fontWeight: FontWeight.w800,
      ),
    );
  }

  InkWell buildInkWell(
      BuildContext context, double realWidth, double realHeight) {
    return InkWell(
      onTap: () {
        widget.addTransaction(
            title: _titleValue,
            amount: _amountValue,
            dateTime: _selectedDate,
            category: {
              'name': _category,
              'color': _categoryColor,
            });
        widget.tabController.animateTo(0);
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: realWidth * 0.05, vertical: realHeight * 0.01),
        height: realHeight * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 4,
                offset: Offset(0, 0),
                spreadRadius: 2,
              )
            ]),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Save",
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Container buildCategoryBox(double realHeight, double realWidth) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          realWidth * 0.05,
          realHeight * 0.01,
          realWidth * 0.02,
          realHeight * 0.008,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getWidgetsOfCategories(
              realHeight: realHeight, realWidth: realWidth),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
      title: Text(
        "Add Transaction",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
