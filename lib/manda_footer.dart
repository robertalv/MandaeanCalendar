import 'package:flutter/material.dart';

import 'manda_equivalent.dart';
import 'my_alignment.dart';
import 'my_color.dart';
import 'my_icon_events.dart';

Widget footerLine(
    BuildContext context, String _localLang, sizeRate, marginHor) {
  Map _myColorSelection = Mycolor.selection();
  double _paddingTop = 4;
  double helpHight = 90.0;
  double _divecWidth = MediaQuery.of(context).size.width;
  if (_divecWidth > 500) {
    helpHight = 65.0;
  }
  return Container(
    height: helpHight * sizeRate,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: _myColorSelection['header2'],
    ),
    margin: EdgeInsets.symmetric(horizontal: marginHor, vertical: 8),
    child: Column(
      children: [
        Padding(padding: EdgeInsets.only(top: _paddingTop)),
        footerFirstLine(context, _localLang, sizeRate),
        Padding(padding: EdgeInsets.only(top: _paddingTop)),
        footerSecondLine(context, _localLang, sizeRate),
      ],
    ),
  );
}

Widget footerFirstLine(BuildContext context, String _localLang, sizeRate) {
  String spaceNotEn = '';
  var myTextAlignment = MyAlignment.textAlig(_localLang);
  Map _myColorSelection = Mycolor.selection();
  MyIcon myIcon = MyIcon(sizeRate);
  // print(_localLang);
  var religBeforeIcon;
  var minorBeforeIcon;
  var religAfterIcon;
  var minorAfterIcon;
  var myFontSize;
  String mySpace = " ";
  double _divecWidth = MediaQuery.of(context).size.width;
  double _iconWidgetSize;
  double _textWidgetSize;

  if (_localLang == "en_US") {
    religBeforeIcon = myIcon.relig;
    religAfterIcon = myIcon.noon;
    minorBeforeIcon = myIcon.minor;
    minorAfterIcon = myIcon.noon;
    myFontSize = 14.0 * sizeRate;
    mySpace = " ";
  } else {
    spaceNotEn = ' ';
    religAfterIcon = myIcon.relig;
    religBeforeIcon = myIcon.noon;
    minorAfterIcon = myIcon.minor;
    minorBeforeIcon = myIcon.noon;
    myFontSize = 19.0 * sizeRate;
  }

  if (_divecWidth > 700) {
    _iconWidgetSize = 8.0 * sizeRate;
    _textWidgetSize = 300;
  } else {
    _iconWidgetSize = 8;
    _textWidgetSize = _divecWidth / 2 - 32;
  }

  return Flexible(
    child: Row(
      children: [
        SizedBox(width: _iconWidgetSize, child: religBeforeIcon),
        SizedBox(width: 6),
        SizedBox(
          width: _textWidgetSize,
          child: Text(MandaEqu.mandaFeastName()[0][_localLang] + spaceNotEn,
              textAlign: myTextAlignment,
              style: TextStyle(
                fontSize: myFontSize,
                color: Colors.black,
              )),
        ),
        // SizedBox(width: 6),
        SizedBox(width: _iconWidgetSize, child: religAfterIcon),
        SizedBox(width: _iconWidgetSize, child: minorBeforeIcon),
        SizedBox(width: 6),
        SizedBox(
          width: _textWidgetSize,
          child: Text(MandaEqu.mandaLightMbattal()[0][_localLang],
              textAlign: myTextAlignment,
              style: TextStyle(
                fontSize: myFontSize,
                color: Colors.black,
              )),
        ),
        SizedBox(width: _iconWidgetSize, child: minorAfterIcon),
      ],
    ),
  );
}

Widget footerSecondLine(BuildContext context, String _localLang, sizeRate) {
  var myTextAlignment = MyAlignment.textAlig(_localLang);
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
  double _divecWidth = MediaQuery.of(context).size.width;
  double _iconWidgetSize;
  double _textWidgetSize;

  if (_localLang == "en_US") {
    firstMonthBeforeIcon = myIcon.firstMonth;
    firstMonthAfterIcon = myIcon.noon;
    majorBeforeIcon = myIcon.major;
    majorAfterIcon = myIcon.noon;
    myFontSize = 14.0 * sizeRate;
    mySpace = '  ';
  } else {
    spaceNotEn = ' ';
    firstMonthAfterIcon = myIcon.firstMonth;
    firstMonthBeforeIcon = myIcon.noon;
    majorAfterIcon = myIcon.major;
    majorBeforeIcon = myIcon.noon;
    myFontSize = 19.0 * sizeRate;
  }

  if (_divecWidth > 700) {
    _iconWidgetSize = 8.0 * sizeRate;
    _textWidgetSize = 300;
  } else {
    _iconWidgetSize = 8;
    _textWidgetSize = _divecWidth / 2 - 32;
  }

  return Flexible(
    child: Row(
      children: [
        SizedBox(width: _iconWidgetSize, child: firstMonthBeforeIcon),
        SizedBox(
          width: 6,
          child: Text(mySpace),
        ),
        SizedBox(
          width: _textWidgetSize,
          child: Text(MandaEqu.mandaFirstMonth()[0][_localLang] + spaceNotEn,
              textAlign: myTextAlignment,
              style: TextStyle(
                fontSize: myFontSize,
                color: Colors.black,
              )),
        ),
        SizedBox(width: _iconWidgetSize, child: firstMonthAfterIcon),
        SizedBox(width: _iconWidgetSize, child: majorBeforeIcon),
        SizedBox(
          width: 6,
          child: Text(mySpace),
        ),
        SizedBox(
          width: _textWidgetSize,
          child: Text(MandaEqu.mandaHeavyMbattal()[0][_localLang],
              textAlign: myTextAlignment,
              style: TextStyle(
                fontSize: myFontSize,
                color: Colors.black,
              )),
        ),
        SizedBox(width: _iconWidgetSize, child: majorAfterIcon),
      ],
    ),
  );
}
