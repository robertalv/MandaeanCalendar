import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_font_size.dart';
import 'setter_getter.dart';
import 'manda_equivalent.dart';
import 'widget_calendar_builder.dart';
import 'widget_drawer.dart';
import 'widget_top_icon.dart';
import 'my_color.dart';
import 'user_set.dart';

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
DateTime _selectedDay = DateTime(_today.year, _today.month, _today.day, 0, 0);
double _cellWidth;

// double _divecWidth;

// import 'month_display_date_builder.dart';

// DateTime todayNow = DateTime.now();
// DateTime _today = DateTime(todayNow.year, todayNow.month, todayNow.day, 0, 0);
// DateTime _selectedDay = DateTime(_today.year, _today.month, _today.day, 0, 0);

// double _margin = 4;
// List _preMonthList = [];

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
    _selected.date = _selectedDay;
    _data.today = _selectedDay;

    print(_selected.date);
    print(_data.selected.date);

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
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    UserSetting.getLanguage(setState, _lang);

    // mandaDate = new MandaFormatedDateBuilder(DateTime.now(), _localLang);
    // _mandaAndJalaiYear = mandaDate.fullYearEnFa;
    // _mandeanDay = mandaDate.fullDay;

    // _selectedDay = DateTime.now();
    // var today = DateTime.now();
    // todayEven(today);

    // _selectedEvents = _todayHolidayEvents ?? [];

    // ***************************

    // _calendarController = CalendarController();

    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 400),
    // );

    // _animationController.forward();
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
    _data.gregKind.active = true;
    _data.mandaKind.active = true;
    _data.shamsiKind.active = true;
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
            // Page forwards
            // print('Move page forwards');
            setState(() {
              CalendarBuilder.onVisibleMonthRight(_data);
            });
          } else if (dragEndDetails.primaryVelocity > 0) {
            // Page backwards
            // print('Move page backwards');
            setState(() {
              CalendarBuilder.onVisibleMonthLeft(_data);
            });
          }
        },
        child: Center(
            child: ListView(children: [
          Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            // if (_data.gregKind.active == true)
            //   CalendarBuilder().buildTableCalendar("greg", _data, setState),
            // if (_data.mandaKind.active == true)
            //   CalendarBuilder().buildTableCalendar("manda", _data, setState),

            // if (_data.gregKind.active == true)
            //   GregCalendarTable(_data, setState).build(context),
            // if (_data.mandaKind.active == true)
            //   MandaCalendarTable(_data).build(context),
            if (_data.gregKind.active == true)
              CalendarBuilder().gregCalendarTable(_data, setState),
            if (_data.mandaKind.active == true)
              CalendarBuilder().mandaCalendarTable(_data, setState),
            if (_data.shamsiKind.active == true)
              CalendarBuilder().shamsiCalendarTable(_data, setState),

            // Container(
            //   margin:
            //       // EdgeInsets.symmetric(horizontal: _marginHor, vertical: 0),
            //       EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            //   child: buildTableCalendar(_data),
            // ),
            Text("test111")
          ]),
          Text("test")
        ])),
      ),
    );
  }
}

// //  Copyright (c) 2019 Aleksander Woźniak
// //  Licensed under Apache License v2.0

// /// // Farid Khafji Zadeh 2020 Mandean Calender
// import 'dart:core';
// import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'local_number.dart';
// import 'manda_date.dart';
// import 'manda_equivalent.dart';
// import 'manda_events.dart';
// import 'manda_footer.dart';
// import 'manda_formate.dart';
// import 'manda_holidays.dart';
// import 'manda_scrolling_text.dart';
// // import 'manda_top_icon_mulwasha.dart';
// import 'manda_top_icon_refresh.dart';
// import 'manda_top_icon.dart';
// import 'my_alignment.dart';
// import 'my_color.dart';
// // import 'my_functions.dart';
// import 'my_icon_events.dart';

// var _localLang = 'en_US';
// var _preLocalLang = 'en_US';
// var mandaDay;
// double _listFontSize = 20;
// // var myFooter;
// DateTime _selectedDay;

// Map<DateTime, List> _holidays;
// List _todayHolidayEvents = [];

// // MandaFormatedDateBuilder mandaDate =
// //     new MandaFormatedDateBuilder(DateTime.now(), _localLang);
// // var _mandaAndJalaiYear = mandaDate.fullYearEnFa;
// // var _mandeanDay = mandaDate.fullDay;
// MandaFormatedDateBuilder mandaDate;
// var _mandaAndJalaiYear;
// var _mandeanDay;

// List _selectedEvent;
// List _selectedHoliday;

// void main() {
//   initializeDateFormatting().then((_) => runApp(MandaeanCalendar()));
// }

// class MandaeanCalendar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var today = DateTime.now();
//     _selectedDay = DateTime(today.year, today.month, today.day, 0, 0);
//     return MaterialApp(
//       title: " MandaEqu.calendarTitle(_localLang)",
//       home: MyHomePage(title: "MandaEqu.calendarTitle(_localLang)"),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   Map<DateTime, List> _events;
//   List _selectedEvents;
//   AnimationController _animationController;
//   CalendarController _calendarController;
//   double _daysOfWeekFontSize = 13.0;
//   double _headerFontSize = 20.0;
//   double _daysFontSize = 20.0;
//   // double _centerIcon = 19;
//   double _rightIcon = 0;
//   int _sizeRate = 1;
//   double _marginHor = 6.0;
//   double _longFontSize = 16.0;

//   var _listOfEventsForYear;
//   Map _myColorSelection = Mycolor.selection();

//   // ######################
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   static final String _kLanguageCode = "language";

//   /// ------------------------------------------------------------
//   /// Method that returns the user language code, 'en' if not set
//   /// ------------------------------------------------------------
//   Future<void> getLanguage() async {
//     // final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final SharedPreferences prefs = await _prefs;
//     setState(() {
//       _localLang = prefs.getString(_kLanguageCode) ?? 'en_US';
//       // print(_localLang);
//     });
//     // _localLang = prefs.getString(_kLanguageCode) ?? 'en_US';
//   }

//   /// ----------------------------------------------------------
//   /// Method that saves the user language code
//   /// ----------------------------------------------------------
//   static Future<bool> setLanguage(String value) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     return prefs.setString(_kLanguageCode, value);
//   }

//   void todayEven(DateTime date) {
//     _todayHolidayEvents = [];
//     _selectedDay = DateTime(date.year, date.month, date.day, 0, 0);

//     _holidays =
//         MandaFirstDayOfMonthBuilder(_selectedDay.year).eventsForWholeYear;

//     _events = MandaEventssBuilder(_selectedDay.year).wholeYear;

//     _listOfEventsForYear =
//         scrollingText.generateEventsforScroll(_events, _holidays);
//     // ***************************

//     var todayHoliday = _holidays[_selectedDay] ?? [];
//     if (todayHoliday.isNotEmpty) {
//       _todayHolidayEvents.add(todayHoliday[0][_localLang]);
//     }

//     var todayEvents = _events[_selectedDay] ?? [];
//     if (todayEvents.isNotEmpty) {
//       todayEvents.forEach((event) {
//         if ((event.runtimeType.toString()).contains('List')) {
//           _todayHolidayEvents.add(event[0][_localLang]);
//         } else {
//           _todayHolidayEvents.add(todayEvents[0][_localLang]);
//         }
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getLanguage();
//     // mandaDate = new MandaFormatedDateBuilder(DateTime.now(), _localLang);
//     // _mandaAndJalaiYear = mandaDate.fullYearEnFa;
//     // _mandeanDay = mandaDate.fullDay;

//     // _selectedDay = DateTime.now();
//     // var today = DateTime.now();
//     // todayEven(today);

//     // _selectedEvents = _todayHolidayEvents ?? [];

//     // ***************************

//     _calendarController = CalendarController();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//     );

//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _calendarController.dispose();
//     super.dispose();
//   }

//   void _onDaySelected(DateTime selectedDay, List events, List holidays,
//       {bool clearMandaDate = false}) {
//     print('CALLBACK: _onDaySelected');
//     if (selectedDay == null) {
//       selectedDay = DateTime.now();
//       holidays = [];
//       events = [];
//     }

//     _selectedDay = selectedDay;
//     _selectedHoliday = holidays;
//     _selectedEvent = events;
//     List newEvents = [];

//     setState(() {
//       if (clearMandaDate == true) {
//         holidays = [];
//         events = [];
//       }

//       // mandaDate = new MandaFormatedDateBuilder(selectedDay, _localLang);
//       // _mandeanDay = mandaDate.fullDay;
//       // _mandaAndJalaiYear = mandaDate.fullYearEnFa;

//       // holidays = holidays ?? [];
//       // if (holidays.isNotEmpty) {
//       //   holidays = [holidays[0][_localLang]];
//       // }

//       // events = events ?? [];
//       // if (events.isNotEmpty) {
//       //   events.forEach((event) {
//       //     // print(event);
//       //     // print(event.runtimeType);
//       //     if ((event.runtimeType.toString()).contains('List')) {
//       //       newEvents.add(event[0][_localLang]);
//       //     } else {
//       //       newEvents.add(events[0][_localLang]);
//       //     }
//       //   });
//       // }
//       // _selectedEvents = holidays + newEvents;
//       // print(_selectedEvents);
//     });
//   }

//   // void _onDayLongPressed(DateTime selectedDay, List events, List holidays,
//   //     {bool clearMandaDate = false}) {
//   //   print('CALLBACK: _onDayLongPressed');
//   //   Functions.showMyDialog(context, _localLang, "Coming Soon...", "", 1);
//   // }

//   void _onVisibleDaysChanged(
//       DateTime first, DateTime last, CalendarFormat format) {
//     print('CALLBACK: _onVisibleDaysChanged');
//     // _calendarController.setCalendarFormat(CalendarFormat.month);

//     // if (!(_panjaDate.lastDayOfPanja.year == first.year)) {
//     // if (_holidays.keys.toList()[0].year != first.year) {
//     //   _holidays = MandaFirstDayOfMonthBuilder(first.year).eventsForWholeYear;

//     //   _events = MandaEventssBuilder(first.year).wholeYear;
//     // }

//     // var myDay;
//     // if (first.month == DateTime.now().month &&
//     //     first.year == DateTime.now().year) {
//     //   myDay = DateTime(
//     //       DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0);
//     // } else {
//     //   myDay = DateTime(first.year, first.month, first.day, 0, 0);
//     // }

//     // var mySelectedEvents = _events[myDay] ?? [];
//     // var mySelectedHoliday = _holidays[myDay] ?? [];
//     // _calendarController.setSelectedDay(myDay);
//     // _onDaySelected(myDay, mySelectedEvents, mySelectedHoliday,
//     //     clearMandaDate: false);
//   }

//   void _onCalendarCreated(
//       DateTime first, DateTime last, CalendarFormat format) {
//     getLanguage();

//     print('CALLBACK: _onCalendarCreated');
//   }

//   final _scaffoldKey = new GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     double _divecWidth = MediaQuery.of(context).size.width;
//     // _daysOfWeekFontSize = 13.0;
//     // double _headerFontZise = 20.0;
//     // double _daysFontZise = 20.0;
//     // const double daysMargin = 5.0;
//     // double centerIcon = 21;
//     // int sizeRate = 1;
//     mandaDate = new MandaFormatedDateBuilder(_selectedDay, _localLang);
//     _mandaAndJalaiYear = mandaDate.fullYearEnFa;
//     _mandeanDay = mandaDate.fullDay;

//     double dateIconSize;
//     if (_divecWidth > 700) {
//       _daysOfWeekFontSize = 24.0;
//       _headerFontSize = 40.0;
//       _daysFontSize = 40.0;
//       // _centerIcon = 67;
//       _sizeRate = 2;
//       _marginHor = 6 + (_divecWidth - 700) / 2;
//       _longFontSize = 22.0;
//       dateIconSize = 30;
//     } else {
//       _daysOfWeekFontSize = 12.0;
//       _headerFontSize = 20.0;
//       _daysFontSize = 22.0;
//       _sizeRate = 1;
//       _marginHor = 6.0;
//       _longFontSize = 16.0;
//       dateIconSize = 16;
//       if (_localLang == "en_US") {
//         _daysFontSize = 18.0;
//       }
//     }

//     //// test22############# icon position for days
//     double eleSize = _divecWidth / 7;

//     if (_sizeRate == 1) {
//       _rightIcon = (eleSize - 50) / 2;
//     } else if (_sizeRate == 2) {
//       _rightIcon = ((_divecWidth - _marginHor * 2) / 6 - 100) / 2;
//     }
//     if (_rightIcon < 0) {
//       _rightIcon = 0;
//     }

//     // if (_preLocalLang != _localLang) {
//     //   _preLocalLang = _localLang;
//     //   myFooter = null;
//     // }
//     _listFontSize = 20;
//     var myDateIcon = Icon(
//       Icons.date_range,
//       size: dateIconSize,
//     );

//     var beforeDateIcon;
//     var afterDateIcon;

//     if (_localLang != "en_US") {
//       _listFontSize = 20;
//       beforeDateIcon = Text("");
//       afterDateIcon = myDateIcon;
//     } else {
//       beforeDateIcon = myDateIcon;
//       afterDateIcon = Text("");
//     }

//     String _myTitle = MandaEqu.calendarTitle(_localLang);
//     todayEven(_selectedDay);
//     _selectedEvents = _todayHolidayEvents ?? [];

//     var myTextAlignment = MyAlignment.textAlig(_localLang);
//     var myAlignment = MyAlignment.countryLanguage(_localLang);

//     return Scaffold(
//         key: _scaffoldKey,
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(40.0 * _sizeRate),
//           child: AppBar(
//             leading: IconButton(
//               icon: Icon(Icons.menu, size: (25.0 * _sizeRate)),
//               onPressed: () => _scaffoldKey.currentState.openDrawer(),
//             ),
//             titleSpacing: -10.0,
//             backgroundColor: _myColorSelection['header'],
//             actionsIconTheme:
//                 IconThemeData(size: 50, color: Colors.green, opacity: 10),
//             title: FittedBox(
//               fit: BoxFit.scaleDown,
//               // child: Text(widget.title, style: TextStyle(color: Colors.black)),
//               child: Text(_myTitle,
//                   style: TextStyle(
//                       color: Colors.black, fontSize: _headerFontSize)),
//             ),
//             // title: Text(widget.title),
//             actions: <Widget>[
//               // languageSwitch('English'),
//               topIconInfo(context, _localLang),
//             ],
//           ),
//         ),
//         drawer: Container(
//           width: 250.0 * _sizeRate,
//           color: Colors.white,
//           child: topIconDrawer(context, _localLang),
//         ),
//         // ***************** Just the whole page can be scroll
//         body: Center(
//           child: ListView(
//             children: [
//               Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
//                 Container(
//                   margin:
//                       EdgeInsets.symmetric(horizontal: _marginHor, vertical: 0),
//                   child: _buildTableCalendar(),
//                 ),
//                 // _buildTableCalendar(),
//                 Container(
//                   constraints: BoxConstraints(
//                     minHeight: 35.0 * _sizeRate,
//                   ),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     color: _myColorSelection['header2'],
//                   ),
//                   margin: EdgeInsets.only(
//                       left: _marginHor, right: _marginHor, bottom: 8),
//                   child: FittedBox(
//                     // fit: BoxFit.scaleDown,
//                     child: Text(
//                       _mandaAndJalaiYear,
//                       style: TextStyle(
//                         fontSize: _listFontSize * _sizeRate,
//                         color: Colors.black,
//                         // fontWeight: FontWeight.bold
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   // height: 30.0 * _sizeRate,
//                   constraints: BoxConstraints(
//                     minHeight: 0,
//                   ),
//                   alignment: myAlignment,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     border: Border.all(width: 0),
//                     color: Colors.white,
//                   ),
//                   margin:
//                       EdgeInsets.symmetric(horizontal: _marginHor, vertical: 4),
//                   child: SizedBox(
//                       // fit: BoxFit.scaleDown,
//                       child: Row(
//                     children: [
//                       beforeDateIcon,
//                       Flexible(
//                         child: Container(
//                           alignment: myAlignment,
//                           child: Text(
//                             _mandeanDay,
//                             textAlign: myTextAlignment,
//                             style: TextStyle(
//                                 fontSize: _listFontSize * _sizeRate,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       Text(" "),
//                       afterDateIcon
//                     ],
//                   )),
//                 ),
// // ######## New
//                 // Container(
//                 //   // height: 30.0 * _sizeRate,
//                 //   constraints: BoxConstraints(
//                 //     minHeight: 0,
//                 //   ),
//                 //   alignment: myAlignment,
//                 //   decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.circular(8.0),
//                 //     border: Border.all(width: 0),
//                 //     color: Colors.white,
//                 //   ),
//                 //   margin:
//                 //       EdgeInsets.symmetric(horizontal: _marginHor, vertical: 4),
//                 //   child: SizedBox(
//                 //       // fit: BoxFit.scaleDown,
//                 //       child: mandaDayFa(context, _selectedDay, _localLang)),
//                 // ),

//                 _selectedEvents.isNotEmpty
//                     ? _buildEventList()
//                     : Text(
//                         "",
//                         style: TextStyle(fontSize: 1.0, color: Colors.black),
//                       ),

//                 // myFooter ??=
//                 footerLine(context, _localLang, _sizeRate, _marginHor),

//                 // const SizedBox(height: 4.0),

//                 // Container(
//                 //     color: Colors.white,
//                 //     child: Row(children: <Widget>[
//                 //       // Text(" Farid Khafaji Zadeh "),
//                 //       Expanded(
//                 //         child: Divider(color: Colors.black),
//                 //       ),
//                 //       Text(" Farid Khafaji Zadeh v2.1"),
//                 //       Expanded(
//                 //         child: Divider(color: Colors.black),
//                 //       ),
//                 //       // Text(" Farid Khafaji Zadeh "),
//                 //     ])),
//                 _listOfEventsForYear['en_US'] == ''
//                     ? Text("")
//                     : myScrollingText(
//                         context, _listOfEventsForYear[_localLang], _sizeRate),
//               ]
//                   // .map(_wrapWithStuff).toList(),
//                   )
//             ],
//           ),
//         ));
//   }

//   // Simple TableCalendar configuration (using Styles)
//   Widget _buildTableCalendar() {
//     MyIcon myIcon = MyIcon(_sizeRate);
//     const double daysMargin = 3.0;
//     // var _myFontWeight = FontWeight.bold;
//     // if (_localLang == "en_US") {
//     //   _myFontWeight = FontWeight.normal;
//     // }

//     return TableCalendar(
//       // locale: 'fa_IR',
//       // locale: 'en_US',

//       locale: _localLang,
//       calendarController: _calendarController,
//       events: _events,
//       holidays: _holidays,
//       startingDayOfWeek: StartingDayOfWeek.sunday,
//       headerVisible: true,
//       formatAnimation: FormatAnimation.scale,

//       // titleTextBuilder: (date, locale) => DateFormat.yM(locale).format(date),
//       calendarStyle: CalendarStyle(
//           // contentDecoration: BoxDecoration(
//           //   border: Border(top: BorderSide()), // customize
//           // ),
//           selectedColor: Colors.red[400],
//           todayColor: Colors.deepOrange[400],
//           markersColor: Colors.green[700],
//           outsideDaysVisible: true,
//           holidayStyle: TextStyle().copyWith(
//               color: Colors.blue[800],
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold),
//           todayStyle: TextStyle(
//             fontWeight: FontWeight.bold,
//           )),
//       availableCalendarFormats: {
//         CalendarFormat.month: 'Month',
//       },

//       ///// // ################# Year & Month & < > icon Header
//       headerStyle: HeaderStyle(
//         leftChevronIcon: Icon(
//           Icons.chevron_left,
//           size: _headerFontSize,
//         ),
//         rightChevronIcon: Icon(
//           Icons.chevron_right,
//           size: _headerFontSize,
//         ),
//         titleTextBuilder: (date, locale) => _getMonthHeader(date, _localLang),
//         titleTextStyle: TextStyle(
//           color: Colors.black,
//           fontSize: _headerFontSize,
//         ),
//         centerHeaderTitle: true,
//       ),

//       // headerStyle: HeaderStyle(
//       //   // titleTextBuilder: (date, locale) => DateFormat.yM(locale).format(date),
//       //   titleTextBuilder: (date, locale) => _getMonthHeader(date, _localLang),
//       //   // DateFormat.yMMMM(locale).format(date),
//       //   titleTextStyle: TextStyle(
//       //     fontSize: headerFontZise,

//       //   ),

//       //   formatButtonVisible: false,

//       //   // formatButtonShowsNext: false,
//       //   // formatButtonTextStyle:
//       //   //     TextStyle().copyWith(color: Colors.black, fontSize: 15.0),
//       //   // formatButtonDecoration: BoxDecoration(
//       //   //   color: _myColorSelection['header'],
//       //   //   borderRadius: BorderRadius.circular(16.0),
//       //   // ),
//       // ),

//       // unavailableDayBuilder

//       ////// /// ######## Name of Day Header
//       daysOfWeekStyle: DaysOfWeekStyle(
//         // weekendStyle: TextStyle(
//         //     color: Colors.deepOrange[600], fontSize: 13, letterSpacing: 1,),
//         weekdayStyle: TextStyle(
//             fontSize: _daysOfWeekFontSize,
//             color: Colors.black,
//             fontWeight: FontWeight.bold),
//         weekendStyle: TextStyle(
//             color: Colors.deepOrange[600],
//             fontSize: _daysOfWeekFontSize,
//             fontWeight: FontWeight.bold),
//         dowTextBuilder: (date, locale) => _getDayHeader(date, locale),
//       ),

//       builders: CalendarBuilders(
//         // markersBuilder: (context, date, events, holidays) {
//         //   _markersBuilder(context, date, events, holidays);
//         // },

//         markersBuilder: (context, date, events, holidays) {
//           final children = <Widget>[];
//           // date = _changeDateOrder(date);
//           // print(date);
//           // print("******************");
//           List myEvents = [];

//           if (holidays.isNotEmpty) {
//             myEvents.addAll(holidays);
//           }
//           if (events.isNotEmpty) {
//             myEvents.addAll(events);
//           }

//           if (myEvents.length == 1) {
//             children.add(
//               Positioned(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: findMyIcon(myEvents[0], _sizeRate),
//                 ),
//               ),
//             );
//           } else if (myEvents.length == 2) {
//             children.add(
//               Positioned(
//                 left: _rightIcon + 7,
//                 child: findMyIcon(myEvents[1], _sizeRate),
//               ),
//             );

//             children.add(
//               Positioned(
//                 right: _rightIcon + 7,
//                 child: findMyIcon(myEvents[0], _sizeRate),
//               ),
//             );
//           } else {
//             children.add(
//               Positioned(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: findMyIcon(myEvents[0], _sizeRate),
//                 ),
//               ),
//             );

//             children.add(
//               Positioned(
//                 left: _rightIcon,
//                 child: findMyIcon(myEvents[2], _sizeRate),
//               ),
//             );

//             children.add(
//               Positioned(
//                 right: _rightIcon,
//                 child: findMyIcon(myEvents[1], _sizeRate),
//               ),
//             );
//           }
//           return children;
//         },
//         ////
//         //// dayBuilder: (context, date, events) {
//         ////   _myDayBuilder(context, date, events, _localLang);
//         //// },
//         ///
//         ///

//         /// ###### Day builder day number size, color
//         dayBuilder: (context, date, events) => Container(
//           margin: const EdgeInsets.all(daysMargin),
//           alignment: Alignment.center,
//           child: SizedBox(
//               // fit: BoxFit.scaleDown,
//               child: Text(
//             // DateFormat.d(_localLang).format(date),
//             _getDayNum(date, _localLang),
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: _daysFontSize,
//             ),
//           )),
//         ),

//         // outsideDayBuilder: (context, date, data) {
//         //   print(date);
//         //   _getDayNum(date, _localLang);
//         //   return Container();
//         // },

//         // outsideHolidayDayBuilder: (context, date, list) {
//         //   print(date);
//         //   return Container();
//         // },
//         // outsideWeekendDayBuilder: (context, date, list) {
//         //   print(date);
//         //   _getDayNum(date, _localLang);
//         //   return Container();
//         // },

//         /// selected Day Builder the color of today and the marker
//         selectedDayBuilder: (context, date, events) => Container(
//           margin: const EdgeInsets.all(daysMargin),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             // color: Theme.of(context).primaryColorDark,
//             color: Colors.black54,
//             //
//           ),
//           child: SizedBox(
//               // fit: BoxFit.scaleDown,
//               child: Text(
//             // DateFormat.d(_localLang).format(date),
//             _getDayNum(date, _localLang),
//             style: TextStyle(color: Colors.white, fontSize: _daysFontSize),
//           )),
//         ),

//         /// today Day Builder the color of today and the marker
//         todayDayBuilder: (context, date, events) => Container(
//           margin: const EdgeInsets.all(daysMargin),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: _myColorSelection['header2'],
//           ),
//           child: SizedBox(
//               // fit: BoxFit.scaleDown,
//               child: Text(
//             // DateFormat.d(_localLang).format(date),
//             _getDayNum(date, _localLang),
//             style: TextStyle(color: Colors.black, fontSize: _daysFontSize),
//           )),
//         ),

//         ////// ###### Days outside of `startDay` - `endDay` builder day number size, color

//         // outsideDayBuilder: (context, date, events) => Container(
//         //   margin: const EdgeInsets.all(daysMargin),
//         //   alignment: Alignment.center,
//         //   child: SizedBox(
//         //       // fit: BoxFit.scaleDown,
//         //       child: Text(
//         //     // DateFormat.d(_localLang).format(date),
//         //     _getDayNum22(date, _localLang),
//         //     style: TextStyle(
//         //       color: Colors.blue,
//         //       fontSize: _daysFontSize,
//         //     ),
//         //   )),
//         // ),
//       ),

//       onDaySelected: _onDaySelected,
//       onVisibleDaysChanged: _onVisibleDaysChanged,
//       onCalendarCreated: _onCalendarCreated,
//       // onDayLongPressed: _onDayLongPressed,
//     );
//   }

//   static findMyIcon(myEvent, _sizeRate) {
//     MyIcon myIcon = MyIcon(_sizeRate);

//     if ((myEvent.runtimeType.toString()).contains('List')) {
//       myEvent = myEvent[0];
//     }

//     var myIcone;
//     if (myEvent['en_US'].contains("Minor")) {
//       myIcone = myIcon.minor;
//     } else if (myEvent['en_US'].contains("Major")) {
//       myIcone = myIcon.major;
//     } else if (myEvent['en_US'].contains("Mandaic")) {
//       myIcone = myIcon.firstMonth;
//     } else {
//       myIcone = myIcon.relig;
//     }
//     return myIcone;
//   }

//   Widget _buildEventList() {
//     // return ListView(
//     var myAlignment = MyAlignment.countryLanguage(_localLang);
//     return Column(
//       children: _selectedEvents
//           .map((event) => Container(
//                 constraints: BoxConstraints(
//                   minHeight: 30,
//                 ),
//                 width: 688,
//                 alignment: myAlignment,
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 0),
//                     borderRadius: BorderRadius.circular(8.0),
//                     color: _myColorSelection['minor']),
//                 margin:
//                     EdgeInsets.symmetric(horizontal: _marginHor, vertical: 4),
//                 child: Column(children: [
//                   _generateIconEvent(event),
//                 ]),
//               ))
//           .toList(),
//     );
//   }

//   Widget _generateIconEvent(event) {
//     MyIcon myIcon = MyIcon(_sizeRate);
//     var myAlignment = MyAlignment.countryLanguage(_localLang);
//     var myTextAlignment = MyAlignment.textAlig(_localLang);
//     var eventIcon;
//     var beforeEvent;
//     var afterEvent;

//     if (event.contains("Minor") ||
//         event.contains("سبک") ||
//         event.contains("خفیف")) {
//       eventIcon = myIcon.minor;
//     } else if (event.contains("Major") ||
//         event.contains("سنگین") ||
//         event.contains("ثقیل")) {
//       eventIcon = myIcon.major;
//     } else if (event.contains("First") ||
//         event.contains(" اول ماه") ||
//         event.contains("رأس")) {
//       eventIcon = myIcon.firstMonth;
//     } else if (event.contains("==")) {
//       eventIcon = myIcon.noon;
//     } else {
//       eventIcon = myIcon.relig;
//     }

//     if (_localLang == "en_US") {
//       beforeEvent = eventIcon;
//       afterEvent = myIcon.noon;
//       _listFontSize = 20;
//     } else {
//       beforeEvent = myIcon.noon;
//       afterEvent = eventIcon;
//       _listFontSize = 22;
//     }

//     return Row(
//       children: [
//         beforeEvent,
//         Flexible(
//             child: Container(
//           alignment: myAlignment,
//           child: Text(
//             event.toString(),
//             textAlign: myTextAlignment,
//             style: TextStyle(
//                 fontSize: _listFontSize * _sizeRate, color: Colors.black),
//           ),
//         )),
//         Text(" "),
//         afterEvent
//       ],
//     );
//   }

//   Widget languageSwitch(String dropdownValue) {
//     return DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//       icon: Icon(
//         // padding: EdgeInsets.zero,
//         Icons.language,
//         color: Colors.white,
//         size: 30,
//       ),
//       onChanged: (String newValue) {
//         setState(() {
//           dropdownValue = newValue;
//           // print(newValue);
//           var langList = {
//             'العربية': 'ar',
//             'فارسی': 'fa_IR',
//             'English': 'en_US'
//           };
//           _localLang = langList[newValue];
//           setLanguage(_localLang);
//         });
//         // _onDaySelected(DateTime.now(), [], [], clearMandaDate: true);
//         _onDaySelected(_selectedDay, _selectedEvent, _selectedHoliday);
//       },
//       items: <String>['English', 'فارسی', 'العربية']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(
//             value,
//             style: TextStyle(fontSize: _longFontSize, color: Colors.black),
//           ),
//         );
//       }).toList(),
//     ));
//   }

//   Widget topIconInfo(BuildContext context, String localLang) {
//     return Container(
//         child: FittedBox(
//             fit: BoxFit.contain,
//             child: Container(
//               child: Row(
//                 children: [
//                   // mulwashal(context, localLang),
//                   FittedBox(
//                     child: Row(
//                       children: [
//                         languageSwitch('English'),
//                         refresh(context, localLang),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )));
//   }

//   _getDayNum(DateTime date, locale) {
//     var day;
//     if (locale != 'en_US') {
//       date = _changeDateOrder(date);
//     }

//     // print(date);
//     day = DateFormat.d(locale).format(date);
//     // if (date.month == 11 || date.month == 1) {
//     //   day = "";
//     // }
//     return day;
//   }

//   _getDayHeader(DateTime date, locale) {
//     var day;
//     if (locale != 'en_US') {
//       date = _changeDateOrder(date);
//     }

//     if (locale == 'fa_IR') {
//       var dayFa = DateFormat.EEEE(locale).format(date);
//       day = MandaEqu.changeDayFormate(dayFa);
//     } else {
//       day = DateFormat.E(locale).format(date);
//     }
//     // var day = DateFormat.EEEE(locale).format(date).substring(0, 4);
//     return day;
//   }

//   _getMonthHeader(date, locale) {
//     var day;

//     if (locale == 'ar') {
//       var monthEn = DateFormat.MMMM('en_US').format(date);
//       var yearAr = DateFormat.y(locale).format(date);
//       var monthAr = MandaEqu.changeMonthFormate(monthEn);
//       day = '$monthAr $yearAr';
//     } else {
//       day = DateFormat.yMMMM(locale).format(date);
//     }
//     // var day = DateFormat.EEEE(locale).format(date).substring(0, 4);
//     return day;
//   }

//   // changeHeaderOrderRTL(DateTime date) {
//   //   var day = DateFormat.E("en_US").format(date);
//   //   var numDayOdWeek = _getNumDayOdWeek(day);

//   //   date = DateTime(date.year, date.month, date.day + numDayOdWeek, 0, 0);
//   //   return date;
//   // }

//   // changeDayOrderRTL(DateTime date) {
//   //   var day = DateFormat.E("en_US").format(date);
//   //   var numDayOdWeek = _getNumDayOdWeek(day);

//   //   date = DateTime(date.year, date.month, date.day + numDayOdWeek, 0, 0);
//   //   return date;
//   // }

//   _changeDateOrder(DateTime date) {
//     var day = DateFormat.E("en_US").format(date);
//     var numDayOdWeek = _getNumDayOdWeek(day);

//     date = DateTime(date.year, date.month, date.day + numDayOdWeek, 0, 0);
//     return date;
//   }

//   _getNumDayOdWeek(day) {
//     Map daysWeek = {
//       "Sun": 6,
//       "Mon": 4,
//       "Tue": 2,
//       "Wed": 0,
//       "Thu": -2,
//       "Fri": -4,
//       "Sat": -6,
//     };
//     return daysWeek[day];
//   }
// }
