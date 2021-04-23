import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class TransactionCard extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Map category;
  TransactionCard({this.id, this.title, this.amount, this.date, this.category});

  String getImage() {
    switch (category['name']) {
      case 'Entertainement':
        return 'Entertainement40';
      case 'Social & Lifestyle':
        return 'Lifestyle40';
      case 'Beauty & Health':
        return 'Beauty40';
      case 'Other':
        return 'Other40';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 28, right: 28, top: 13),
      height: size.height * 0.112,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        border: Border.all(color: Colors.grey[400].withOpacity(0.6)),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 18, right: 10),
            height: size.height * 0.081,
            width: size.width * 0.02,
            decoration: BoxDecoration(
              color: category['color'],
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 18),
            height: size.height * 0.081,
            width: size.height * 0.081,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 13,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Container(
              child: Image.asset(
                "assets/" + getImage() + ".png",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          DateFormat.yMd().format(date),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.495),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "\$${amount.toString()}",
                        softWrap: false,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Colors.redAccent[400],
                          fontWeight: FontWeight.w900,
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.07),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(1.84),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
