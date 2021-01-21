import 'package:flutter/material.dart';

import 'package:personal_expenses_2/Widgets/date_picker.dart';
import 'package:personal_expenses_2/Widgets/rich_text.dart';
import 'package:personal_expenses_2/constants.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

double _amount;

class AddIncome extends StatelessWidget {
  final Function updateIncome;
  AddIncome({this.income, this.updateIncome});
  final double income;

  DateTime _selectedDate = DateTime.now();

  void setDate(DateTime newDate) => _selectedDate = newDate;

  @override
  Widget build(BuildContext context) {
    void sendData() {
      updateIncome(_amount);
      Navigator.pop(context);
    }

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichTextWidget("Add income", "Your Total Income", income),
            const SizedBox(
              height: 25,
            ),
            TextField(
              onSubmitted: (value) {
                _amount = double.parse(value);
              },
              cursorColor: Colors.purple[600],
              keyboardType: TextInputType.number,
              decoration: kTextFieldDecoration,
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
            DatePicker(
              updateDateValue: setDate,
            ),
            GestureDetector(
              onTap: sendData,
              child: Container(
                margin: EdgeInsets.only(top: 15),
                height: 50,
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
            ),
          ],
        ),
      ),
    );
  }
}
