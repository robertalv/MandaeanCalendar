import 'dart:developer';

import 'package:flutter/material.dart';

import 'manda_equivalent.dart';
import 'my_alignment.dart';
import 'my_color.dart';
import 'my_icon_events.dart';

double _divecWidth;
var _religBeforeIcon;
var _minorBeforeIcon;
var _religAfterIcon;
var _minorAfterIcon;
var _firstMonthAfterIcon;
var _firstMonthBeforeIcon;
var _majorBeforeIcon;
var _majorAfterIcon;
var _myFontSize;
double _textBoxSize = 50;
double _iconWidgetSize;
double _textWidgetSize;
String _mySpace = " ";
String _spaceNotEn = '';
var _myTextAlignment;
double _emptyBox;

Widget footerLine(
    BuildContext context, String _localLang, sizeRate, marginHor) {
  Map _myColorSelection = MyColor.selection();

  setPrometer(context, _localLang, sizeRate);
  return Container(
    // height: helpHight * sizeRate,
    constraints: BoxConstraints(
      minHeight: 37,
    ),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
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

setPrometer(BuildContext context, String _localLang, sizeRate) {
  _divecWidth = MediaQuery.of(context).size.width;
  MyIcon myIcon = MyIcon(sizeRate);
  _myTextAlignment = MyAlignment.textAlig(_localLang);
  if (_localLang == "en_US") {
    _religBeforeIcon = myIcon.relig;
    _religAfterIcon = myIcon.noon;
    _minorBeforeIcon = myIcon.minor;
    _minorAfterIcon = myIcon.noon;
    _myFontSize = 16.0 * sizeRate;
    _mySpace = " ";
    _textBoxSize = 50;

    _firstMonthBeforeIcon = myIcon.firstMonth;
    _firstMonthAfterIcon = myIcon.noon;
    _majorBeforeIcon = myIcon.major;
    _majorAfterIcon = myIcon.noon;
    _emptyBox = 6.0;
  } else {
    _spaceNotEn = ' ';
    _religAfterIcon = myIcon.relig;
    _religBeforeIcon = myIcon.noon;
    _minorAfterIcon = myIcon.minor;
    _minorBeforeIcon = myIcon.noon;
    _myFontSize = 17.0 * sizeRate;
    _textBoxSize = -10;

    _firstMonthAfterIcon = myIcon.firstMonth;
    _firstMonthBeforeIcon = myIcon.noon;
    _majorAfterIcon = myIcon.major;
    _majorBeforeIcon = myIcon.noon;
    _emptyBox = 2.0;
  }
  if (_divecWidth < 321) {
    _myFontSize = _myFontSize * .80;
  }
  if (_divecWidth > 700) {
    _iconWidgetSize = 8.0 * sizeRate;
    _textWidgetSize = 288.0;
    _myFontSize = _myFontSize * .70;
    _emptyBox = _emptyBox * sizeRate;
  } else {
    _iconWidgetSize = 8;
    _textWidgetSize = _divecWidth / 2 - 32;
  }
}

Widget footerFirstLine(BuildContext context, String _localLang, sizeRate) {
  return FittedBox(
    child: Row(
      children: [
        SizedBox(width: _iconWidgetSize, child: _religBeforeIcon),
        SizedBox(width: _emptyBox),
        SizedBox(
          width: _textWidgetSize + _textBoxSize,
          child: Text(MandaEqu.mandaFeastName()[0][_localLang] + _spaceNotEn,
              textAlign: _myTextAlignment,
              style: TextStyle(
                fontSize: _myFontSize,
                color: Colors.black,
              )),
        ),
        SizedBox(width: _emptyBox),
        SizedBox(width: _iconWidgetSize, child: _religAfterIcon),
        SizedBox(width: _iconWidgetSize, child: _minorBeforeIcon),
        SizedBox(width: _emptyBox),
        SizedBox(
          width: _textWidgetSize,
          child: Text(MandaEqu.mandaLightMbattal()[0][_localLang],
              textAlign: _myTextAlignment,
              style: TextStyle(
                fontSize: _myFontSize,
                color: Colors.black,
              )),
        ),
        SizedBox(width: _emptyBox),
        SizedBox(width: _iconWidgetSize, child: _minorAfterIcon),
      ],
    ),
  );
}

Widget footerSecondLine(BuildContext context, String _localLang, sizeRate) {
  return FittedBox(
    fit: BoxFit.scaleDown,
    child: Row(
      children: [
        SizedBox(width: _iconWidgetSize, child: _firstMonthBeforeIcon),
        SizedBox(width: _emptyBox),
        SizedBox(
          width: _textWidgetSize + _textBoxSize,
          child: Text(MandaEqu.mandaFirstMonth()[0][_localLang] + _spaceNotEn,
              textAlign: _myTextAlignment,
              style: TextStyle(
                fontSize: _myFontSize,
                color: Colors.black,
              )),
        ),
        SizedBox(width: _emptyBox),
        SizedBox(width: _iconWidgetSize, child: _firstMonthAfterIcon),
        SizedBox(width: _iconWidgetSize, child: _majorBeforeIcon),
        SizedBox(width: _emptyBox),
        SizedBox(
          width: _textWidgetSize,
          child: Text(MandaEqu.mandaHeavyMbattal()[0][_localLang],
              textAlign: _myTextAlignment,
              style: TextStyle(
                fontSize: _myFontSize,
                color: Colors.black,
              )),
        ),
        SizedBox(width: _emptyBox),
        SizedBox(width: _iconWidgetSize, child: _majorAfterIcon),
      ],
    ),
  );
}
