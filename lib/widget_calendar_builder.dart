import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'calendar_month_date.dart';
import 'local_number.dart';
import 'main.dart';
import 'manda_equivalent.dart';
import 'manda_events.dart';
import 'manda_holidays.dart';
import 'my_font_size.dart';
import 'my_icon_events.dart';

class CalendarBuilder extends MyHomePage {
  double _cellWidth;
  double _divecWidth;
  DateTime _selectedDay;
  double _displayWidth;
  var _data;
  var data;
  Map<DateTime, List> _events;
  static Map<DateTime, List> _holidays;
  static String _farid;
  CalendarBuilder(holidays, events, data) {
    this.data = data;
    _data = this.data;
    _events = events;
    _holidays = holidays;

    // _holidays = MandaFirstDayOfMonthBuilder(_data.selected.date.year)
    //     .eventsForWholeYear;

    // _events = MandaEventssBuilder(_data.selected.date.year).wholeYear;
    // print("_holidays *********************");
  }

  // List _mandaMonthDate;
  // List _gregMonthDate = [];
  // List _shamsiMonthDate = [];
  var _sizeRate;

  String _local;
  // var _data;
  var _setState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
  }

  gregCalendarTable(setState) {
    print('CALLBACK: _gregCalendarTable');
    List monthList = CalendarDateBuilder.greg(data);
    return buildTableCalendar('greg', monthList, data, setState);
  }

  mandaCalendarTable(setState) {
    print('CALLBACK: _mandaCalendarTable');
    List monthList = CalendarDateBuilder.manda(data);
    return buildTableCalendar('manda', monthList, data, setState);
  }

  shamsiCalendarTable(setState) {
    print('CALLBACK: _shamsiCalendarTable');
    List monthList = CalendarDateBuilder.shamsi(data);
    return buildTableCalendar('shamsi', monthList, data, setState);
  }

  @override
  Widget buildTableCalendar(kind, monthList, data, setState) {
    print('CALLBACK: _onCalendarCreated');
    // print("_holidays " * 10);
    // print(_holidays);
    // print("_holidays " * 10);
    _setState = setState;
    _cellWidth = MyFontSize.cellWidth(data);
    _sizeRate = MyFontSize.s21(data);
    _divecWidth = data.divecSize.width;
    _displayWidth = MyFontSize.displayWidth(data);
    _selectedDay = data.selected.date;
    // _today = _selectedDay;
    _local = data.lang.name;
    _data = data;

    return Column(children: <Widget>[
      // if (monthList.length > 6)
      //   Center(
      //     child: _buildYearMonthHeader(kind),
      //   ),
      if (monthList.length > 6) _buildYearMonthHeader(kind),
      if (monthList.length > 6)
        _buildDayNameHeader(monthList.getRange(0, 7).toList()),
      if (monthList.length > 6)
        _buildDateRow(monthList.getRange(0, 7).toList()),
      // if (monthList.length > 6)
      // _buildEventsRow(monthList.getRange(0, 7).toList(), _local),
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

  _buildYearMonthHeader(kind) {
    if (kind == 'manda') {
      return _buildYearMonthHeaderManda(kind);
    } else {
      return _buildYearMonthHeaderGreg(kind);
    }
  }

  Widget _buildYearMonthHeaderGreg(kind) {
    // var _sizeRate = MyFontSize.s21(data);
    return GestureDetector(
        child: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left, size: (25.0 * _sizeRate)),
          onPressed: () {
            _setState(() {
              MyHomePage.onVisibleMonthLeft(_data);
            });
          },
        ),
        Container(
          width: MyFontSize.headerMonthYearWidth(_data),
          child: Text(
            _getYearMonthHeader(kind, _data),
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: Icon(Icons.chevron_right, size: (25.0 * _sizeRate)),
          onPressed: () {
            _setState(() {
              // onVisibleMonthRight(_data);
              MyHomePage.onVisibleMonthRight(_data);
            });
          },
        ),
      ],
    )));
  }

  Widget _buildYearMonthHeaderManda(kind) {
    // var _sizeRate = MyFontSize.s21(data);
    return GestureDetector(
        child: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: (25.0 * _sizeRate),
            color: Colors.green,
          ),
          onPressed: () {
            _setState(() {
              MyHomePage.onVisibleMandaMonthLeft(_data);
            });
          },
        ),
        Container(
          width: MyFontSize.headerMonthYearWidth(_data),
          child: Text(
            _getYearMonthHeader(kind, _data),
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: Icon(Icons.chevron_right, size: (25.0 * _sizeRate)),
          onPressed: () {
            _setState(() {
              MyHomePage.onVisibleMandaMonthRight(_data);
            });
          },
        ),
      ],
    )));
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
    List rowTextSort = rowText;
    if (_local != "en_US") {
      rowTextSort = rowText.reversed.toList();
    }

    // print(rowTextSort);

    return Row(
        children:
            rowTextSort.map((cellText) => _buildDateCell(cellText)).toList());
  }

  _getYearMonthHeader(kind, data) {
    var day;

    if (kind == 'greg') {
      day = gregHeaderBuilder(data);
    } else if (kind == 'manda') {
      day = mandaHeaderBuilder(data);
    } else if (kind == 'shamsi') {
      day = shamsiHeaderBuilder(data);
    } else {
      day = DateFormat.yMMMM(data.lang.name).format(data.selected.date);
    }

    return day;
  }

  // Widget _buildEventsRow(List rowText, String localLang) {
  //   // rowText.sort();
  //   List rowTextSort = rowText;
  //   if (localLang != "en_US") {
  //     rowTextSort = rowText.reversed.toList();
  //   }

  //   // print(rowTextSort);

  //   return Row(
  //       children:
  //           // rowText.map((cellText) => Text(cellText.toString())).toList());
  //           rowTextSort
  //               .map((cellText) => _buildEventsCell(cellText, localLang))
  //               .toList());
  //   // .toList());
  // }

  static findMyIcon(myEvent, _sizeRate) {
    MyIcon myIcon = MyIcon(_sizeRate);

    if ((myEvent.runtimeType.toString()).contains('List')) {
      myEvent = myEvent[0];
    }

    var myIcone;
    if (myEvent['en_US'].contains("Minor")) {
      myIcone = myIcon.minor;
    } else if (myEvent['en_US'].contains("Major")) {
      myIcone = myIcon.major;
    } else if (myEvent['en_US'].contains("Mandaic")) {
      myIcone = myIcon.firstMonth;
    } else {
      myIcone = myIcon.relig;
    }
    return myIcone;
  }

  Widget _buildEventsCell(var cellText, String local) {
    var child1;
    var child2;
    var child3;
    // MyIcon myIcon = MyIcon(_sizeRate);

    List myEvents = [];

    if (_holidays[cellText[0]] != null && cellText[1] != "") {
      myEvents.addAll(_holidays[cellText[0]]);
    }
    if (_events[cellText[0]] != null && cellText[1] != "") {
      myEvents.addAll(_events[cellText[0]]);
    }
    // print(cellText);
    // print(myEvents);
    // print(myEvents.length);

    if (myEvents.length == 1) {
      child1 = findMyIcon(myEvents[0], _sizeRate);
    } else if (myEvents.length == 2) {
      child1 = findMyIcon(myEvents[1], _sizeRate);
      child2 = findMyIcon(myEvents[0], _sizeRate);
    } else if (myEvents.length == 3) {
      child1 = findMyIcon(myEvents[0], _sizeRate);
      child2 = findMyIcon(myEvents[2], _sizeRate);
      child3 = findMyIcon(myEvents[1], _sizeRate);
    }

    return Container(
      // decoration: _dayDecorationBuilder(cellText),
      width: _cellWidth,
      // constraints: BoxConstraints(
      //   // minHeight: 35.0 * _sizeRate,
      //   minHeight: 15.0,
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (child1 != null) child1,
          if (child2 != null) child2,
          if (child3 != null) child3,
        ],
      ),
    );
  }

  static gregHeaderBuilder(var data) {
    var day;
    String local = data.lang.name;
    DateTime date = data.gregMonth.info['first'];
    if (local == 'ar') {
      var monthEn = DateFormat.MMMM('en_US').format(date);
      var yearAr = DateFormat.y(local).format(date);
      var monthAr = MandaEqu.changeMonthFormate(monthEn);
      day = '$monthAr $yearAr';
    } else {
      day = DateFormat.yMMMM(local).format(date);
    }
    return day;
  }

  static mandaHeaderBuilder(var data) {
    var day;
    String local = data.lang.name;
    if (local == 'en_US') {
      day =
          "${data.mandaMonth.info['monthEn']}\n${data.mandaMonth.info['yahya']} / ${data.mandaMonth.info['adam']}";
    } else if (local == 'ar') {
      day =
          "${data.mandaMonth.info['monthFaAr']}\n${data.mandaMonth.info['adam']} / ${data.mandaMonth.info['yahya']}";
      day = LocalNum.convertEntoFaAr(day, local);
    } else if (local == 'fa_IR') {
      day =
          "${data.mandaMonth.info['monthFaAr']}\n${data.mandaMonth.info['yahya']} / ${data.mandaMonth.info['adam']}";
      day = LocalNum.convertEntoFaAr(day, local);
    } else {
      day = DateFormat.yMMMM(data.lang.name).format(data.selected.date);
    }
    return day;
  }

  static shamsiHeaderBuilder(var data) {
    var day;
    String local = data.lang.name;
    if (local == 'en_US') {
      day =
          "${data.shamsiMonth.info['monthEn']} ${data.shamsiMonth.info['year']}";
    } else if (local == 'ar' || local == 'fa_IR') {
      day =
          "${data.shamsiMonth.info['monthFaAr']} ${data.shamsiMonth.info['year']}";
      day = LocalNum.convertEntoFaAr(day, local);
    } else {
      day = DateFormat.yMMMM(data.lang.name).format(data.selected.date);
    }
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
    // print(cellText);
    DateTime dateCellText = cellText[0];
    String labelCellText = cellText[1];

    return Container(
      // margin: const EdgeInsets.all(daysMargin),
      // alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      decoration: _dayDecorationBuilder(cellText),
      width: _cellWidth,
      constraints: BoxConstraints(
        // minHeight: 35.0 * _sizeRate,
        minHeight: 75.0,
      ),
      child: Column(children: [
        Row(
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
                  onDayTap(cellText, _data);
                });
              },
              child: Text(
                // "t",
                // DateFormat.d(local).format(dateCellText).toString(),
                LocalNum.convertEntoFaAr(cellText[1], _data.lang.name),
                textAlign: TextAlign.center,
                style: _builderTextStyle(dateCellText),
              ),
            )),
            // Expanded(
            //   child: firstMonthEvent(1),
            // ),
          ],
        ),
        _buildEventsCell(cellText, _data.lang.name)
      ]),
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
    // print("_today ${_data.today}");
    // print("cellText $cellText");
    if (_selectedDay == cellText[0]) {
      dayColor = Colors.black54;
    } else if (_data.today == cellText[0] && cellText[1] != "") {
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
    return TextStyle(color: dayColor, fontSize: 40);
  }

  static onDayTap(cellText, data) {
    print('CALLBACK: _onDayTap');

    if (cellText[1] != "") {
      data.selected.date = cellText[0];
    }
    // data.selected.date = cellText[0];
    print('_onDayTap $cellText');
  }

  static onDayLogPressed(cellText) {
    print('CALLBACK: _onDayLogPressed');
    // print('_onDayLogPressed $cellText');
  }
}
// static onVisibleMonthLeft(data) {
//   print('CALLBACK: _onVisibleDaysChanged');
//   DateTime selectedDay = data.selected.date;
//   _holidays =
//       MandaFirstDayOfMonthBuilder(selectedDay.year).eventsForWholeYear;
//   print(_holidays);

//   if (data.lang.name == "fa_IR" || data.lang.name == "fa_IR") {
//     data.selected.date =
//         DateTime(selectedDay.year, selectedDay.month + 1, 1, 0, 0);
//   } else {
//     data.selected.date =
//         DateTime(selectedDay.year, selectedDay.month - 1, 1, 0, 0);
//   }
// }

// static onVisibleMonthRight(data) {
//   print('CALLBACK: _onVisibleDaysChanged');
//   DateTime selectedDay = data.selected.date;

//   if (data.lang.name == "fa_IR" || data.lang.name == "fa_IR") {
//     data.selected.date =
//         DateTime(selectedDay.year, selectedDay.month - 1, 1, 0, 0);
//   } else {
//     data.selected.date =
//         DateTime(selectedDay.year, selectedDay.month + 1, 1, 0, 0);
//   }
// }

//   static onVisibleMandaMonthLeft(data) {
//     print('CALLBACK: _onVisibleDaysChanged');
//     // DateTime selectedDay = data.selected.date;
//     DateTime first = data.mandaMonth.info["first"];
//     DateTime last = data.mandaMonth.info["last"];
//     var month = data.mandaMonth.info["month"];
//     // print('first $first');
//     // print('last $last');
//     // print('month $month');
//     var duration = 30;
//     if (month == 1) {
//       duration = 5;
//     }
//     if (data.lang.name == "fa_IR" || data.lang.name == "fa_IR") {
//       data.selected.date = DateTime(last.year, last.month, last.day + 1, 0, 0);
//     } else {
//       data.selected.date =
//           DateTime(first.year, first.month, first.day - duration, 0, 0);
//     }
//   }

//   static onVisibleMandaMonthRight(data) {
//     print('CALLBACK: _onVisibleDaysChanged');
//     // DateTime selectedDay = data.selected.date;
//     DateTime first = data.mandaMonth.info["first"];
//     DateTime last = data.mandaMonth.info["last"];
//     var month = data.mandaMonth.info["month"];
//     // print('first $first');
//     // print('last $last');
//     // print('month $month');
//     var duration = 30;
//     if (month == 1) {
//       duration = 5;
//     }

//     if (data.lang.name == "fa_IR" || data.lang.name == "fa_IR") {
//       data.selected.date =
//           DateTime(first.year, first.month, first.day - duration, 0, 0);
//     } else {
//       data.selected.date = DateTime(last.year, last.month, last.day + 1, 0, 0);
//     }
//   }
// }

////// ###################################
// class OnVisibleMonth {
//   var data;
//   var _data;
//   OnVisibleMonth(data) {
//     this.data = data;
//     _data = data;
//   }
//   static left(data) {
//     print('CALLBACK: _onVisibleDaysChanged');
//     DateTime selectedDay = data.selected.date;

//     if (data.lang.name == "fa_IR" || data.lang.name == "fa_IR") {
//       data.selected.date =
//           DateTime(selectedDay.year, selectedDay.month + 1, 1, 0, 0);
//     } else {
//       data.selected.date =
//           DateTime(selectedDay.year, selectedDay.month - 1, 1, 0, 0);
//     }
//   }

//   static _runHolidaysEvents(selectedDay) {
//     Map<DateTime, List> _holidays;
//     Map<DateTime, List> _events;

//     if (_holidays.keys.toList()[0].year != selectedDay.year) {
//       // _runHolidaysEvents(selectedDay);
//     }
//     _holidays =
//         MandaFirstDayOfMonthBuilder(selectedDay.year).eventsForWholeYear;

//     _events = MandaEventssBuilder(selectedDay.year).wholeYear;
//     return [_holidays, _events];
//   }
// }
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
