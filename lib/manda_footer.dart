import 'package:flutter/material.dart';

import 'manda_equivalent.dart';
import 'my_color.dart';
import 'my_icon_events.dart';

Widget footerLine(
    BuildContext context, String _localLang, sizeRate, marginHor) {
  Map _myColorSelection = Mycolor.selection();
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: _myColorSelection['header2'],
    ),
    margin: EdgeInsets.symmetric(horizontal: marginHor, vertical: 8),
    child: Column(
      children: [
        footerFirstLine(context, _localLang, sizeRate),
        footerSecondLine(context, _localLang, sizeRate),
      ],
    ),
  );
}

Widget footerFirstLine(BuildContext context, String _localLang, sizeRate) {
  String spaceNotEn = '';
  Map _myColorSelection = Mycolor.selection();
  MyIcon myIcon = MyIcon(sizeRate);
  // print(_localLang);
  var religBeforeIcon;
  var minorBeforeIcon;
  var religAfterIcon;
  var minorAfterIcon;
  var myFontSize;
  String mySpace = "";

  if (_localLang == "en_US") {
    religBeforeIcon = myIcon.relig;
    religAfterIcon = myIcon.noon;
    minorBeforeIcon = myIcon.minor;
    minorAfterIcon = myIcon.noon;
    myFontSize = 20.0 * sizeRate;
    mySpace = " ";
  } else {
    spaceNotEn = ' ';
    religAfterIcon = myIcon.relig;
    religBeforeIcon = myIcon.noon;
    minorAfterIcon = myIcon.minor;
    minorBeforeIcon = myIcon.noon;
    myFontSize = 16.0 * sizeRate;
  }

  return Container(
    child: FittedBox(
      fit: BoxFit.contain,
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: Center(
          child: Row(
            children: <Widget>[
              // myIcon.relig,
              Text(mySpace),
              religBeforeIcon,
              Text(MandaEqu.mandaFeastName()[0][_localLang] + spaceNotEn,
                  style: TextStyle(
                    fontSize: myFontSize,
                    // color: Colors.green,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold
                  )),
              religAfterIcon,
              // myIcon.minor,
              minorBeforeIcon,
              Text(MandaEqu.mandaLightMbattal()[0][_localLang],
                  style: TextStyle(
                    fontSize: myFontSize,
                    // color: Colors.orangeAccent[700],
                    color: Colors.black,
                    // fontWeight: FontWeight.bold
                  )),
              minorAfterIcon,
            ],
          ),
        ),
      ),
    ),
  );
}

Widget footerSecondLine(BuildContext context, String _localLang, sizeRate) {
  String spaceNotEn = '';
  Map _myColorSelection = Mycolor.selection();
  MyIcon myIcon = MyIcon(sizeRate);
  // print(_localLang);
  var firstMonthBeforeIcon;
  var firstMonthAfterIcon;
  var majorBeforeIcon;
  var majorAfterIcon;
  var myFontSize;
  String mySpace = "";

  if (_localLang == "en_US") {
    firstMonthBeforeIcon = myIcon.firstMonth;
    firstMonthAfterIcon = myIcon.noon;
    majorBeforeIcon = myIcon.major;
    majorAfterIcon = myIcon.noon;
    myFontSize = 20.0 * sizeRate;
    mySpace = '  ';
  } else {
    spaceNotEn = ' ';
    firstMonthAfterIcon = myIcon.firstMonth;
    firstMonthBeforeIcon = myIcon.noon;
    majorAfterIcon = myIcon.major;
    majorBeforeIcon = myIcon.noon;
    myFontSize = 16.0 * sizeRate;
  }
  return Container(
    // margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
    child: FittedBox(
      fit: BoxFit.contain,
      child: Container(
        child: Center(
          child: Row(
            children: <Widget>[
              // myIcon.firstMonth,
              Text(mySpace),
              firstMonthBeforeIcon,
              Text(MandaEqu.mandaFirstMonth()[0][_localLang] + spaceNotEn,
                  style: TextStyle(
                    fontSize: myFontSize,
                    // color: Colors.blue[800],
                    color: Colors.black,
                    // fontWeight: FontWeight.bold
                  )),
              firstMonthAfterIcon,
              // myIcon.major,
              majorBeforeIcon,
              Text(MandaEqu.mandaHeavyMbattal()[0][_localLang],
                  style: TextStyle(
                    fontSize: myFontSize,
                    // color: Colors.red[800],
                    color: Colors.black,
                    // fontWeight: FontWeight.bold
                  )),
              majorAfterIcon,
            ],
          ),
        ),
      ),
    ),
  );
}
