import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'local_number.dart';
import 'main.dart';
import 'manda_equivalent.dart';
import 'manda_events.dart';
import 'manda_holidays.dart';
import 'manda_mulwasha.dart';
import 'manda_solor_event.dart';
import 'manda_top_icon_mulwasha.dart';
import 'my_alignment.dart';
import 'my_color.dart';
import 'my_icon_events.dart';

class MandaDisplayHolyDays extends StatelessWidget {
  String localLang;
  // var events;
  // TextEditingController _controller;
  MandaDisplayHolyDays(localLang) {
    this.localLang = localLang;
    // this.events = events;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Religious Occasion',
      home: DisplayEventsPage(localLang: localLang),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DisplayEventsPage extends StatefulWidget {
  DisplayEventsPage({Key key, this.localLang}) : super(key: key);

  final String localLang;

  // var events;

  @override
  MandaHolyDaysDisplay createState() => MandaHolyDaysDisplay(localLang);
}
// ##############

class MandaHolyDaysDisplay extends State<DisplayEventsPage> {
  String localLang;
  int _oldSelectedYear = 0;
  SingingYear _convert = SingingYear.geo;
  int _controllerYY;
  int _sizeRate = 1;

  int _dropdownListNum;

  double _cardFontSize = 18.0;
  double _fontSize = 18.0;
  double _paddingTop = 6.0;
  double _iconDropSize = 50;
  double _displaySize;
  double _divecWidth;
  String myYearValue = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _listOfEventsForYear;
  Map _myColorSelection = Mycolor.selection();

  MandaHolyDaysDisplay(localLang) {
    this.localLang = localLang;
  }

  @override
  Widget build(BuildContext context) {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    _divecWidth = MediaQuery.of(context).size.width;
    _displaySize = _divecWidth - 8;
    if (_divecWidth > 700) {
      _fontSize = 30.0;
      _cardFontSize = 25.0;
      _displaySize = 700;
      _sizeRate = 2;

      _paddingTop = 20.0;
    } else {
      _fontSize = 20.0;
      _cardFontSize = 18.0;
      _sizeRate = 1;

      _paddingTop = 15.0;
    }
    return Scaffold(
      appBar: AppBar(
        leading: backToMainPage(context),
        backgroundColor: _myColorSelection['header'],
        title: Text(mulwashaLabel.mandaYearEventsLable[0],
            style: TextStyle(color: Colors.black, fontSize: _cardFontSize)),
      ),
      body: Center(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              child: ListView(children: [
                Text(
                  mulwashaLabel.mandaYearEventsLable[1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: _cardFontSize - 6),
                ),
                Container(
                  width: _displaySize,
                  child: Column(
                    children: [
                      SizedBox(
                          width: _displaySize,
                          child: Form(
                              key: _formKey,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                maxLength: 4,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                validator: (value) =>
                                    validateYY(value, mulwashaLabel.yearMaxMin),
                                style: TextStyle(
                                    fontSize: _fontSize, color: Colors.black),
                                decoration: InputDecoration(
                                    labelText: mulwashaLabel.dateLabel[0],
                                    labelStyle: TextStyle(
                                      fontSize: _fontSize,
                                    ),
                                    hintText: mulwashaLabel.dateLabel[0],
                                    icon: Icon(
                                      Icons.date_range,
                                      size: _fontSize,
                                    )),
                              ))),
                      Padding(padding: EdgeInsets.only(top: _paddingTop)),
                      radioButDate(context),
                      Padding(padding: EdgeInsets.only(top: 25.0 * _sizeRate)),
                      yearEventsDrop(context),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 30.0 * _sizeRate)),
                _buildEventList(context, _listOfEventsForYear),
                _listOfEventsForYear == null
                    ? SizedBox(height: 138.0 * _sizeRate)
                    : SizedBox(height: 38.0),
                RaisedButton(
                  color: Colors.brown[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MandaeanCalendar()));
                  },
                  child: Text(mulwashaLabel.backBtn,
                      style: TextStyle(
                          color: Colors.black, fontSize: _cardFontSize)),
                ),
              ]))),
    );
  }

  Widget radioButDate(BuildContext context) {
    var chooseYear = MandaEqu.chooseYear(localLang);
    double radioSpace = _displaySize - 400;
    return Container(
        width: _displaySize,
        child: Stack(
          children: [
            Positioned(
              child: Row(children: <Widget>[
                Radio(
                    value: SingingYear.geo,
                    groupValue: _convert,
                    onChanged: (SingingYear value) {
                      setState(() {
                        _convert = value;
                      });
                    }),
                Text(
                  chooseYear[0],
                  style: TextStyle(color: Colors.black, fontSize: _fontSize),
                ),
              ]),
            ),
            Positioned(
              right: 10,
              child: Row(children: <Widget>[
                Radio(
                    value: SingingYear.sol,
                    groupValue: _convert,
                    onChanged: (SingingYear value) {
                      setState(() {
                        _convert = value;
                      });
                    }),
                Text(
                  chooseYear[1],
                  style: TextStyle(color: Colors.black, fontSize: _fontSize),
                ),
              ]),
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Text(""),
            // ),
          ],
        ));
  }

  static sortDate(List<DateTime> newProducts) {
    // print('before: $newProducts');
    newProducts.sort((a, b) => a.compareTo(b));
    return newProducts;
    // print('after: $newProducts');
  }

  String selectedEvent;
  @override
  Widget yearEventsDrop(BuildContext context) {
    // MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);

    // List<String> dropdownList;
    // dropdownList = mulwashaLabel.mandaYearEvents;
    List<String> dropdownList = MandaEqu.mandaYearEvents(localLang);

    String hintText = dropdownList[0];
    dropdownList.removeRange(0, 1);
    // var myAlignment = mulwashaLabel.myAlignment;
    var myAlignment = MandaEqu.myAlignment(localLang);
    // FormState form = _formKey.currentState;
    validateYear();
    return DropdownButtonHideUnderline(
        child: SizedBox(
            width: _displaySize,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: new DropdownButton<String>(
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: _iconDropSize,
                  // dropdownColor: Colors.green,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: _fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  hint: Container(
                    alignment: myAlignment,
                    child: new Text(hintText,
                        style: TextStyle(
                            color: Colors.black45, fontSize: _fontSize)),
                  ),

                  value: selectedEvent == null ? null : selectedEvent,
                  items: dropdownList.map((String value) {
                    return new DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          alignment: myAlignment,
                          child: new Text(value,
                              style: TextStyle(
                                  color: Colors.black, fontSize: _fontSize)),
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      selectedEvent = value;
                      _dropdownListNum = dropdownList.indexOf(value);
                    });
                  },
                ))));
  }

  Widget _buildEventList(BuildContext context, var events) {
    var myAlignment = MyAlignment.countryLanguage(localLang);
    var myTextAlignment = MyAlignment.textAlig(localLang);
    var selectedEvents = [];
    var myColor;
    MyIcon myIcon = MyIcon(_sizeRate);
    var beforeIcon;
    var afterIcon;

    if (_dropdownListNum != null && events != null) {
      var myEventIcon = {
        0: myIcon.relig,
        1: myIcon.firstMonth,
        2: myIcon.minor,
        3: myIcon.major
      };

      if (localLang == "en_US") {
        beforeIcon = myEventIcon[_dropdownListNum];
        afterIcon = myIcon.noon;
      } else {
        beforeIcon = myIcon.noon;
        afterIcon = myEventIcon[_dropdownListNum];
      }

      if (events.length == 3) {
        selectedEvents = events;
        myColor = Colors.red[800];
        afterIcon = myIcon.error;
        beforeIcon = myIcon.error;
      } else {
        selectedEvents = events[_dropdownListNum];
      }
    }
    // double widthBoxSize = 45;
    // if (_divecWidth < 321) {
    //   widthBoxSize = 70;
    // }
    return Column(
      children: selectedEvents
          .map((event) => Container(
                // height: widthBoxSize * _sizeRate,
                constraints: BoxConstraints(
                  minHeight: 30,
                ),
                width: _displaySize,
                alignment: myAlignment,
                decoration: BoxDecoration(
                  border: Border.all(width: 0),
                  borderRadius: BorderRadius.circular(12.0),
                  color: myColor,
                ),
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: Column(
                  children: [
                    Row(
                      children: [
                        beforeIcon,
                        Flexible(
                            child: Container(
                          alignment: myAlignment,
                          child: Text(
                            event.toString(),
                            textAlign: myTextAlignment,
                            style: TextStyle(
                                fontSize: _fontSize, color: Colors.black),
                          ),
                        )),
                        afterIcon
                      ],
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget backToMainPage(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: _cardFontSize,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MandaeanCalendar()));
        });
  }

  String validateYY(String value, List yearMaxMin) {
    int yearMin = 1300;
    int yearMax = 1500;
    if (_convert == SingingYear.geo) {
      yearMin = 1921;
      yearMax = 2121;
    }
    if (value.isNotEmpty) {
      myYearValue = value;
    }

    if (myYearValue.isNotEmpty) {
      int newValue = int.parse(myYearValue);

      if ((newValue == null) || (newValue < yearMin) || (newValue > yearMax)) {
        return '$yearMin-$yearMax';
      } else {
        _controllerYY = newValue;
      }
    } else {
      return '$yearMin-$yearMax';
    }
    return null;
  }

  void validateYear() {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);

    final FormState form = _formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        if (_oldSelectedYear != _controllerYY) {
          _oldSelectedYear = _controllerYY;
          if (_convert == SingingYear.geo) {
            _listOfEventsForYear =
                createListEventsforYearGeo(_controllerYY, localLang);
          } else {
            _listOfEventsForYear =
                createListEventsforYearSol(_controllerYY, localLang);
          }
        }
      } else {
        String convertMsg;
        String errSelect = MandaEqu.selectOccasion(localLang);
        if (_convert == SingingYear.geo) {
          convertMsg = mulwashaLabel.alertMsg['g'];
        } else {
          convertMsg = mulwashaLabel.alertMsg['s'];
        }
        var convertMsgList = convertMsg.split("\n");
        // print(convertMsgList[0]);
        _listOfEventsForYear = [
          mulwashaLabel.alertTtitle,
          errSelect,
          convertMsgList[0]
        ];
        // setState(() => _autoValidate = true);
      }
    }
  }

  static createListEventsforYearGeo(selectedYear, localLang) {
    var oneYearEvents = generateAllYearEventGeo(selectedYear);
    var listOfEventsForYear = generateListEventsforYear(
        oneYearEvents[0], oneYearEvents[1], localLang, false);
    return listOfEventsForYear;
  }

  static generateAllYearEventGeo(selectedYear) {
    DateTime selectedDay = DateTime(selectedYear, 1, 1);
    // var mandaFirstOfMonth = MandaHolidays.holidays(selectedDay);
    var mandaFirstOfMonth =
        MandaFirstDayOfMonthBuilder(selectedYear).eventsForWholeYear;

    // MandaPanja panjaDate = MandaPanja(selectedDay.year);
    // var events = MandaEvents.mandaEventsForYear(panjaDate);
    var events = MandaEventssBuilder(selectedDay.year).wholeYear;

    return [events, mandaFirstOfMonth];
  }

  static createListEventsforYearSol(selectedYear, localLang) {
    var oneYearEvents = generateAllYearEventSol(selectedYear);
    var listOfEventsForYear = generateListEventsforYear(
        oneYearEvents[0], oneYearEvents[1], localLang, true);
    return listOfEventsForYear;
  }

  static generateAllYearEventSol(selectedYear) {
    var solrEvent = SorlEvents.generateEventSol(selectedYear);
    return [solrEvent[0], solrEvent[1]];
  }

  static generateListEventsforYear(
      Map<DateTime, List> events, Map holidays, String localLang, isSolr) {
    // print("************* Whole year events loaded *************");
    var _religiousEvents = [];
    var _firstMonthEvents = [];
    var _minorEvents = [];
    var _majorEvents = [];

    var dateEvents = events.keys.toList();
    var dateBeginOfMonth = holidays.keys.toList();

    dateEvents = sortDate(dateEvents);
    dateBeginOfMonth = sortDate(dateBeginOfMonth);

    dateBeginOfMonth.forEach((date) {
      String formatted = findDateFormate(date, isSolr, localLang);

      Map selectedEvent = holidays[date][0];
      _firstMonthEvents.add(formatted + " " + selectedEvent[localLang]);
    });

    dateEvents.forEach((date) {
      String formatted = findDateFormate(date, isSolr, localLang);

      List selectedEvents = events[date];
      selectedEvents.forEach((selectedEvent) {
        if (selectedEvent.runtimeType.toString().contains("List")) {
          selectedEvent = selectedEvent[0];
        }
        if (selectedEvent['en_US'].contains("Major")) {
          _majorEvents.add(formatted + "  " + selectedEvent[localLang]);
        } else if (selectedEvent['en_US'].contains("Minor")) {
          _minorEvents.add(formatted + "  " + selectedEvent[localLang]);
        } else {
          _religiousEvents
              .add(formatted + "  " + selectedEvent[localLang].trim() + " ");
        }
      });
    });
    // assert(_religiousEvents.length +
    //         _firstMonthEvents.length +
    //         _minorEvents.length +
    //         _majorEvents.length ==
    //     58);
    return [_religiousEvents, _firstMonthEvents, _minorEvents, _majorEvents];
  }

  static findDateFormate(date, isSolr, localLang) {
    String formatted;

    if (isSolr) {
      Gregorian g = Gregorian(date.year, date.month, date.day);
      Jalali g2j = g.toJalali();
      final dateJ = g2j.formatter;
      // formatted = g2j.toString();
      formatted = '${dateJ.yyyy}/${dateJ.mm}/${dateJ.dd}';
    } else {
      final DateFormat formatter = DateFormat('yyyy/MM/dd');
      formatted = formatter.format(date);
    }
    formatted = LocalNum.convertEntoFa(formatted, localLang);

    return formatted;
  }
}
