import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses_2/screens/NewTransaction/Categories.dart';
import 'package:personal_expenses_2/screens/home/home_screen.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:intl/intl.dart';

enum CategoryName {
  Entertainement,
  Social_and_LifeStyle,
  Beauty_and_Health,
  Other,
}
Map<String, dynamic> categories = {
  'Text': ['Entertainement', 'Social & Lifestyle', 'Beauty & Health', 'Other'],
  'color': [Colors.blueAccent, Colors.purple, Colors.red, Colors.greenAccent],
};

class AddTransaction extends StatefulWidget {
  final Function addTransaction;
  AddTransaction(this.addTransaction);
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  void _chooseDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  void changeCharacter(Map<dynamic, dynamic> character) {
    setState(() {
      _character = character['text'];
      categoryColor = character['color'];
    });
  }

  Color categoryColor = categories['color'][0];
  List<Widget> getWidgetsOfCategories({double realHeight, double realWidth}) {
    List<Categories> newList = [];
    int i = 0;
    bool lastIndex;
    while (i < categories['Text'].length) {
      lastIndex = i == (categories['Text'].length) - 1 ? true : false;
      newList.add(Categories(
        realHeight: realHeight,
        realWidth: realWidth,
        color: categories['color'][i],
        text: categories['Text'][i],
        character: _character,
        function: changeCharacter,
        lastIndex: lastIndex,
      ));
      i++;
    }
    return newList;
  }

  String titleController;
  String _character = categories['Text'][0];
  double amountController;

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    print(categoryColor);
    final realHeight = MediaQuery.of(context).size.height -
        buildAppBar(context).preferredSize.height -
        MediaQuery.of(context).padding.top;
    final realWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: realWidth * 0.05, right: realWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Title :",
                    style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(2),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    // controller: titleController,
                    onSubmitted: (value) {
                      titleController = value;
                    },
                    cursorColor: Colors.purple[600],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(30, 19, 20, 19),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[400].withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.purple[600],
                        ),
                      ),
                      hintText: 'Write your title here',
                      fillColor: Colors.grey[200].withOpacity(0.4),
                      filled: true,
                    ),
                    autocorrect: false,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Category :",
                    style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(2),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: realHeight * 0.36,
                    decoration: BoxDecoration(
                      // color: Colors.red,
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
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: "Amount :",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(text: " ( Your Balance:"),
                          TextSpan(
                            text: " \$425",
                            style: TextStyle(
                              color: Colors.purpleAccent[700],
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(text: " )"),
                        ]),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    onSubmitted: (value) {
                      amountController = double.parse(value);
                    },
                    cursorColor: Colors.purple[600],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(30, 19, 20, 19),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[400].withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.purple[600],
                        ),
                      ),
                      hintText: '\$50',
                      fillColor: Colors.grey[200].withOpacity(0.4),
                      filled: true,
                    ),
                    autocorrect: false,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: "Date : ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(
                                  text: _selectedDate == null
                                      ? DateFormat.yMd().format(DateTime.now())
                                      : DateFormat.yMd().format(_selectedDate)),
                            ]),
                      ),
                      FlatButton(
                        onPressed: _chooseDate,
                        child: Text("Change Date"),
                        textColor: Colors.purpleAccent[700],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          widget.addTransaction(
              title: titleController,
              amount: amountController,
              dateTime: _selectedDate,
              color: categoryColor);
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
          //   return HomeScreen();
          // }));
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: realWidth * 0.05, vertical: realHeight * 0.01),
          height: realHeight * 0.07,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
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

/* Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: realWidth * 0.035,
                                        left: realWidth * 0.018),
                                    height: realHeight * 0.05,
                                    width: realWidth * 0.023,
                                    decoration: BoxDecoration(
                                      color: categories['color'][0],
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  Text(
                                    categories['Text'][0],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.8),
                                    ),
                                  ),
                                ],
                              ),
                              Radio(
                                activeColor: Colors.purple[400],
                                value: CategoryName.Entertainement,
                                groupValue: _character,
                                onChanged: (CategoryName value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(0.2),
                            height: realHeight * 0.0008,
                            thickness: 1,
                            endIndent: realWidth * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: realWidth * 0.035,
                                        left: realWidth * 0.018),
                                    height: realHeight * 0.05,
                                    width: realWidth * 0.023,
                                    decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  Text(
                                    "Social & Lifestyle",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.8),
                                    ),
                                  ),
                                ],
                              ),
                              Radio(
                                activeColor: Colors.purple[400],
                                value: CategoryName.Social_and_LifeStyle,
                                groupValue: _character,
                                onChanged: (CategoryName value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(0.2),
                            height: realHeight * 0.0008,
                            thickness: 1,
                            endIndent: realWidth * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: realWidth * 0.035,
                                        left: realWidth * 0.018),
                                    height: realHeight * 0.05,
                                    width: realWidth * 0.023,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  Text(
                                    "Beauty & Health",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.8),
                                    ),
                                  ),
                                ],
                              ),
                              Radio(
                                activeColor: Colors.purple[400],
                                value: CategoryName.Beauty_and_Health,
                                groupValue: _character,
                                onChanged: (CategoryName value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(0.2),
                            height: realHeight * 0.0008,
                            thickness: 1,
                            endIndent: realWidth * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: realWidth * 0.035,
                                        left: realWidth * 0.018),
                                    height: realHeight * 0.05,
                                    width: realWidth * 0.023,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  Text(
                                    "Other",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.8),
                                    ),
                                  ),
                                ],
                              ),
                              Radio(
                                activeColor: Colors.purple[400],
                                value: CategoryName.Other,
                                groupValue: _character,
                                onChanged: (CategoryName value) {
                                  setState(() {
                                    _character = value;
                                    print(value);
                                    print(_character);
                                  });
                                },
                              ),
                            ],
                          ),
                          */
