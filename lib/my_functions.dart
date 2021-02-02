import 'package:flutter/material.dart';

import 'manda_equivalent.dart';
import 'manda_events_doc.dart';
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

  static eventsDoc(List events, String localLang) {
    // print(events);

    String doc = '';

    events.forEach((event) {
      // print(event);
      if ((event.runtimeType.toString()).contains('List')) {
        event = event[0];
      }

      doc = doc +
          MandaEventsDoc.findEevent(event["en_US"].trim(), localLang) +
          "\n\n" +
          '*' * 15 +
          "\n";

      // if (localLang == "fa_IR") {
      //   doc = doc + MandaEventsDoc.eventsFa(event["en_US"].trim());
      //   // print("****************            ##############");
      // }
      // print(event["en_US"]);
      // print(doc);
      // print("****************");
    });
    return doc;
  }
}
