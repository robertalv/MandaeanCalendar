// //  Copyright (c) 2020 Farid Khafaji Zadeh - Farid Yuri Mahour Asad Anjeel
//// Mandean Calender
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'manda_events.dart';
import 'manda_footer.dart';
import 'manda_holidays.dart';
import 'manda_month_events.dart';
import 'my_font_size.dart';
import 'setter_getter.dart';
import 'manda_equivalent.dart';
import 'widget_calendar_builder.dart';
import 'widget_drawer.dart';
import 'widget_events_list.dart';
import 'widget_top_icon.dart';
import 'my_color.dart';
import 'user_set.dart';
import 'manda_scrolling_text.dart';

LocalLang _lang = new LocalLang();
MandaCalendarActive _manda = new MandaCalendarActive();
GregCalendarActive _greg = new GregCalendarActive();
ShamsiCalendarActive _shamsi = new ShamsiCalendarActive();
Selected _selected = new Selected();
StartOfMonth _first = new StartOfMonth();
EndOfMonth _last = new EndOfMonth();
GregMonthInfo _gregMonth = new GregMonthInfo();
MandaMonthInfo _mandaMonth = new MandaMonthInfo();
ShamsiMonthInfo _shamsiMonth = new ShamsiMonthInfo();
// CalendarActiveKind _calendarActive = new CalendarActiveKind();
DivecSize _divec = new DivecSize();
Data _data = new Data();
Map _myColorSelection = MyColor.selection();
DateTime todayNow = DateTime.now();
DateTime _today = DateTime(todayNow.year, todayNow.month, todayNow.day, 0, 0);
DateTime selectedDay = DateTime(_today.year, _today.month, _today.day, 0, 0);
double _cellWidth;
Map<DateTime, List> _events;
Map<DateTime, List> _holidays;
var _dateEquivalent;
var _yearEquivalent;
List _selectedEvents = [];
var _listOfEventsForYear;

void main() {
  initializeDateFormatting().then((_) => runApp(MandaeanCalendar()));
}

class MandaeanCalendar extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    _data.lang = _lang;
    _data.gregKind = _greg;
    _data.mandaKind = _manda;
    _data.shamsiKind = _shamsi;
    _data.selected = _selected;
    _data.first = _first;
    _data.last = _last;
    _data.gregMonth = _gregMonth;
    _data.mandaMonth = _mandaMonth;
    _data.shamsiMonth = _shamsiMonth;
    // _data.calendarActive = _calendarActive;
    _data.gregMonth.info = {};
    _data.mandaMonth.info = {};
    _data.shamsiMonth.info = {};
    _lang.name = "en_US";
    _greg.active = true;
    _manda.active = false;
    _shamsi.active = false;
    _selected.date = selectedDay;
    _data.today = selectedDay;

    return MaterialApp(
      title: 'Mandaean Calendar',
      home: MyHomePage(title: ""),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

  static void runHolidaysEvents(int selectedYear) {
    _holidays = MandaFirstDayOfMonthBuilder(selectedYear).eventsForWholeYear;
    _events = MandaEventssBuilder(selectedYear).wholeYear;
    final List eventName = MandaEqu.mandaFirstMonth();
    var decBefor =
        MandaFirstDayOfMonthBuilder.forMonthInYear(12, selectedYear - 1);
    var janAfter =
        MandaFirstDayOfMonthBuilder.forMonthInYear(1, selectedYear + 1);
    _holidays[decBefor[0]] = eventName;
    _holidays[janAfter[0]] = eventName;
    Map<DateTime, List> decEventBefor =
        MandaEventssBuilder.forGivenMonth(12, selectedYear - 1);
    Map<DateTime, List> janEventAfter =
        MandaEventssBuilder.forGivenMonth(1, selectedYear + 1);
    _events.addAll(decEventBefor);
    _events.addAll(janEventAfter);

    MandaGregShamsiInfo.dateBuilder(_data);
    // print('selectedYear $selectedYear');
    // print('_holidays ${_holidays.length}');
    // print('_events ${_events.length}');
    // print("*" * 30 + "_holidays load" + "*" * 30);
    // print(_holidays);

    _listOfEventsForYear =
        scrollingText.generateEventsforScroll(_events, _holidays);
  }

  static void _onVisibleMonth(
      data, DateTime dateFaAr, DateTime date, String leftRight, kind) {
    print('CALLBACK: _onVisibleMonth');
    DateTime selectedDay = data.selected.date;
    int monthChangeYear;

    if (data.lang.name == "fa_IR" || data.lang.name == "ar") {
      data.selected.date = dateFaAr;
      monthChangeYear = 1;
      if (leftRight == 'right') {
        monthChangeYear = 12;
      }
    } else {
      data.selected.date = date;
      monthChangeYear = 12;
      if (leftRight == 'right') {
        monthChangeYear = 1;
      }
    }
    CalendarBuilder.getMonthDate(data);
    selectedDay = data.selected.date;
    _selectedEvents = MyHomePage.todayEven(selectedDay);
    _dateEquivalent = [selectedDay, '', kind];
    _listOfEventsForYear['en_US'] = '';
    // print(selectedDay);
    if (selectedDay.month == monthChangeYear) {
      runHolidaysEvents(selectedDay.year);
    }
  }

  static void onVisibleGregLeft(data) {
    print('CALLBACK: _onVisibleMonthLeft');
    DateTime selectedDay = data.selected.date;

    _onVisibleMonth(
        data,
        DateTime(selectedDay.year, selectedDay.month + 1, 1, 0, 0),
        DateTime(selectedDay.year, selectedDay.month - 1, 1, 0, 0),
        'left',
        'g');
  }

  static onVisibleGregRight(data) {
    print('CALLBACK: _onVisibleMonthRight');
    DateTime selectedDay = data.selected.date;

    _onVisibleMonth(
        data,
        DateTime(selectedDay.year, selectedDay.month - 1, 1, 0, 0),
        DateTime(selectedDay.year, selectedDay.month + 1, 1, 0, 0),
        'right',
        'g');
  }

  static onVisibleMandaLeft(data) {
    print('CALLBACK: _onVisibleMandaMonthLeft');

    DateTime first = data.mandaMonth.info["first"];
    DateTime last = data.mandaMonth.info["last"];
    var month = data.mandaMonth.info["month"];
    // print('first $first');
    // print('last $last');
    // print('month $month');
    var duration = 30;
    if (month == 2) {
      duration = 35;
    }

    _onVisibleMonth(
        data,
        DateTime(last.year, last.month, last.day + 1, 0, 0),
        DateTime(first.year, first.month, first.day - duration, 0, 0),
        'left',
        'm');
  }

  static onVisibleMandaRight(data) {
    print('CALLBACK: _onVisibleMandaMonthRight');
    // DateTime selectedDay = data.selected.date;
    DateTime first = data.mandaMonth.info["first"];
    DateTime last = data.mandaMonth.info["last"];
    var month = data.mandaMonth.info["month"];
    // print('first $first');
    // print('last $last');
    // print('month $month');
    var duration = 30;
    if (month == 2) {
      duration = 35;
    }

    _onVisibleMonth(
        data,
        DateTime(first.year, first.month, first.day - duration, 0, 0),
        DateTime(last.year, last.month, last.day + 1, 0, 0),
        'right',
        'm');
  }

  static onVisibleShamsiLeft(data) {
    print('CALLBACK: _onVisibleShamsiMonthLeft');

    DateTime first = data.shamsiMonth.info["first"];
    DateTime last = data.shamsiMonth.info["last"];
    var jalaliDay = data.shamsiMonth.info["jalaliDay"];
    // print('old $jalaliDay');
    jalaliDay = jalaliDay.addMonths(-1);
    var duration = jalaliDay.monthLength;
    // print('duration $duration');

    _onVisibleMonth(
        data,
        DateTime(last.year, last.month, last.day + 1, 0, 0),
        DateTime(first.year, first.month, first.day - duration, 0, 0),
        'left',
        's');
  }

  static onVisibleShamsiRight(data) {
    print('CALLBACK: _onVisibleShamsiMonthRight');

    DateTime first = data.shamsiMonth.info["first"];
    DateTime last = data.shamsiMonth.info["last"];
    var jalaliDay = data.shamsiMonth.info["jalaliDay"];
    // print('old $jalaliDay');
    jalaliDay = jalaliDay.addMonths(-1);
    var duration = jalaliDay.monthLength;

    _onVisibleMonth(
        data,
        DateTime(first.year, first.month, first.day - duration, 0, 0),
        DateTime(last.year, last.month, last.day + 1, 0, 0),
        'right',
        's');
  }

  static void onDaySelected(selectedDay) {
    // print("_onDaySelected --------------------=========>");
    _yearEquivalent = selectedDay;
    _dateEquivalent = selectedDay;
    _selectedEvents = todayEven(selectedDay[0]);
  }

  static todayEven(DateTime selectedDay) {
    List todayHolidayEvents = [];

    var todayHoliday = _holidays[selectedDay] ?? [];

    if (todayHoliday.isNotEmpty) {
      todayHolidayEvents.add(todayHoliday[0]);
    }

    var todayEvents = _events[selectedDay] ?? [];
    if (todayEvents.isNotEmpty) {
      todayEvents.forEach((event) {
        if ((event.runtimeType.toString()).contains('List')) {
          todayHolidayEvents.add(event[0]);
        } else {
          todayHolidayEvents.add(todayEvents[0]);
        }
      });
    }
    // print(todayHolidayEvents);
    return todayHolidayEvents;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  // List _selectedEvents =[];

  @override
  void initState() {
    super.initState();

    UserSetting.getLanguage(setState, _lang);
    CalendarBuilder.getMonthDate(_data);
    MyHomePage.runHolidaysEvents(_data.selected.date.year);
    _dateEquivalent = _data.gregMonth.info["selectedDay"];

    _yearEquivalent = _data.gregMonth.info["selectedDay"];
    _selectedEvents = MyHomePage.todayEven(_data.selected.date);
    // print("one time run main ################");
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double divecWidth = MediaQuery.of(context).size.width;
    _data.divecSize = _divec;
    _divec.width = divecWidth;
    _cellWidth = MyFontSize.cellWidth(_data);
    double _sizeRate = MyFontSize.s21(_data);
    String _myTitle = MandaEqu.calendarTitle()[_lang.name];
    // ###############################################################
    // ###############################################################

    _data.gregKind.active = false;
    _data.mandaKind.active = true;
    _data.shamsiKind.active = false;
    List runingWidget;

    // runingWidget = ['greg', 'manda'];
    runingWidget = ['greg'];
    // runingWidget = ['manda'];
    // runingWidget = ['shamsi'];
    // runingWidget = ['manda', 'greg', 'shamsi'];

    MainSize _mainZise = new MainSize(_data);
    // todayEven(_selectedDay);
    // _selectedEvents = _todayHolidayEvents ?? [];
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_mainZise.f8040),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu, size: (_mainZise.f5025)),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          titleSpacing: -10.0,
          backgroundColor: _myColorSelection['header'],
          actionsIconTheme:
              IconThemeData(size: 50, color: Colors.green, opacity: 10),
          title: FittedBox(
            // fit: BoxFit.scaleDown,
            child: Text(_myTitle,
                style: TextStyle(
                    color: Colors.black, fontSize: MyFontSize.s4020(_data))),
          ),
          actions: <Widget>[
            topIconInfo(context, _data, setState),
          ],
        ),
      ),
      drawer: Container(
        width: 250.0 * _sizeRate,
        color: Colors.white,
        child: topIconDrawer(context, _lang.name),
      ),
      body: GestureDetector(
          onHorizontalDragEnd: (dragEndDetails) {
            // print('Move page ');
            // print(dragEndDetails.primaryVelocity);
            if (dragEndDetails.primaryVelocity < 0) {
              // print('Move page forwards');
              setState(() {
                // CalendarBuilder.onVisibleMonthRight(_data);
                MyHomePage.onVisibleGregRight(_data);
              });
            } else if (dragEndDetails.primaryVelocity > 0) {
              // print('Move page backwards');
              setState(() {
                // CalendarBuilder.onVisibleMonthLeft(_data);
                MyHomePage.onVisibleGregLeft(_data);
              });
            }
          },
          child: Center(
            child: Container(
                child: ListView(children: [
              Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                // if (_data.gregKind.active == true)
                if (runingWidget.length >= 1)
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: _mainZise.marginH, vertical: 0),
                    // child: CalendarBuilder(_holidays, _events, _data)
                    //     .gregCalendarTable(setState),
                    child: CalendarBuilder(_holidays, _events, _data)
                        .buildCalendarTable(setState, runingWidget[0]),
                  ),

                // if (_data.mandaKind.active == true)
                if (runingWidget.length >= 2)
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: _mainZise.marginH, vertical: 0),
                    // child: CalendarBuilder(_holidays, _events, _data)
                    //     .mandaCalendarTable(setState),
                    child: CalendarBuilder(_holidays, _events, _data)
                        .buildCalendarTable(setState, runingWidget[1]),
                  ),

                // if (_data.shamsiKind.active == true)
                if (runingWidget.length == 3)
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: _mainZise.marginH, vertical: 0),
                    // child: CalendarBuilder(_holidays, _events, _data)
                    //     .shamsiCalendarTable(setState),
                    child: CalendarBuilder(_holidays, _events, _data)
                        .buildCalendarTable(setState, runingWidget[2]),
                  ),
                // #################   yearEquivalent #################
                if (runingWidget.length > 0)
                  CalendarBuilder(_holidays, _events, _data)
                      .yearEquivalent(_yearEquivalent),
                // #################   dateEquivalent  #################
                if (runingWidget.length > 0)
                  CalendarBuilder(_holidays, _events, _data)
                      .dateEquivalent(_dateEquivalent),

                // ################   _buildEventList  #################

                _selectedEvents.isNotEmpty
                    ? BuildEvents().eventList(context, _selectedEvents, _data)
                    : Text(
                        "",
                        style: TextStyle(fontSize: 1.0, color: Colors.black),
                      ),
                // ################   footerLine  #################
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: _mainZise.marginH, vertical: 0),
                  child: footerLine(context, _data.lang.name, _sizeRate),
                ),

                // ################   myScrollingText  #################
              ]),
              _listOfEventsForYear['en_US'] == ''
                  ? Text("")
                  : myScrollingText(
                      context, _listOfEventsForYear[_lang.name], _sizeRate),
            ])),
          )),
    );
  }
}
