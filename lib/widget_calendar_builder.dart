import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'calendar_month_date.dart';
import 'main.dart';
import 'my_font_size.dart';

class CalendarBuilder extends State<MyHomePage> {
  double _cellWidth;
  double _divecWidth;
  DateTime _selectedDay;
  var _sizeRate;
  DateTime _today;
  String _local;
  var _data;
  var _setState;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  Widget buildTableCalendar(data, setState) {
    print('CALLBACK: _onCalendarCreated');
    _setState = setState;
    _cellWidth = MyFontSize.cellWidth(data);
    _sizeRate = MyFontSize.s21(data);
    _divecWidth = data.divecSize.width;
    _selectedDay = data.selected.date;
    _today = _selectedDay;
    _local = data.lang.name;
    _data = data;
    List monthList;
    print('_selectedDay: $_selectedDay');

    // String kind = data.manda.name;

    if (data.greg.active == true) {
      monthList = CalendarDateBuilder.greg(_selectedDay);
    } else if (data.manda.active == true) {
      monthList = CalendarDateBuilder.manda(_selectedDay);
    }

    // print(monthList);
    // print("monthList #############");
    // today = DateTime.now();
    // DateTime selectedDay = DateTime(today.year, today.month, today.day, 0, 0);

    return Column(children: <Widget>[
      if (monthList.length > 6) _buildYearMonthHeader(monthList[20][0]),
      if (monthList.length > 6)
        _buildDayNameHeader(monthList.getRange(7, 14).toList()),
      if (monthList.length > 6)
        _buildDateRow(monthList.getRange(0, 7).toList()),
      if (monthList.length > 6)
        // _buildEventsRow(monthList.getRange(0, 7).toList(), local),
        if (monthList.length > 13)
          _buildDateRow(monthList.getRange(7, 14).toList()),
      if (monthList.length > 20)
        _buildDateRow(monthList.getRange(14, 21).toList()),
      if (monthList.length > 27)
        _buildDateRow(monthList.getRange(21, 28).toList()),
      if (monthList.length > 34)
        _buildDateRow(monthList.getRange(28, 35).toList()),
      if (monthList.length > 41)
        _buildDateRow(monthList.getRange(35, 42).toList()),
    ]);
  }

  Widget _buildYearMonthHeader(DateTime first) {
    // var _sizeRate = MyFontSize.s21(data);
    return GestureDetector(
        child: Row(
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left, size: (25.0 * _sizeRate)),
          onPressed: () {
            _setState(() {
              onVisibleMonthLeft(first, _data);
            });
          },
        ),
        Container(
          width: _divecWidth - 100,
          child: Text(
            _getYearMonthHeader(first, _local),
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: Icon(Icons.chevron_right, size: (25.0 * _sizeRate)),
          onPressed: () {
            _setState(() {
              onVisibleMonthRight(first, _data);
            });
          },
        ),
      ],
    ));
  }

  Widget _buildDayNameHeader(List rowText) {
    [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
    ];
    [
      'شنبه',
      'جمعه',
      'پنج شنبه',
      'چهار شنبه',
      'سه ‌شنبه',
      'دو شنبه',
      'یک شنبه',
    ];

    [
      'الأحد',
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
    ];
    // rowText.sort();
    // print(rowText);
    List rowTextSort = rowText;

    if (_local != "en_US") {
      rowTextSort = rowText.reversed.toList();
    }

    // print(rowTextSort);

    return Row(
        children:
            // rowText.map((cellText) => Text(cellText.toString())).toList());
            rowTextSort
                .map((cellText) => _buildDayNameCell(cellText, _data))
                .toList());
    // .toList());
  }

  Widget _buildDateRow(List rowText) {
    // print(rowText);
    // rowText.sort();
    List rowTextSort = rowText;
    if (_local != "en_US") {
      rowTextSort = rowText.reversed.toList();
    }

    // print(rowTextSort);

    return Row(
        children:
            // rowText.map((cellText) => Text(cellText.toString())).toList());
            rowTextSort.map((cellText) => _buildDateCell(cellText)).toList());
    // .toList());
  }

  _getYearMonthHeader(date, locale) {
    var day;
    // print(date);
    // if (locale == 'ar') {
    //   var monthEn = DateFormat.MMMM('en_US').format(date);
    //   var yearAr = DateFormat.y(locale).format(date);
    //   var monthAr = MandaEqu.changeMonthFormate(monthEn);
    //   day = '$monthAr $yearAr';
    // } else {
    //   day = DateFormat.yMMMM(locale).format(date);
    // }
    // // var day = DateFormat.EEEE(locale).format(date).substring(0, 4);
    day = DateFormat.yMMMM(locale).format(date);
    return day;
  }

  Widget _buildDayNameCell(var cellText, var data) {
    // print(cellText);
    String local = _local;
    DateTime dateCellText = cellText[0];
    return Container(
      width: _cellWidth,
      constraints: BoxConstraints(
        // minHeight: 35.0 * _sizeRate,
        minHeight: 35.0,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: GestureDetector(
            // onLongPress: () {
            //   setState(() {
            //     _onDayLogPressed(cellText);
            //   });
            // },
            // onTap: () {
            //   setState(() {
            //     _onDayTap(cellText);
            //   });
            // },
            child: Text(
              _getDayHeader(dateCellText),
              textAlign: TextAlign.center,
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildDateCell(var cellText) {
    // double _divecWidth = MediaQuery.of(context).size.width;
    // double _cellWidth = _divecWidth / 7;
    // _selectedDay
    // print(cellText);
    DateTime dateCellText = cellText[0];
    String labelCellText = cellText[1];
    return Container(
      // margin: const EdgeInsets.all(daysMargin),
      // alignment: Alignment.center,
      decoration: _dayDecorationBuilder(dateCellText),
      width: _cellWidth,
      constraints: BoxConstraints(
        // minHeight: 35.0 * _sizeRate,
        minHeight: 35.0,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: GestureDetector(
            onLongPress: () {
              _setState(() {
                onDayLogPressed(dateCellText);
              });
            },
            onTap: () {
              _setState(() {
                onDayTap(dateCellText, _data);
              });
            },
            child: Text(
              // "t",
              // DateFormat.d(local).format(dateCellText).toString(),
              labelCellText,
              textAlign: TextAlign.center,
              style: _builderTextStyle(dateCellText),
            ),
          )),
          // Expanded(
          //   child: firstMonthEvent(1),
          // ),
        ],
      ),
    );
  }

  _getDayHeader(DateTime date) {
    var day;

    // if (local == 'fa_IR') {
    //   var dayFa = DateFormat.EEEE(local).format(date);

    //   day = MandaEqu.changeDayFormate(dayFa);
    // } else {
    //   day = DateFormat.E(local).format(date);
    // }
    // // var day = DateFormat.EEEE(locale).format(date).substring(0, 4);
    day = DateFormat.E(_local).format(date);

    return day;
  }

  _dayDecorationBuilder(cellText) {
    var dayColor;
    // print("_today $_today");
    if (_selectedDay == cellText) {
      dayColor = Colors.black54;
    } else if (_today == cellText) {
      dayColor = Colors.brown[100];
    } else {
      dayColor = Colors.white12;
    }

    return BoxDecoration(
      shape: BoxShape.circle,
      color: dayColor,
    );
  }

  _builderTextStyle(cellText) {
    var dayColor;
    if ((_selectedDay == cellText)) {
      dayColor = Colors.white;
    } else {
      dayColor = Colors.black;
    }
    // return TextStyle(color: dayColor, fontSize: _daysFontSize);
    return TextStyle(color: dayColor);
  }

  static onDayTap(cellText, data) {
    print('CALLBACK: _onDayTap');
    // _selectedDay = cellText;
    data.selected.date = cellText;
    // print('_onDayTap $cellText');
  }

  static onDayLogPressed(cellText) {
    print('_onDayLogPressed $cellText');
  }

  static onVisibleMonthLeft(selectedDay, data) {
    print('CALLBACK: _onVisibleDaysChanged');
    // print('_onVisibleMonthLeft $selectedDay');
    // _selectedDay = DateTime(selectedDay.year, selectedDay.month - 1, 1, 0, 0);
    data.selected.date =
        DateTime(selectedDay.year, selectedDay.month - 1, 1, 0, 0);
  }

  static onVisibleMonthRight(selectedDay, data) {
    print('CALLBACK: _onVisibleDaysChanged');
    // print('_onVisibleMonthRight $selectedDay');
    // _selectedDay = DateTime(selectedDay.year, selectedDay.month + 1, 1, 0, 0);
    data.selected.date =
        DateTime(selectedDay.year, selectedDay.month + 1, 1, 0, 0);
  }
}

////// ###################################
// class SelectedCell {
//   static onDayTap(cellText) {
//     print('CALLBACK: _onDayTap');
//     _selectedDay = cellText;
//     // print('_onDayTap $cellText');
//   }

//   static onDayLogPressed(cellText) {
//     print('_onDayLogPressed $cellText');
//   }

//   static onVisibleMonthLeft(selectedDay) {
//     print('CALLBACK: _onVisibleDaysChanged');
//     // print('_onVisibleMonthLeft $selectedDay');
//     _selectedDay = DateTime(selectedDay.year, selectedDay.month - 1, 1, 0, 0);
//   }

//   static onVisibleMonthRight(selectedDay) {
//     print('CALLBACK: _onVisibleDaysChanged');
//     // print('_onVisibleMonthRight $selectedDay');
//     _selectedDay = DateTime(selectedDay.year, selectedDay.month + 1, 1, 0, 0);
//   }
// }
