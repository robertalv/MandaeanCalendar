import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'calendar_month_date.dart';
import 'local_number.dart';
import 'main.dart';
import 'manda_date.dart';
import 'manda_equivalent.dart';
import 'manda_events.dart';
import 'manda_holidays.dart';
import 'manda_month_events.dart';
import 'my_alignment.dart';
import 'my_color.dart';
import 'my_font_size.dart';
import 'my_icon_events.dart';

class CalendarBuilder extends MyHomePage {
  double _cellWidth;
  double _divecWidth;
  DateTime _selectedDay;
  double _displayWidth;
  var _data;
  var data;
  static TableSize _tableSize;
  static Map<DateTime, List> _events;
  static Map<DateTime, List> _holidays;
  static Map _mandaMonthDate;
  static Map _gregMonthDate;
  static Map _shamsiMonthDate;
  // static List _mandaMonthDate;
  // static List _gregMonthDate;
  // static List _shamsiMonthDate;
  static List _firstLast = [];
  var myTextAlignment;
  var myAlignment;
  var _sizeRate;
  String _local;
  var _setState;

  CalendarBuilder(holidays, events, data) {
    this.data = data;
    _data = this.data;
    _events = events;
    _holidays = holidays;
    _tableSize = new TableSize(_data);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
  }

  static getMonthDate(data) {
    List monthDate = MandaGregShamsiInfo.dateBuilder(data);
    _mandaMonthDate = monthDate[0];
    _gregMonthDate = monthDate[1];
    _shamsiMonthDate = monthDate[2];

    _firstLast = monthDate[3];
  }

  getCorrentMonthDate(data) {
    DateTime selectedDay = data.selected.date;
    var gregInfo = data.gregMonth.info;
    var mandaInfo = data.mandaMonth.info;
    var shamsiIno = data.shamsiMonth.info;

    if (_firstLast.isEmpty ||
        notInRange(selectedDay, gregInfo) ||
        notInRange(selectedDay, mandaInfo) ||
        notInRange(selectedDay, shamsiIno)) {
      getMonthDate(data);
    }
  }

  notInRange(selectedDay, monthInfo) {
    var notRange = false;
    // print(monthInfo['first']);

    if (selectedDay.isBefore(monthInfo['first']) ||
        selectedDay.isAfter(monthInfo['last'])) {
      notRange = true;
    }
    // print("range $notRange");
    return notRange;
  }

  buildCalendarTable(setState, kind) {
    getCorrentMonthDate(data);

    if (kind == 'manda') {
      return buildTableCalendar('manda', _mandaMonthDate, data, setState);
    } else if (kind == 'shamsi') {
      return buildTableCalendar('shamsi', _shamsiMonthDate, data, setState);
    } else {
      return buildTableCalendar('greg', _gregMonthDate, data, setState);
    }
  }

  gregCalendarTable(setState) {
    print('CALLBACK: _gregCalendarTable');

    getCorrentMonthDate(data);
    return buildTableCalendar('greg', _gregMonthDate, data, setState);
  }

  mandaCalendarTable(setState) {
    print('CALLBACK: _mandaCalendarTable');

    getCorrentMonthDate(data);
    return buildTableCalendar('manda', _mandaMonthDate, data, setState);
  }

  shamsiCalendarTable(setState) {
    print('CALLBACK: _shamsiCalendarTable');

    getCorrentMonthDate(data);
    return buildTableCalendar('shamsi', _shamsiMonthDate, data, setState);
  }

  @override
  Widget buildTableCalendar(kind, monthMap, data, setState) {
    print('CALLBACK: _onCalendarCreated');
    List monthList = monthMap.values.toList();

    myTextAlignment = MyAlignment.textAlig(_data.lang.name);
    myAlignment = MyAlignment.countryLanguage(_data.lang.name);

    _setState = setState;
    _cellWidth = _tableSize.cellWidth;
    _sizeRate = _tableSize.sizeRate;
    _divecWidth = _tableSize.divecWidth;
    _displayWidth = _tableSize.displayWidth;
    _selectedDay = data.selected.date;
    _local = data.lang.name;
    _data = data;

    return Column(children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 4)),
      if (monthList.length > 6) _buildYearMonthHeader(kind),
      Padding(padding: EdgeInsets.only(top: 4)),
      if (monthList.length > 6)
        _buildDayNameHeader(monthList.getRange(0, 7).toList()),
      if (monthList.length > 6)
        _buildDateRow(monthList.getRange(0, 7).toList()),
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
    } else if (kind == 'shamsi') {
      return _buildYearMonthHeaderShamsi(kind);
    } else {
      return _buildYearMonthHeaderGreg(kind);
    }
  }

  Widget _buildYearMonthHeaderGreg(kind) {
    return GestureDetector(
        child: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left, size: (_tableSize.f5025)),
          onPressed: () {
            _setState(() {
              MyHomePage.onVisibleGregLeft(_data);
            });
          },
        ),
        Container(
          width: _tableSize.headerMonthYearWidth,
          child: Text(
            _getYearMonthHeader(kind, _data),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: _tableSize.headerMonthYear),
          ),
        ),
        IconButton(
          icon: Icon(Icons.chevron_right, size: (_tableSize.f5025)),
          onPressed: () {
            _setState(() {
              // onVisibleMonthRight(_data);
              MyHomePage.onVisibleGregRight(_data);
            });
          },
        ),
      ],
    )));
  }

  Widget _buildYearMonthHeaderManda(kind) {
    return GestureDetector(
        child: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: (_tableSize.f5025),
            color: Colors.black,
          ),
          onPressed: () {
            _setState(() {
              MyHomePage.onVisibleMandaLeft(_data);
            });
          },
        ),
        Container(
          width: MyFontSize.headerMonthYearWidth(_data),
          child: Text(
            _getYearMonthHeader(kind, _data),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: _tableSize.headerMonthYear),
          ),
        ),
        IconButton(
          icon: Icon(Icons.chevron_right, size: (_tableSize.f5025)),
          onPressed: () {
            _setState(() {
              MyHomePage.onVisibleMandaRight(_data);
            });
          },
        ),
      ],
    )));
  }

  Widget _buildYearMonthHeaderShamsi(kind) {
    // var _sizeRate = MyFontSize.s21(data);
    return GestureDetector(
        child: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: (_tableSize.f5025),
            color: Colors.black,
          ),
          onPressed: () {
            _setState(() {
              MyHomePage.onVisibleShamsiLeft(_data);
            });
          },
        ),
        Container(
          width: MyFontSize.headerMonthYearWidth(_data),
          child: Text(
            _getYearMonthHeader(kind, _data),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: _tableSize.headerMonthYear),
          ),
        ),
        IconButton(
          icon: Icon(Icons.chevron_right, size: (_tableSize.f5025)),
          onPressed: () {
            _setState(() {
              MyHomePage.onVisibleShamsiRight(_data);
            });
          },
        ),
      ],
    )));
  }

  Widget _buildDayNameHeader(List rowText) {
    List rowTextSort = rowText;

    if (_local != "en_US") {
      rowTextSort = rowText.reversed.toList();
    }

    return Row(
        children: rowTextSort
            .map((cellText) => _buildDayNameCell(cellText, _data))
            .toList());
  }

  Widget _buildDateRow(List rowText) {
    List rowTextSort = rowText;
    if (_local != "en_US") {
      rowTextSort = rowText.reversed.toList();
    }

    return Row(
        children:
            rowTextSort.map((cellText) => _buildDateCell(cellText)).toList());
  }

  _getYearMonthHeader(kind, data) {
    var day;

    if (kind == 'greg') {
      day = gregYMHeader(data);
    } else if (kind == 'manda') {
      day = mandaYMHeader(data);
    } else if (kind == 'shamsi') {
      day = shamsiYMHeader(data);
    } else {
      day = DateFormat.yMMMM(data.lang.name).format(data.selected.date);
    }

    return day;
  }

  _getYearEqu(kind, data) {
    var day;

    if (kind == 'greg') {
      day = gregYearHeader(data);
    } else if (kind == 'manda') {
      day = mandaYearHeader(data);
    } else if (kind == 'shamsi') {
      day = shamsiYearHeader(data);
    } else {
      day = DateFormat.yMMMM(data.lang.name).format(data.selected.date);
    }

    return day;
  }

  static findMyIcon(myEvent) {
    MyIcon myIcon = MyIcon(_tableSize.iconRate);

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

    List myEvents = [];

    if (_holidays[cellText[0]] != null && cellText[1] != "") {
      myEvents.addAll(_holidays[cellText[0]]);
    }
    if (_events[cellText[0]] != null && cellText[1] != "") {
      myEvents.addAll(_events[cellText[0]]);
    }

    if (myEvents.length == 1) {
      child1 = findMyIcon(myEvents[0]);
    } else if (myEvents.length == 2) {
      child1 = findMyIcon(myEvents[1]);
      child2 = findMyIcon(myEvents[0]);
    } else if (myEvents.length == 3) {
      child1 = findMyIcon(myEvents[0]);
      child2 = findMyIcon(myEvents[2]);
      child3 = findMyIcon(myEvents[1]);
    }

    return Container(
      width: _cellWidth,
      // constraints: BoxConstraints(
      //   // minHeight: 35.0 * _sizeRate,
      //   minHeight: 10.0,
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

  static gregYMHeader(var data) {
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

  static mandaYMHeader(var data) {
    var day;
    String local = data.lang.name;
    if (local == 'en_US') {
      day =
          "${data.mandaMonth.info['monthEn']}  ${data.mandaMonth.info['yahya']} / ${data.mandaMonth.info['adam']}";
    } else if (local == 'ar') {
      day =
          "${data.mandaMonth.info['monthFaAr']}  ${data.mandaMonth.info['yahya']} / ${data.mandaMonth.info['adam']}";
      day = LocalNum.convertEntoFaAr(day, local);
    } else if (local == 'fa_IR') {
      day =
          "${data.mandaMonth.info['monthFaAr']}  ${data.mandaMonth.info['yahya']} / ${data.mandaMonth.info['adam']}";
      day = LocalNum.convertEntoFaAr(day, local);
    } else {
      day = DateFormat.yMMMM(data.lang.name).format(data.selected.date);
    }
    return day;
  }

  static shamsiYMHeader(var data) {
    var day;
    String local = data.lang.name;
    if (local == 'en_US') {
      day =
          "${data.shamsiMonth.info['monthEn']}  ${data.shamsiMonth.info['year']}";
    } else if (local == 'ar' || local == 'fa_IR') {
      day =
          "${data.shamsiMonth.info['monthFaAr']}  ${data.shamsiMonth.info['year']}";
      day = LocalNum.convertEntoFaAr(day, local);
    } else {
      day = DateFormat.yMMMM(data.lang.name).format(data.selected.date);
    }
    return day;
  }

  static gregYearHeader(var data) {
    var day;
    String local = data.lang.name;
    DateTime date = data.gregMonth.info['first'];
    var yearLabel = MandaEqu.yearLabel(local)[2];
    day = DateFormat.y(local).format(date);
    if (local == 'ar') {
      day = '($yearLabel $day)';
    } else {
      day = '($day $yearLabel)';
    }
    return day;
  }

  static mandaYearHeader(var data) {
    var day;
    String local = data.lang.name;
    var yearLabel = MandaEqu.yearLabel(local);
    if (local == 'en_US') {
      day =
          "(${data.mandaMonth.info['yahya']} ${yearLabel[1]})(${data.mandaMonth.info['adam']} ${yearLabel[0]})";
    } else if (local == 'ar') {
      day =
          "(${yearLabel[1]} ${data.mandaMonth.info['adam']})(${yearLabel[0]} ${data.mandaMonth.info['yahya']})";
      day = LocalNum.convertEntoFaAr(day, local);
    } else if (local == 'fa_IR') {
      day =
          "(${yearLabel[1]} ${data.mandaMonth.info['adam']})(${yearLabel[0]} ${data.mandaMonth.info['yahya']})";
      day = LocalNum.convertEntoFaAr(day, local);
    } else {
      day = DateFormat.y(data.lang.name).format(data.selected.date);
    }
    return day;
  }

  static shamsiYearHeader(var data) {
    var day;
    String local = data.lang.name;
    var yearLabel = MandaEqu.yearLabel(local);

    if (local == 'en_US') {
      day = "(${data.shamsiMonth.info['year']} ${yearLabel[3]})";
    } else if (local == 'ar') {
      day = "(${yearLabel[3]} ${data.shamsiMonth.info['year']})";
      day = LocalNum.convertEntoFaAr(day, local);
    } else if (local == 'fa_IR') {
      day = "(${yearLabel[3]} ${data.shamsiMonth.info['year']})";
      day = LocalNum.convertEntoFaAr(day, local);
    } else {
      day = DateFormat.y(data.lang.name).format(data.selected.date);
    }
    return day;
  }

  Widget _buildDayNameCell(var cellText, var data) {
    // print(cellText);
    // String local = _local;
    DateTime dateCellText = cellText[0];
    return Container(
      width: _cellWidth,
      constraints: BoxConstraints(
        minHeight: _tableSize.minHeightCell,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: GestureDetector(
            child: Text(
              _getDayHeader(dateCellText),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: _tableSize.headerDayWeek,
                  fontWeight: FontWeight.bold),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildDateCell(var cellText) {
    return Container(
      // margin: const EdgeInsets.all(daysMargin),
      // alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: 0, vertical: _tableSize.marginDayRow),
      decoration: _dayDecorationBuilder(cellText),
      width: _tableSize.cellWidth,
      constraints: BoxConstraints(
        minHeight: _tableSize.minHeightCell,
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
                  onDayLogPressed(cellText[0]);
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
                style: _builderTextStyle(cellText[0]),
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

    if (_local == 'fa_IR') {
      day = DateFormat.EEEE(_local).format(date);
      // day = MandaEqu.daysWeekFa(day);
    } else if (_local == 'ar') {
      day = DateFormat.E(_local).format(date);
      // print("day $day");
      // day = MandaEqu.daysWeekAr(day);
    } else {
      day = DateFormat.E(_local).format(date);
    }
    return day;
  }

  _dayDecorationBuilder(cellText) {
    var dayColor;
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
    return TextStyle(color: dayColor, fontSize: _tableSize.dayNum);
  }

  static onDayTap(cellText, data) async {
    print('CALLBACK: _onDayTap');
    // print('cellText[0].year: ${cellText[0].year}');
    // print('cellText[0].year: ${data.selected.date.year}');

    if (cellText[1] != "" && cellText[0].year != data.selected.date.year) {
      MyHomePage.runHolidaysEvents(cellText[0].year, data);
    }

    if (cellText[1] != "") {
      data.selected.date = cellText[0];
    }
    print('_onDayTap cellText ------------------------------>> $cellText');
    // await Future.delayed(Duration(seconds: 1));
    MyHomePage.onDaySelected(cellText);
  }

  static onDayLogPressed(cellText) {
    print('CALLBACK: _onDayLogPressed');
    // print('_onDayLogPressed $cellText');
  }

  static getDateEqu(var selectedDay, var data) {
    var dayEgu1;
    var dayEgu2;
    var monthEgu1;
    var monthEgu2;
    String day;

    // print('selectedDay $selectedDay');
    // print('selectedDay ${selectedDay[0]}');

    if (selectedDay[2] == 'm') {
      dayEgu1 = _gregMonthDate[selectedDay[0]];
      monthEgu1 = [
        DateFormat.MMM('en_US').format(selectedDay[0]),
        DateFormat.MMM('fa_IR').format(selectedDay[0]),
        MandaEqu.changeMonthFormate(
            DateFormat.MMMM('en_US').format(selectedDay[0]))
      ];

      dayEgu2 = _shamsiMonthDate[selectedDay[0]];
      monthEgu2 = [
        data.shamsiMonth.info['monthEn'],
        data.shamsiMonth.info['monthFaAr'],
        data.shamsiMonth.info['monthFaAr']
      ];
    } else if (selectedDay[2] == 's') {
      dayEgu2 = _gregMonthDate[selectedDay[0]];
      monthEgu2 = [
        DateFormat.MMM('en_US').format(selectedDay[0]),
        DateFormat.MMM('fa_IR').format(selectedDay[0]),
        MandaEqu.changeMonthFormate(
            DateFormat.MMMM('en_US').format(selectedDay[0]))
      ];

      dayEgu1 = _mandaMonthDate[selectedDay[0]];
      monthEgu1 = [
        data.mandaMonth.info['monthEn'],
        data.mandaMonth.info['monthFaAr'],
        data.mandaMonth.info['monthFaAr']
      ];
    } else {
      dayEgu1 = _mandaMonthDate[selectedDay[0]];
      monthEgu1 = [
        data.mandaMonth.info['monthEn'],
        data.mandaMonth.info['monthFaAr'],
        data.mandaMonth.info['monthFaAr']
      ];

      dayEgu2 = _shamsiMonthDate[selectedDay[0]];
      monthEgu2 = [
        data.shamsiMonth.info['monthEn'],
        data.shamsiMonth.info['monthFaAr'],
        data.shamsiMonth.info['monthFaAr']
      ];
    }

    if (data.lang.name == 'fa_IR') {
      day = '  ' +
          monthEgu1[1] +
          '  ' +
          dayEgu1[1].toString() +
          '  =  ' +
          monthEgu2[1] +
          '  ' +
          dayEgu2[1].toString() +
          '  ';

      day = LocalNum.convertEntoFaAr(day, data.lang.name);
    } else if (data.lang.name == 'ar') {
      day = '  ' +
          monthEgu1[2] +
          ' ' +
          dayEgu1[1].toString() +
          '  =  ' +
          monthEgu2[2] +
          ' ' +
          dayEgu2[1].toString() +
          '  ';

      day = LocalNum.convertEntoFaAr(day, data.lang.name);
    } else {
      day = "${monthEgu1[0]} ${dayEgu1[1]} = ${monthEgu2[0]} ${dayEgu2[1]}";
    }

    return day;
  }

  Widget dateEquivalent(selectedDay) {
    myTextAlignment = MyAlignment.textAlig(_data.lang.name);
    myAlignment = MyAlignment.countryLanguage(_data.lang.name);

    // print(_mandaMonthDate);

    var dayEqu = getDateEqu(selectedDay, _data);
    var beforeDateIcon;
    var afterDateIcon;
    var myDateIcon = Icon(
      Icons.date_range,
      size: 24.0 * _tableSize.iconRate,
    );

    if (_data.lang.name != "en_US") {
      beforeDateIcon = Text("");
      afterDateIcon = myDateIcon;
    } else {
      beforeDateIcon = myDateIcon;
      afterDateIcon = Text("");
    }
    return Container(
      // height: 30.0 * _sizeRate,
      constraints: BoxConstraints(
        minHeight: 0,
      ),
      alignment: myAlignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(width: 0),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: _tableSize.marginH, vertical: 4),
      child: SizedBox(
          // fit: BoxFit.scaleDown,
          child: Row(
        children: [
          beforeDateIcon,
          Flexible(
            child: Container(
              alignment: myAlignment,
              child: Text(
                dayEqu.toString(),
                textAlign: myTextAlignment,
                style:
                    TextStyle(fontSize: _tableSize.f4020, color: Colors.black),
              ),
            ),
          ),
          Text("   "),
          afterDateIcon
        ],
      )),
    );
  }

  Widget yearEquivalent(_yearEquivalent) {
    var _mandaAndJalaiYear;
    if (_yearEquivalent[2] == 'm') {
      _mandaAndJalaiYear = _getYearEqu('greg', data);
      _mandaAndJalaiYear = _mandaAndJalaiYear + _getYearEqu('shamsi', data);
    } else if (_yearEquivalent[2] == 'g') {
      _mandaAndJalaiYear = _getYearEqu('manda', data);
      _mandaAndJalaiYear = _getYearEqu('shamsi', data) + _mandaAndJalaiYear;
    } else {
      _mandaAndJalaiYear = _getYearEqu('greg', data);
      _mandaAndJalaiYear = _mandaAndJalaiYear + _getYearEqu('manda', data);
    }

    // _mandaAndJalaiYear = _getYearHeader(kind, data);
    // print(_yearEquivalent[2]);
    // print(kind);
    // print(_mandaAndJalaiYear);
    Map _myColorSelection = MyColor.selection();
    return Container(
      constraints: BoxConstraints(
        minHeight: _tableSize.f5025,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: _myColorSelection['header2'],
      ),
      // margin: EdgeInsets.only(left: _marginHor, right: _marginHor, bottom: 8),
      margin: EdgeInsets.symmetric(horizontal: _tableSize.marginH, vertical: 8),
      child: FittedBox(
        // fit: BoxFit.scaleDown,
        child: Text(
          _mandaAndJalaiYear.toString(),
          style: TextStyle(
            fontSize: _tableSize.f4020,
            color: Colors.black,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
