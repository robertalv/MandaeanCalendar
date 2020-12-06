import 'package:flutter/material.dart';

import 'manda_equivalent.dart';
import 'my_alignment.dart';

class Functions {
  static void showMyDialog(BuildContext context, String localLang, String title,
      String msg, double fontSizeRate) async {
    double _cardFontSize = 20 * fontSizeRate;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: _cardFontSize,
                fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  msg,
                  textAlign: MyAlignment.textAlig(localLang),
                  style:
                      TextStyle(color: Colors.black, fontSize: _cardFontSize),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                MandaEqu.alertOk(localLang),
                style:
                    TextStyle(color: Colors.blue[800], fontSize: _cardFontSize),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            )
          ],
        );
      },
    );
  }
}
