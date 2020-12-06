//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0

/// // Farid Khafji Zadeh 2020 Mandean Calender
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'manda_equivalent.dart';
import 'manda_events.dart';
import 'manda_footer.dart';
import 'manda_formate.dart';
import 'manda_holidays.dart';
import 'manda_scrolling_text.dart';
import 'manda_top_icon_mulwasha.dart';
import 'manda_top_icon_refresh.dart';
import 'manda_top_icon.dart';
import 'my_alignment.dart';
import 'my_color.dart';
import 'my_functions.dart';
import 'my_icon_events.dart';

var _localLang = 'en_US';
var _preLocalLang = 'en_US';
var mandaDay;
var myFooter;
DateTime _selectedDay;
Map<DateTime, List> _holidays;

MandaFormatedDateBuilder mandaDate =
    new MandaFormatedDateBuilder(DateTime.now(), _localLang);
var _mandaAndJalaiYear = mandaDate.fullYearEnFa;
var _mandeanDay = mandaDate.fullDay;

List _selectedEvent;
List _selectedHoliday;

void main() {
  initializeDateFormatting().then((_) => runApp(MandaeanCalendar()));
}

class MandaeanCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MandaEqu.calendarTitle(_localLang),
      home: MyHomePage(title: MandaEqu.calendarTitle(_localLang)),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  double _daysOfWeekFontSize = 13.0;
  double _headerFontSize = 20.0;
  double _daysFontSize = 20.0;
  // double _centerIcon = 19;
  double _rightIcon = 0;
  int _sizeRate = 1;
  double _marginHor = 6.0;

  var _listOfEventsForYear;
  Map _myColorSelection = Mycolor.selection();

  @override
  void initState() {
    super.initState();

    _selectedDay = DateTime.now();

    _holidays =
        MandaFirstDayOfMonthBuilder(_selectedDay.year).eventsForWholeYear;

    _events = MandaEventssBuilder(_selectedDay.year).wholeYear;

    _listOfEventsForYear =
        scrollingText.generateEventsforScroll(_events, _holidays);
    // ***************************
    List todayHolidayEvents = [];

    var todayHoliday = _holidays[_selectedDay] ?? [];
    if (todayHoliday.isNotEmpty) {
      todayHolidayEvents.add(todayHoliday[0][_localLang]);
    }

    var todayEvents = _events[_selectedDay] ?? [];
    if (todayEvents.isNotEmpty) {
      todayEvents.forEach((event) {
        if ((event.runtimeType.toString()).contains('List')) {
          todayHolidayEvents.add(event[0][_localLang]);
        } else {
          todayHolidayEvents.add(todayEvents[0][_localLang]);
        }
      });
    }

    _selectedEvents = todayHolidayEvents ?? [];
    // _selectedEvents = _events[_selectedDay] ?? [];
    // ***************************

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, List events, List holidays,
      {bool clearMandaDate = false}) {
    print('CALLBACK: _onDaySelected');
    if (selectedDay == null) {
      selectedDay = DateTime.now();
      holidays = [];
      events = [];
    }

    _selectedDay = selectedDay;
    _selectedHoliday = holidays;
    _selectedEvent = events;
    List newEvents = [];

    setState(() {
      if (clearMandaDate == true) {
        holidays = [];
        events = [];
      }

      mandaDate = new MandaFormatedDateBuilder(selectedDay, _localLang);
      _mandeanDay = mandaDate.fullDay;
      _mandaAndJalaiYear = mandaDate.fullYearEnFa;

      holidays = holidays ?? [];
      if (holidays.isNotEmpty) {
        holidays = [holidays[0][_localLang]];
      }

      events = events ?? [];
      if (events.isNotEmpty) {
        events.forEach((event) {
          // print(event);
          // print(event.runtimeType);
          if ((event.runtimeType.toString()).contains('List')) {
            newEvents.add(event[0][_localLang]);
          } else {
            newEvents.add(events[0][_localLang]);
          }
        });
      }
      _selectedEvents = holidays + newEvents;
    });
  }

  // void _onDayLongPressed(DateTime selectedDay, List events, List holidays,
  //     {bool clearMandaDate = false}) {
  //   print('CALLBACK: _onDayLongPressed');
  //   Functions.showMyDialog(context, _localLang, "Coming Soon...", "", 1);
  // }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
    // _calendarController.setCalendarFormat(CalendarFormat.month);

    // if (!(_panjaDate.lastDayOfPanja.year == first.year)) {
    if (_holidays.keys.toList()[0].year != first.year) {
      _holidays = MandaFirstDayOfMonthBuilder(first.year).eventsForWholeYear;

      _events = MandaEventssBuilder(first.year).wholeYear;
    }

    var myDay;
    if (first.month == DateTime.now().month &&
        first.year == DateTime.now().year) {
      myDay = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0);
    } else {
      myDay = DateTime(first.year, first.month, first.day, 0, 0);
    }

    var mySelectedEvents = _events[myDay] ?? [];
    var mySelectedHoliday = _holidays[myDay] ?? [];
    _calendarController.setSelectedDay(myDay);
    _onDaySelected(myDay, mySelectedEvents, mySelectedHoliday,
        clearMandaDate: false);
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double _divecWidth = MediaQuery.of(context).size.width;
    // _daysOfWeekFontSize = 13.0;
    // double _headerFontZise = 20.0;
    // double _daysFontZise = 20.0;
    // const double daysMargin = 5.0;
    // double centerIcon = 21;
    // int sizeRate = 1;

    if (_divecWidth > 700) {
      _daysOfWeekFontSize = 30.0;
      _headerFontSize = 40.0;
      _daysFontSize = 40.0;
      // _centerIcon = 67;
      _sizeRate = 2;
      _marginHor = 6 + (_divecWidth - 700) / 2;
    } else {
      _daysOfWeekFontSize = 13.0;
      _headerFontSize = 20.0;
      _daysFontSize = 20.0;
      _sizeRate = 1;
      _marginHor = 6.0;
    }
    double eleSize = _divecWidth / 7;
// eleSize > 49 &&
    if (_sizeRate == 1) {
      _rightIcon = (eleSize - 50) / 2;
    } else if (_sizeRate == 2) {
      _rightIcon = ((_divecWidth - _marginHor * 2) / 6 - 100) / 2;
    }
    if (_rightIcon < 0) {
      _rightIcon = 0;
    }

    if (_preLocalLang != _localLang) {
      _preLocalLang = _localLang;
      myFooter = null;
    }
    double _myMandaFontSize = 20;
    if (_localLang != "en_US") {
      _myMandaFontSize = 24;
    }

    String _myTitle = MandaEqu.calendarTitle(_localLang);

    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0 * _sizeRate),
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu, size: (25.0 * _sizeRate)),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            titleSpacing: -10.0,
            backgroundColor: _myColorSelection['header'],
            actionsIconTheme:
                IconThemeData(size: 50, color: Colors.green, opacity: 10),
            title: FittedBox(
              fit: BoxFit.scaleDown,
              // child: Text(widget.title, style: TextStyle(color: Colors.black)),
              child: Text(_myTitle,
                  style: TextStyle(
                      color: Colors.black, fontSize: _headerFontSize)),
            ),
            // title: Text(widget.title),
            actions: <Widget>[
              // languageSwitch('English'),
              topIconInfo(context, _localLang),
            ],
          ),
        ),
        drawer: Container(
          width: 250.0 * _sizeRate,
          color: Colors.white,
          child: topIconDrawer(context, _localLang),
        ),
        // ***************** Just the whole page can be scroll
        body: Center(
          child: ListView(
            children: [
              Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: _marginHor, vertical: 0),
                  child: _buildTableCalendar(),
                ),
                // _buildTableCalendar(),
                Container(
                  height: 35.0 * _sizeRate,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: _myColorSelection['header2'],
                  ),
                  margin:
                      EdgeInsets.symmetric(horizontal: _marginHor, vertical: 0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      _mandaAndJalaiYear,
                      style: TextStyle(
                          fontSize: 20.0 * _sizeRate,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  // height: 30.0 * _sizeRate,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(width: 0),
                    color: Colors.white,
                  ),
                  margin:
                      EdgeInsets.symmetric(horizontal: _marginHor, vertical: 8),
                  child: FittedBox(
                    // fit: BoxFit.scaleDown,
                    child: Text(
                      _mandeanDay,
                      style: TextStyle(
                          fontSize: _myMandaFontSize * _sizeRate,
                          color: Colors.black),
                    ),
                  ),
                ),
                // const SizedBox(height: 4.0),
                // _buildEventList(),
                _selectedEvents.isNotEmpty
                    ? _buildEventList()
                    : Text(
                        "",
                        style: TextStyle(fontSize: 1.0, color: Colors.black),
                      ),

                // myFooter ??=
                footerLine(context, _localLang, _sizeRate, _marginHor),

                // const SizedBox(height: 4.0),

                // Container(
                //     color: Colors.white,
                //     child: Row(children: <Widget>[
                //       // Text(" Farid Khafaji Zadeh "),
                //       Expanded(
                //         child: Divider(color: Colors.black),
                //       ),
                //       Text(" Farid Khafaji Zadeh v2.1"),
                //       Expanded(
                //         child: Divider(color: Colors.black),
                //       ),
                //       // Text(" Farid Khafaji Zadeh "),
                //     ])),
                _listOfEventsForYear['en_US'] == ''
                    ? Text("")
                    : myScrollingText(
                        context, _listOfEventsForYear[_localLang], _sizeRate),
              ]
                  // .map(_wrapWithStuff).toList(),
                  )
            ],
          ),
        ));
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    MyIcon myIcon = MyIcon(_sizeRate);
    const double daysMargin = 5.0;
    var _myFontWeight = FontWeight.bold;
    if (_localLang == "en_US") {
      _myFontWeight = FontWeight.normal;
    }
    return TableCalendar(
      // locale: 'fa_IR',
      // locale: 'en_US',

      locale: _localLang,
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      headerVisible: true,
      formatAnimation: FormatAnimation.scale,

      daysOfWeekStyle: DaysOfWeekStyle(
        // weekendStyle: TextStyle(
        //     color: Colors.deepOrange[600], fontSize: 13, letterSpacing: 1,),
        weekdayStyle: TextStyle(
            fontSize: _daysOfWeekFontSize,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        weekendStyle: TextStyle(
            color: Colors.deepOrange[600],
            fontSize: _daysOfWeekFontSize,
            fontWeight: FontWeight.bold),
        dowTextBuilder: (date, locale) => _getDayHeader(date, locale),
      ),

      // titleTextBuilder: (date, locale) => DateFormat.yM(locale).format(date),
      calendarStyle: CalendarStyle(
          selectedColor: Colors.red[400],
          todayColor: Colors.deepOrange[400],
          markersColor: Colors.green[700],
          outsideDaysVisible: false,
          holidayStyle: TextStyle().copyWith(
              color: Colors.blue[800],
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
          todayStyle: TextStyle(
            fontWeight: FontWeight.bold,
          )),
      availableCalendarFormats: {
        CalendarFormat.month: 'Month',
      },

      headerStyle: HeaderStyle(
        leftChevronIcon: Icon(
          Icons.chevron_left,
          size: _headerFontSize,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          size: _headerFontSize,
        ),
        titleBuilder: (date) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              _getMonthHeader(date, _localLang),
              style: TextStyle(color: Colors.black, fontSize: _headerFontSize),
            ),
          );
        },
      ),

      // headerStyle: HeaderStyle(
      //   // titleTextBuilder: (date, locale) => DateFormat.yM(locale).format(date),
      //   titleTextBuilder: (date, locale) => _getMonthHeader(date, _localLang),
      //   // DateFormat.yMMMM(locale).format(date),
      //   titleTextStyle: TextStyle(
      //     fontSize: headerFontZise,

      //   ),

      //   formatButtonVisible: false,

      //   // formatButtonShowsNext: false,
      //   // formatButtonTextStyle:
      //   //     TextStyle().copyWith(color: Colors.black, fontSize: 15.0),
      //   // formatButtonDecoration: BoxDecoration(
      //   //   color: _myColorSelection['header'],
      //   //   borderRadius: BorderRadius.circular(16.0),
      //   // ),
      // ),

      builders: CalendarBuilders(
        // markersBuilder: (context, date, events, holidays) {
        //   _markersBuilder(context, date, events, holidays);
        // },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (holidays.isNotEmpty) {
            holidays.forEach((holiday) {
              if (holiday['en_US'].contains("First")) {
                children.add(
                  Positioned(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: myIcon.firstMonth,
                    ),
                  ),
                );
              }
            });
          }

          if (events.isNotEmpty) {
            events.forEach((event) {
              // print(event);
              // print(event.runtimeType.toString());
              if (event.runtimeType == String) {
                event = event;
              } else if ((event.runtimeType.toString()).contains('List')) {
                event = event[0]['en_US'];
              } else {
                event = event['en_US'];
              }

              if (event.contains("Minor")) {
                children.add(
                  Positioned(
                    // left: lightPosition,
                    left: _rightIcon,
                    // bottom: 0,
                    child: myIcon.minor,
                  ),
                );
              } else if (event.contains("Major")) {
                children.add(
                  Positioned(
                    // left: heavyPosition,
                    left: _rightIcon,
                    // bottom: 0,
                    // child: _buildHeavyEventMarker(),
                    child: myIcon.major,
                  ),
                );
              } else {
                children.add(
                  Positioned(
                    // left: othrsPosition,
                    right: _rightIcon,
                    // bottom: -3,
                    child: myIcon.relig,
                  ),
                );
              }
            });
          }
          return children;
        },
        ////
        //// dayBuilder: (context, date, events) {
        ////   _myDayBuilder(context, date, events, _localLang);
        //// },

        /// ###### Day builder day number size, color
        dayBuilder: (context, date, events) => Container(
          margin: const EdgeInsets.all(daysMargin),
          alignment: Alignment.center,
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                DateFormat.d(_localLang).format(date),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: _daysFontSize,
                    fontWeight: _myFontWeight),
              )),
        ),

        /// selected Day Builder the color of today and the marker
        selectedDayBuilder: (context, date, events) => Container(
          margin: const EdgeInsets.all(daysMargin),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Theme.of(context).primaryColorDark,
            color: Colors.black54,
            //
          ),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                DateFormat.d(_localLang).format(date),
                style: TextStyle(color: Colors.white, fontSize: _daysFontSize),
              )),
        ),

        /// today Day Builder the color of today and the marker
        todayDayBuilder: (context, date, events) => Container(
          margin: const EdgeInsets.all(daysMargin),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _myColorSelection['header2'],
          ),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                DateFormat.d(_localLang).format(date),
                style: TextStyle(color: Colors.black, fontSize: _daysFontSize),
              )),
        ),
      ),

      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
      // onDayLongPressed: _onDayLongPressed,
    );
  }

  Widget _buildEventList() {
    // return ListView(
    var myAlignment = MyAlignment.countryLanguage(_localLang);
    return Column(
      children: _selectedEvents
          .map((event) => Container(
                constraints: BoxConstraints(
                  minHeight: 30,
                ),
                width: 700,
                alignment: myAlignment,
                decoration: BoxDecoration(
                    border: Border.all(width: 0),
                    borderRadius: BorderRadius.circular(8.0),
                    color: _myColorSelection['minor']),
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Column(children: [
                  _generateIconEvent(event),
                ]),
              ))
          .toList(),
    );
  }

  Widget _generateIconEvent(event) {
    MyIcon myIcon = MyIcon(_sizeRate);
    var myAlignment = MyAlignment.countryLanguage(_localLang);
    var myTextAlignment = MyAlignment.textAlig(_localLang);
    var eventIcon;
    var beforeEvent;
    var afterEvent;

    if (event.contains("Minor") ||
        event.contains("سبک") ||
        event.contains("خفیف")) {
      eventIcon = myIcon.minor;
    } else if (event.contains("Major") ||
        event.contains("سنگین") ||
        event.contains("ثقیل")) {
      eventIcon = myIcon.major;
    } else if (event.contains("First") ||
        event.contains(" اول ماه") ||
        event.contains("رأس")) {
      eventIcon = myIcon.firstMonth;
    } else if (event.contains("==")) {
      eventIcon = myIcon.noon;
    } else {
      eventIcon = myIcon.relig;
    }

    if (_localLang == "en_US") {
      beforeEvent = eventIcon;
      afterEvent = myIcon.noon;
    } else {
      beforeEvent = myIcon.noon;
      afterEvent = eventIcon;
    }

    return Row(
      children: [
        beforeEvent,
        Flexible(
            child: Container(
          alignment: myAlignment,
          child: Text(
            event.toString(),
            textAlign: myTextAlignment,
            style: TextStyle(fontSize: 20.0 * _sizeRate, color: Colors.black),
          ),
        )),
        Text(" "),
        afterEvent
      ],
    );
  }

  Widget languageSwitch(String dropdownValue) {
    return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
      icon: Icon(
        // padding: EdgeInsets.zero,
        Icons.language,
        color: Colors.white,
        size: 30,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          // print(newValue);
          var langList = {
            'العربية': 'ar',
            'فارسی': 'fa_IR',
            'English': 'en_US'
          };
          _localLang = langList[newValue];
        });
        // _onDaySelected(DateTime.now(), [], [], clearMandaDate: true);
        _onDaySelected(_selectedDay, _selectedEvent, _selectedHoliday);
      },
      items: <String>['English', 'فارسی', 'العربية']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 12.0 * _sizeRate, color: Colors.black),
          ),
        );
      }).toList(),
    ));
  }

  Widget topIconInfo(BuildContext context, String localLang) {
    return Container(
        child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              child: Row(
                children: [
                  // mulwashal(context, localLang),
                  FittedBox(
                    child: Row(
                      children: [
                        languageSwitch('English'),
                        refresh(context, localLang),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  // _getDayNum(DateTime date, locale) {
  //   var day;
  //   day = DateFormat.d(locale).format(date);
  //   return day;
  // }

  _getDayHeader(DateTime date, locale) {
    var day;
    if (locale == 'fa_IR') {
      var dayFa = DateFormat.EEEE(locale).format(date);
      day = MandaEqu.changeDayFormate(dayFa);
    } else {
      day = DateFormat.E(locale).format(date);
    }
    // var day = DateFormat.EEEE(locale).format(date).substring(0, 4);
    return day;
  }

  _getMonthHeader(date, locale) {
    var day;

    if (locale == 'ar') {
      var monthEn = DateFormat.MMMM('en_US').format(date);
      var yearAr = DateFormat.y(locale).format(date);
      var monthAr = MandaEqu.changeMonthFormate(monthEn);
      day = '$monthAr $yearAr';
    } else {
      day = DateFormat.yMMMM(locale).format(date);
    }
    // var day = DateFormat.EEEE(locale).format(date).substring(0, 4);
    return day;
  }
}
