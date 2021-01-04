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
import 'my_functions.dart';
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
CalenderKind _calenderKind = new CalenderKind();
Event _event = new Event();
Selected _selected = new Selected();
// StartOfMonth _first = new StartOfMonth();
// EndOfMonth _last = new EndOfMonth();
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
var _context;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UserSetting.getCalendar(_calenderKind);
  UserSetting.getDefaultLanguage(_lang);
  _data.calendarKind = _calenderKind.display;
  initializeDateFormatting().then((_) => runApp(MandaeanCalendar()));
}

class MandaeanCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _data.lang = _lang;
    _data.event = _event;
    _data.calendarKind = _calenderKind;
    _data.selected = _selected;
    // _data.first = _first;
    // _data.last = _last;
    _data.gregMonth = _gregMonth;
    _data.mandaMonth = _mandaMonth;
    _data.shamsiMonth = _shamsiMonth;
    _data.gregMonth.info = {};
    _data.mandaMonth.info = {};
    _data.shamsiMonth.info = {};
    _lang.name = "en_US";
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

  static void runHolidaysEvents(int selectedYear, var data) {
    data.event.year = selectedYear;
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

    _listOfEventsForYear =
        scrollingText.generateEventsforScroll(_events, _holidays);
  }

  static void _onVisibleMonth(
      data, DateTime dateFaAr, DateTime date, String leftRight, kind) {
    print('CALLBACK: _onVisibleMonth');
    DateTime selectedDay = data.selected.date;

    if (data.lang.name == "fa_IR" || data.lang.name == "ar") {
      data.selected.date = dateFaAr;
      if (leftRight == 'right') {}
    } else {
      data.selected.date = date;
      if (leftRight == 'right') {}
    }
    CalendarBuilder.getMonthDate(data);
    selectedDay = data.selected.date;
    _selectedEvents = MyHomePage.todayHolidayEvents(selectedDay);
    _dateEquivalent = [selectedDay, '', kind];
    _listOfEventsForYear['en_US'] = '';
    // print(selectedDay);

    if (data.event.year != selectedDay.year) {
      runHolidaysEvents(selectedDay.year, data);
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
    _selectedEvents = todayHolidayEvents(selectedDay[0]);
    // print(_selectedEvents);
  }

  static todayHolidayEvents(DateTime selectedDay) {
    List todayHolidayEvents = [];

    var todayHoliday = _todayHoliday(selectedDay);

    if (todayHoliday.isNotEmpty) {
      todayHolidayEvents.addAll(todayHoliday);
    }

    var todayEvents = _todayEvents(selectedDay);

    if (todayEvents.isNotEmpty) {
      todayHolidayEvents.addAll(todayEvents);
    }
    // print(todayHolidayEvents);
    return todayHolidayEvents;
  }

  static _todayHoliday(DateTime selectedDay) {
    var todayHoliday = _holidays[selectedDay] ?? [];

    // print(todayHoliday);
    return todayHoliday;
  }

  static _todayEvents(DateTime selectedDay) {
    List todayEventsList = [];

    var todayEvents = _events[selectedDay] ?? [];
    if (todayEvents.isNotEmpty) {
      todayEvents.forEach((event) {
        if ((event.runtimeType.toString()).contains('List')) {
          todayEventsList.add(event[0]);
        } else {
          todayEventsList.add(todayEvents[0]);
        }
      });
    }
    // print(todayEventsList);
    return todayEventsList;
  }

  static onDayLongPressed(selectedDay) {
    print('CALLBACK: _onDayLogPressed');
    // print('_onDayLogPressed $selectedDay');
    var selectedEvents = _todayEvents(selectedDay);
    // print('selectedEvents: $selectedEvents');
    if (selectedEvents.isNotEmpty) {
      String doc = Functions.eventsDoc(selectedEvents, _lang.name);
      if (doc != null) {
        Functions.showMyDialog(_context, _lang.name, "", doc, 1);
      }
    }
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    UserSetting.getLanguage(setState, _lang);
    CalendarBuilder.getMonthDate(_data);
    MyHomePage.runHolidaysEvents(_data.selected.date.year, _data);
    _dateEquivalent = _data.gregMonth.info["selectedDay"];

    _yearEquivalent = _data.gregMonth.info["selectedDay"];
    _selectedEvents = MyHomePage.todayHolidayEvents(_data.selected.date);
    // print("one time run main ################");
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    _context = context;
    double divecWidth = MediaQuery.of(context).size.width;
    _data.divecSize = _divec;
    _divec.width = divecWidth;
    _cellWidth = MyFontSize.cellWidth(_data);
    double _sizeRate = MyFontSize.s21(_data);
    String _myTitle = MandaEqu.calendarTitle()[_lang.name];
    // ###############################################################
    // ###############################################################
    var runingWidget;
    runingWidget = _data.calendarKind.display;
    // runingWidget = ['greg', 'manda'];
    // runingWidget = ['greg'];
    // runingWidget = ['manda'];
    // runingWidget = ['shamsi'];
    // runingWidget = ['manda', 'greg', 'shamsi'];
    // print(runingWidget);

    MainSize _mainZise = new MainSize(_data);

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
        child: topIconDrawer(context, _lang.name, setState, _data),
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
                // Text(
                //   _saveMy.display.toString() + "Farid",
                //   style: TextStyle(fontSize: 40),
                // ),
                if (runingWidget != null && runingWidget.length >= 1)
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: _mainZise.marginH, vertical: 0),
                    // child: CalendarBuilder(_holidays, _events, _data)
                    //     .gregCalendarTable(setState),
                    child: CalendarBuilder(_holidays, _events, _data)
                        .buildCalendarTable(setState, runingWidget[0]),
                  ),

                if (runingWidget != null && runingWidget.length >= 2)
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: _mainZise.marginH, vertical: 0),
                    // child: CalendarBuilder(_holidays, _events, _data)
                    //     .mandaCalendarTable(setState),
                    child: CalendarBuilder(_holidays, _events, _data)
                        .buildCalendarTable(setState, runingWidget[1]),
                  ),

                if (runingWidget != null && runingWidget.length == 3)
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: _mainZise.marginH, vertical: 0),
                    // child: CalendarBuilder(_holidays, _events, _data)
                    //     .shamsiCalendarTable(setState),
                    child: CalendarBuilder(_holidays, _events, _data)
                        .buildCalendarTable(setState, runingWidget[2]),
                  ),
                // #################   yearEquivalent #################
                if (runingWidget != null && runingWidget.length > 0)
                  CalendarBuilder(_holidays, _events, _data)
                      .yearEquivalent(_yearEquivalent),
                // #################   dateEquivalent  #################
                if (runingWidget != null && runingWidget.length > 0)
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
              if (_listOfEventsForYear['en_US'] != '')
                myScrollingText(
                    context, _listOfEventsForYear[_lang.name], _sizeRate),
            ])),
          )),
    );
  }
}
