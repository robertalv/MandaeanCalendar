import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'local_number.dart';
import 'main.dart';
import 'manda_date.dart';
import 'manda_equivalent.dart';
import 'manda_formate.dart';
import 'manda_mulwasha.dart';
import 'my_alignment.dart';
import 'my_color.dart';

enum SingingCharacter { male, female }
enum OclockDeclaration { at, between }
enum SingingYear { sol, geo }
enum InLineHelp { mother, month, time }

class MandaMulwashal extends StatelessWidget {
  String localLang;
  // TextEditingController _controller;
  MandaMulwashal(localLang) {
    this.localLang = localLang;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melvashe',
      home: MyMulwashalPage(localLang: localLang),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyMulwashalPage extends StatefulWidget {
  MyMulwashalPage({Key key, this.localLang}) : super(key: key);

  final String localLang;

  @override
  _MyMulwashalPageState createState() => _MyMulwashalPageState(localLang);
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyMulwashalPageState extends State<MyMulwashalPage> {
  SingingCharacter _character = SingingCharacter.female;
  OclockDeclaration _oclock = OclockDeclaration.at;
  SingingYear _convert = SingingYear.geo;
  Map _myColorSelection = MyColor.selection();
  double _displaySize;
  double _fontSize = 18.0;
  double _paddingTop = 6.0;
  double _iconDropSize = 18;
  double _iconHelpSize = 25;
  double _cardFontSize = 20.0;
  double _resetCardFontSize;
  double _timeWidthCon;
  double _helpWidgetSize;
  double _labelWidgetSize;
  double _dropWidgetSize;
  double _dropFontSize = 24;
  double _margin = 0;

  _MyMulwashalPageState(localLang) {
    this.localLang = localLang;
  }
  String localLang;
  int _controllerYY;
  int _controllerMM;
  int _controllerDD;
  String _dateG = "";
  String _dateS = "";
  String _dateM = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _motherM;
  int _monthM;
  int _timeM;

  String _localLang;

  void validateAndConvert() {
    _localLang = localLang;
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);

    final FormState form = _formKey.currentState;
    if (form.validate()) {
      printMandaDate(context);
    } else {
      String convertMsg;
      if (_convert == SingingYear.geo) {
        convertMsg = mulwashaLabel.alertMsg['g'];
      } else {
        convertMsg = mulwashaLabel.alertMsg['s'];
      }

      // showAlertDialog(
      //     context, localLang, mulwashaLabel.alertTtitle, convertMsg);

      _resetCardFontSize = _cardFontSize;
      _cardFontSize = _cardFontSize + 10;

      _showMyDialog(context, localLang, mulwashaLabel.alertTtitle, convertMsg);
    }
  }

  void printMandaDate(BuildContext context) {
    var seletedSol;
    DateTime seletedGeo;

    if (_convert == SingingYear.geo) {
      seletedGeo = DateTime(_controllerYY, _controllerMM, _controllerDD);
      seletedSol = MandaDateBuilder.jalaliDayForSelectedDay(seletedGeo);
    } else {
      seletedSol = jalaliDate(_controllerYY, _controllerMM, _controllerDD);
      Gregorian covertJalaToGeo = seletedSol.toGregorian();
      seletedGeo = DateTime(
          covertJalaToGeo.year, covertJalaToGeo.month, covertJalaToGeo.day);
    }

    var mandaDate =
        MandaFormatedDateBuilder.fullMandaDay(seletedGeo, _localLang);
    DateFormat formatter;
    if (_localLang == 'ar') {
      formatter = DateFormat('E, dd/ MM/ yyyy', _localLang);
    } else {
      formatter = DateFormat('yyyy/ MM/ dd, E', _localLang);
    }

    String seletedGeoFormatted = formatter.format(seletedGeo);

    final f = seletedSol.formatter;

    String seletedSolFormatted = '${f.wN} ,${f.d} ,${f.m} ,${f.yyyy}';

    setState(() {
      _dateG = seletedGeoFormatted;
      _dateS = seletedSolFormatted;
      // _dateM = mandaDate.fullMandaDay[_localLang];
      _dateM = mandaDate;
    });
  }

  jalaliDate(year, month, day) {
    int dayOnMonth;
    Jalali j;
    if (month <= 6) {
      dayOnMonth = 31;
    } else if (month <= 11) {
      dayOnMonth = 30;
    } else {
      // month == 12
      Jalali j = Jalali(year, 1, 1);
      dayOnMonth = j.isLeapYear() ? 30 : 29;
    }

    if (day > dayOnMonth) {
      int diff = day - dayOnMonth;
      j = Jalali(year, month, dayOnMonth).addDays(diff);
    } else {
      j = Jalali(year, month, day);
    }
    return j;
  }

  @override
  Widget build(BuildContext context) {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    double _divecWidth = MediaQuery.of(context).size.width;

    // _displaySize = 250;
    double extraSpeace = 0;
    if (_divecWidth > 700) {
      _paddingTop = 12.0;
      _cardFontSize = 30.0;
      _fontSize = 30.0;
      _iconDropSize = 50;
      _iconHelpSize = 35;
      _displaySize = 700;
      // _timeWidthCon = 200.0;
      _dropFontSize = 35;
      extraSpeace = 5;
      _margin = (_divecWidth - 700) / 2;
    } else {
      _displaySize = _divecWidth - 8;
      _paddingTop = 6.0;
      _cardFontSize = 20.0;
      _fontSize = 20.0;
      _iconDropSize = 20;
      _iconHelpSize = 20;
      // _timeWidthCon = _displaySize / 3 - 30;
      _dropFontSize = 25;
      _margin = 0;
    }
    _helpWidgetSize = 10;
    _labelWidgetSize = (_displaySize - 20) / 2 - 45 - extraSpeace;
    _dropWidgetSize = _labelWidgetSize + 90 - extraSpeace;

    return Scaffold(
        appBar: AppBar(
          leading: backToMainPage(context),
          centerTitle: true,
          backgroundColor: _myColorSelection['header'],
          title: Text(mulwashaLabel.title,
              style: TextStyle(color: Colors.black, fontSize: _cardFontSize)),
        ),
        body: Center(
          child: ListView(
            children: [
              Center(
                child: Container(
                  // width: _displaySize,
                  margin:
                      EdgeInsets.symmetric(horizontal: _margin, vertical: 0),
                  child: Column(
                    children: [
                      Text(
                        MandaEqu.donotUseMelvash(localLang),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red[900],
                            fontSize: _cardFontSize - 5),
                        // )
                      ),

                      radioButGender(context),
                      Padding(padding: EdgeInsets.only(top: _paddingTop)),
                      motherLine(context, mulwashaLabel),
                      Padding(padding: EdgeInsets.only(top: _paddingTop)),
                      monthLine(context, mulwashaLabel),
                      Padding(padding: EdgeInsets.only(top: _paddingTop)),
                      timeLine(context, mulwashaLabel),
                      Padding(padding: EdgeInsets.only(top: _paddingTop)),
                      findMulwasha(context),

                      /////////############# Second Part start Here Convert Date to Manda Date
                      Padding(
                        padding: EdgeInsets.only(top: _paddingTop),
                        child: Container(
                          height: 1.0,
                          width: _displaySize + 150,
                          color: Colors.black,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: _paddingTop)),
                      Text(
                        mulwashaLabel.convertDate[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red[900],
                            fontSize: _cardFontSize - 7),
                      ),
                      //// ## Convert Date to Manda Date
                      convertToMandaDate(context),
                    ],
                  ),
                ),
              ),
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
                child: Text(
                  mulwashaLabel.backBtn,
                  style: TextStyle(
                    fontSize: _cardFontSize,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // #################

  Widget motherLine(BuildContext context, var mulwashaLabel) {
    return Row(
      children: [
        Row(
          children: [
            SizedBox(
              width: _labelWidgetSize,
              // height: boxHight,
              child: Text(
                mulwashaLabel.motherLabel,
                style: TextStyle(color: Colors.black, fontSize: _fontSize),
              ),
            ),

            SizedBox(
                width: _dropWidgetSize,
                child: FittedBox(
                  child: motherMulwashaDrop(context),
                )),
            SizedBox(
              width: _helpWidgetSize + 15,
              child: IconButton(
                icon: Icon(
                  Icons.help,
                  size: _iconHelpSize,
                  color: Colors.blue,
                ),
                onPressed: () =>
                    mulwashaInLineHelp(context, InLineHelp.mother, localLang),
              ),
            ),
            // SizedBox(
            //   width: 18,
            // ),
          ],
        )
      ],
    );
  }

  Widget monthLine(BuildContext context, var mulwashaLabel) {
    return Row(
      children: [
        Row(
          children: [
            SizedBox(
              width: _labelWidgetSize,
              // height: boxHight,
              child: Text(
                mulwashaLabel.birthMonthLabel,
                style: TextStyle(color: Colors.black, fontSize: _fontSize),
              ),
            ),
            SizedBox(
                width: _dropWidgetSize,
                child: FittedBox(
                  child: monthMulwashaDrop(context),
                )),
            SizedBox(
              width: _helpWidgetSize + 15,
              child: IconButton(
                icon: Icon(
                  Icons.help,
                  size: _iconHelpSize,
                  color: Colors.blue,
                ),
                onPressed: () =>
                    mulwashaInLineHelp(context, InLineHelp.month, localLang),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget timeLine(BuildContext context, var mulwashaLabel) {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    // var dropListData = mulwashaLabel.monthName;
    var dropListDataAtHours = mulwashaLabel.birthTime;
    var dropListDataAtAfter = mulwashaLabel.birthTimeSelector[0]['atAfter'];
    var beforeMsg = mulwashaLabel.birthTimeSelector[0]['before'];
    int beforeTime;
    String textBeforeTime = "";
    String textBeforeMsg = "";
    String timeText = mulwashaLabel.birthTimeLabel;
    if (dropListDataAtAfter.indexOf(_atAfterName) == 1 &&
        _birthTimeSelectedName != null) {
      timeText = mulwashaLabel.birthTimeLabel;
      timeText = "\n" + timeText;
      var parts = _birthTimeSelectedName.split(':');

      // var newString = parts[0];
      var newString = LocalNum.convertFatoEn(parts[0], localLang);
      beforeTime = int.parse(newString);
      beforeTime = beforeTime + 2;
      if (beforeTime > 24) {
        beforeTime = beforeTime - 24;
      }
      textBeforeTime = " " + beforeTime.toString() + ':00  ';
      textBeforeTime = LocalNum.convertEntoFaAr(textBeforeTime, localLang);

      textBeforeMsg = beforeMsg;
    }
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: _labelWidgetSize,
              child: Text(
                timeText,
                style: TextStyle(color: Colors.black, fontSize: _fontSize),
              ),
            ),
            SizedBox(
              width: _dropWidgetSize,
              child: FittedBox(
                  child: Row(
                children: [
                  birthAfterDrop(context, dropListDataAtAfter),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  birthTimeDrop(context, dropListDataAtHours),
                ],
              )),
            ),
            SizedBox(
              width: _helpWidgetSize + 15,
              child: IconButton(
                icon: Icon(
                  Icons.help,
                  size: _iconHelpSize,
                  color: Colors.blue,
                ),
                onPressed: () =>
                    mulwashaInLineHelp(context, InLineHelp.time, localLang),
              ),
            ),
          ],
        ),
        textBeforeMsg.isNotEmpty
            ? secondTimeLine(context, textBeforeMsg, textBeforeTime)
            : Padding(padding: EdgeInsets.only(top: _paddingTop))
      ],
    );
  }

  @override
  Widget secondTimeLine(
      BuildContext context, String textBeforeMsg, String textBeforeTime) {
    return Row(
      children: [
        SizedBox(
          width: _labelWidgetSize,
          // height: boxHight,
          child: Text(""),
        ),
        SizedBox(
            width: _dropWidgetSize + _helpWidgetSize,
            // height: boxHight,
            child: FittedBox(
              child: Row(
                children: [
                  Card(
                    color: Colors.grey[200],
                    child: Text(
                      textBeforeMsg,
                      style: TextStyle(
                          color: Colors.black, fontSize: _dropFontSize),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 4)),
                  Card(
                    color: Colors.grey[200],
                    child: Text(
                      textBeforeTime,
                      style: TextStyle(
                          color: Colors.black, fontSize: _dropFontSize),
                    ),
                  ),
                ],
              ),
            )),
        SizedBox(
          width: 0,
          // height: boxHight,
          child: Text(""),
        ),
      ],
    );
  }

  Widget radioButGender(BuildContext context) {
    String male = MandaEqu.mulwashaMale(localLang);
    String female = MandaEqu.mulwashaFemale(localLang);
    return Container(
        width: _displaySize,
        child: Stack(
          children: [
            Positioned(
              child: Row(children: <Widget>[
                Radio(
                    value: SingingCharacter.female,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                      });
                    }),
                Text(
                  female,
                  style: TextStyle(color: Colors.black, fontSize: _fontSize),
                ),
              ]),
            ),
            Positioned(
              right: 10,
              child: Row(children: <Widget>[
                Radio(
                    value: SingingCharacter.male,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                      });
                    }),
                Text(
                  male,
                  style: TextStyle(color: Colors.black, fontSize: _fontSize),
                ),
              ]),
            ),
          ],
        ));
  }

  // #################
  // String motherValue = "----";
  String motherValue;
  @override
  Widget motherMulwashaDrop(BuildContext context) {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    var dropListData = mulwashaLabel.mother;
    return DropdownButtonHideUnderline(
        child: FittedBox(
            fit: BoxFit.scaleDown,
            // width: _dropWidgetSize,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<String>(
                  value: motherValue == null ? null : motherValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: _iconDropSize,
                  elevation: 16,
                  style:
                      TextStyle(color: Colors.black, fontSize: _dropFontSize),
                  onChanged: (String newValue) {
                    setState(() {
                      motherValue = newValue;
                      _motherM = dropListData.indexOf(newValue) + 1;
                    });
                  },
                  items: dropListData
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ))));
  }

  // #################
  String birthValue;
  @override
  Widget monthMulwashaDrop(BuildContext context) {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    var dropListData = mulwashaLabel.monthName;
    return DropdownButtonHideUnderline(
        child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<String>(
                  value: birthValue == null ? null : birthValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: _iconDropSize,
                  elevation: 16,
                  style:
                      TextStyle(color: Colors.black, fontSize: _dropFontSize),
                  onChanged: (String newValue) {
                    setState(() {
                      birthValue = newValue;
                      _monthM = dropListData.indexOf(newValue) + 1;
                    });
                  },
                  items: dropListData
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ))));
  }

  // // ################# New
  String _atAfterName;
  int _atAfterValue;
  @override
  Widget birthAfterDrop(BuildContext context, var dropListData) {
    // MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    // var dropListData = mulwashaLabel.monthName;
    return DropdownButtonHideUnderline(
        child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<String>(
                  value: _atAfterName == null ? null : _atAfterName,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: _iconDropSize,
                  elevation: 16,
                  style:
                      TextStyle(color: Colors.black, fontSize: _dropFontSize),
                  onChanged: (String newValue) {
                    setState(() {
                      _atAfterName = newValue;
                      _atAfterValue = dropListData.indexOf(newValue) + 1;
                    });
                  },
                  items: dropListData
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ))));
  }

  // #################
  String _birthTimeSelectedName;
  int _birthTimeSelectedValue;
  @override
  Widget birthTimeDrop(BuildContext context, var dropListData) {
    return DropdownButtonHideUnderline(
        child: FittedBox(
            // width: (_dropWidgetSize - 80) / 2,
            fit: BoxFit.scaleDown,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<String>(
                  value: _birthTimeSelectedName == null
                      ? null
                      : _birthTimeSelectedName,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: _iconDropSize,
                  elevation: 16,
                  style:
                      TextStyle(color: Colors.black, fontSize: _dropFontSize),
                  onChanged: (String newValue) {
                    setState(() {
                      _birthTimeSelectedName = newValue;
                      _birthTimeSelectedValue =
                          dropListData.indexOf(newValue) + 1;
                    });
                  },
                  items: dropListData
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ))));
  }

// #################

  String validateYY(String value, List yearMaxMin) {
    int yearMin = 1300;
    int yearMax = 1500;
    if (_convert == SingingYear.geo) {
      yearMin = 1921;
      yearMax = 2121;
    }
    if (value.isNotEmpty) {
      int newValue = int.parse(value);

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

  String validateMM(String value) {
    if (value.isNotEmpty) {
      int newValue = int.parse(value);

      if ((newValue == null) || (newValue > 12) || (newValue == 0)) {
        return '1-12';
      } else {
        _controllerMM = newValue;
      }
    } else {
      return '1-12';
    }
    return null;
  }

  String validateDD(String value) {
    if (value.isNotEmpty) {
      int newValue = int.parse(value);

      if ((newValue == null) || (newValue > 31) || (newValue == 0)) {
        return '1-31';
      } else {
        _controllerDD = newValue;
      }
    } else {
      return '1-31';
    }
    return null;
  }

// #################
  @override
  Widget findMulwasha(BuildContext context) {
    // print(_character);
    // print(_motherM);
    // print(_monthM);
    // print(_timeM);

    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    return Column(
      children: [
        RaisedButton(
          color: Colors.brown[100],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: BorderSide(color: Colors.black)),
          onPressed: defineMulwasha,
          child: Text(
            mulwashaLabel.findBut,
            style: TextStyle(fontSize: _cardFontSize),
          ),
        )
      ],
    );
  }

  void defineMulwasha() {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    String title;
    String msg;
    // int sahmaTime;
    // int sahmMonth;
    // int talaaInt;
    // int childMulwasha;
    if (_motherM == null ||
            // _motherM == 14 ||
            _monthM == null ||
            // _monthM == 0 ||
            _atAfterValue == null ||
            // _atAfterValue == 0 ||
            _birthTimeSelectedValue == null
        // ||
        // _birthTimeSelectedValue == 0
        ) {
      title = "";
      msg = mulwashaLabel.mulwashalError;
    } else {
      if (_character == SingingCharacter.female) {
        // print(mulwashaLabel.boyGirl);
        title = mulwashaLabel.boyGirl[3];
      } else {
        // print(mulwashaLabel.boyGirl);
        title = mulwashaLabel.boyGirl[2];
      }

      int sahmBirthTime = findSahmTime();
      int sahmBirthMonth = fimdSahmMonth();
      int childTaleaNum = findChildTalea(sahmBirthTime, sahmBirthMonth);
      String childTaleaName =
          findChildTaleaName(childTaleaNum, mulwashaLabel.childTalea);
      int childMulwashNum = findChildMulwashNum(childTaleaNum);
      String childMulwashName =
          findChildMulwashName(childMulwashNum, mulwashaLabel);

      // sahmaMonth = _monthM + 1;
      // talaaInt = sahmaTime + sahmaMonth - 1;
      // talaaInt = roundTo(talaaInt);
      // childMulwasha = talaaInt - _motherM;
      // title = "Melvasha";
      // print('childTaleaName $childTaleaName');
      // print('sahmBirthTime $sahmBirthTime');
      // print('sahmBirthMonth $sahmBirthMonth');
      // print('childTaleaNum $childTaleaNum');
      // print('childMulwashNum $childMulwashNum');
      // print('childMulwashName $childMulwashName');
      // print('End ******* End');
      msg = childTaleaName + "\n\n" + childMulwashName;
    }

    // print("_character $_character");
    // print("_motherM $_motherM");
    // print('_monthM $_monthM');
    _resetCardFontSize = _cardFontSize;
    _cardFontSize = _cardFontSize + 10;
    // showAlertDialog(context, localLang, title, msg);
    _showMyDialog(context, localLang, title, msg);

    // findMulwashaTest(context);
  }

  roundTo(int num) {
    int indexR = num ~/ 12;
    int newNum = num - 12 * indexR;
    if (newNum < 0) {
      newNum = newNum + 12;
    }
    if (newNum == 0) {
      newNum = 12;
    }
    return newNum;
  }

  /// Sahm Time is number that get from the child birth time. The 24 hours a
  /// day divided into 2 hours period and that make 12 Saham. The 1st Sahm start
  /// from 6AM to 8AM and 2nd for 8AM-10AM and go on till 12 for 4AM-6AM.
  /// Ex. If the child birth time is between 6AM to 8AM then Sahm will be 1.
  /// Ex. If the child birth time is between 8AM to 10AM then Sahm will be 2.
  /// But if the child birth at excetlly time like 8:00 then if boy will be 2
  /// and If gril will be 1 (go one back).
  /// at 6AM if boy 1 if girl 12.
  findSahmTime() {
    int sahmBirthTime;
    // print("selectedAtAfter $_atAfterValue");
    // print("selectedTime $_birthTimeSelectedValue");
    sahmBirthTime = _birthTimeSelectedValue;
    if (_atAfterValue == 1 && _character == SingingCharacter.female) {
      sahmBirthTime = _birthTimeSelectedValue - 1;
      if (sahmBirthTime == 0) {
        sahmBirthTime = 12;
      }
    }
    assert(sahmBirthTime < 13);
    assert(sahmBirthTime > 0);
    return sahmBirthTime;
  }

  /// Sahm Month is number that get from the child birth month. There are 12 Saham
  /// for each 12 months. The 1st Sahm start on Embra and go on to 12 for Nuna
  /// For Panja The first 2.5 days go to Shombolta and second 2.5 days go to
  /// Qaina. That's mean 1st, 2nd days and 3rd day until 6PM fo Paja goto Shombolta.

  fimdSahmMonth() {
    int sahmBirthMonth;
    Map birthPaja = {7: 6, 8: 6, 9: 7, 10: 7, 11: 7};
    // print("_monthM $_monthM");
    sahmBirthMonth = _monthM;
    if (_monthM < 7) {
      sahmBirthMonth = _monthM;
    } else if (_monthM > 11) {
      sahmBirthMonth = _monthM - 5;
    } else {
      sahmBirthMonth = birthPaja[_monthM];
      if (_monthM == 9 && _birthTimeSelectedValue < 7) {
        sahmBirthMonth = sahmBirthMonth - 1;
      }
    }
    assert(sahmBirthMonth < 13);
    assert(sahmBirthMonth > 0);
    return sahmBirthMonth;
  }

  /// Talea = Sahm Time + Sahm Month -1
  findChildTalea(int timeSahm, int monthSahm) {
    int childTalea = roundTo(timeSahm + monthSahm - 1);
    assert(childTalea < 13);
    assert(childTalea > 0);
    return childTalea;
  }

  findChildTaleaName(int number, List name) {
    return name[13] + name[number];
  }

  /// Child Talea Sahm = Mother Melvash Sahm + Child Melvash Sahm
  /// or Child Melvash Sahm = Child Talea Sahm - Mother Melvash Sahm
  findChildMulwashNum(int childTaleaSahm) {
    int motherMelSahm = _motherM;
    if (_motherM == 13) {
      motherMelSahm = 12;
    }
    int childMelSahm = childTaleaSahm - motherMelSahm;
    childMelSahm = roundTo(childMelSahm);
    assert(childMelSahm < 13);
    assert(childMelSahm > 0);
    return childMelSahm;
  }

  findChildMulwashName(int number, var mulwashaLabel) {
    String childMulwash;
    List newMotheMulwashaLabel = mulwashaLabel.mother;
    newMotheMulwashaLabel.insert(0, "-");
    String motherMulwash = mulwashaLabel.mother[_motherM];
    motherMulwash = motherMulwash.trim();
    if (_character == SingingCharacter.female) {
      var girlMulwash = mulwashaLabel.mother[number];
      var girlEx = mulwashaLabel.boyGirl[1];
      childMulwash =
          girlMulwash.trim() + "  " + girlEx + "  " + motherMulwash.trim();
      if (number == 12) {
        var childMulwash2 = mulwashaLabel.mother[13].trim() +
            "  " +
            girlEx +
            "  " +
            motherMulwash.trim();
        childMulwash = mulwashaLabel.boyGirl[4] +
            "\n" +
            childMulwash +
            "\n" +
            childMulwash2;
      }
    } else {
      var boyMulwash = mulwashaLabel.maleMulwasha[number];
      var boyEx = mulwashaLabel.boyGirl[0];
      childMulwash =
          boyMulwash.trim() + "  " + boyEx + "  " + motherMulwash.trim();
      if (number == 1) {
        var childMulwash2 = mulwashaLabel.maleMulwasha[0].trim() +
            "  " +
            boyEx +
            "  " +
            motherMulwash.trim();
        childMulwash = mulwashaLabel.boyGirl[4] +
            "\n" +
            childMulwash +
            "\n" +
            childMulwash2;
      }
    }
    return childMulwash;
  }

  @override
  Widget convertToMandaDate(BuildContext context) {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    _localLang = localLang;
    var mandaYear = '';
    var mandaDayMonth = '';

    if (_dateM != '') {
      var mandaDateList =
          LocalNum.convertEntoFaAr(_dateM, localLang).split(",");
      mandaYear = mandaDateList[0];
      mandaDayMonth = mandaDateList[1] + ",  " + mandaDateList[2];
    }
    _timeWidthCon = (_displaySize - _iconDropSize) / 3 - 10;
    return Container(
        width: _displaySize,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.date_range,
                    size: _iconDropSize,
                  ),
                  Text("  "),
                  SizedBox(
                    width: _timeWidthCon,
                    child: new TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 4,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        validator: (value) =>
                            validateYY(value, mulwashaLabel.yearMaxMin),
                        style:
                            TextStyle(fontSize: _fontSize, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: mulwashaLabel.dateLabel[0],
                          labelStyle: TextStyle(
                            fontSize: _fontSize,
                          ),
                          hintText: mulwashaLabel.dateLabel[0],
                        )),
                  ),
                  Text("  "),
                  SizedBox(
                    width: _timeWidthCon,
                    child: new TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        validator: (value) => validateMM(value),
                        style:
                            TextStyle(fontSize: _fontSize, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: mulwashaLabel.dateLabel[1],
                          labelStyle: TextStyle(
                            fontSize: _fontSize,
                          ),
                          hintText: mulwashaLabel.dateLabel[1],
                        )),
                  ),
                  Text("  "),
                  SizedBox(
                    width: _timeWidthCon,
                    child: new TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        validator: (value) => validateDD(value),
                        style:
                            TextStyle(fontSize: _fontSize, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: mulwashaLabel.dateLabel[2],
                          labelStyle: TextStyle(
                            fontSize: _fontSize,
                          ),
                          hintText: mulwashaLabel.dateLabel[2],
                        )),
                  ),
                ],
              ),
            ),
            radioButDate(context),
            Padding(padding: EdgeInsets.only(top: _paddingTop)),
            RaisedButton(
                color: Colors.brown[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(color: Colors.black)),
                child: Text(
                  mulwashaLabel.convertDate[0],
                  style: TextStyle(fontSize: _cardFontSize),
                ),
                onPressed: validateAndConvert),
            FittedBox(
                child: Column(
              children: [
                Text(
                  "\n" + mulwashaLabel.convertDateLabel[0],
                  style: TextStyle(
                      fontSize: _fontSize, fontWeight: FontWeight.bold),
                ),
                Text(
                  mandaDayMonth,
                  style: TextStyle(fontSize: _fontSize),
                ),
                Text(
                  mandaYear,
                  style: TextStyle(fontSize: _fontSize),
                ),

                Text(
                  "\n" + mulwashaLabel.convertDateLabel[1],
                  style: TextStyle(
                      fontSize: _fontSize, fontWeight: FontWeight.bold),
                ),
                Text(
                  _dateG,
                  style: TextStyle(fontSize: _fontSize),
                ),

                Text(
                  ("\n" + mulwashaLabel.convertDateLabel[2]),
                  style: TextStyle(
                      fontSize: _fontSize, fontWeight: FontWeight.bold),
                ),
                Text(
                  LocalNum.convertEntoFaAr(_dateS, localLang),
                  style: TextStyle(fontSize: _fontSize),
                ),
                // ############
              ],
            )),
          ],
        ));
  }

  Widget radioButDate(BuildContext context) {
    // MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    var chooseYear = MandaEqu.chooseYear(localLang);

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
          ],
        ));
  }

  Widget backToMainPage(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MandaeanCalendar()));
        });
  }

  void mulwashaInLineHelp(BuildContext context, var lineHelp, var localLang) {
    List helpLine;
    String title;
    String msg;
    if (lineHelp == InLineHelp.mother) {
      helpLine = MandaEqu.inLineHelpMother(localLang);
      title = helpLine[0];
      msg = helpLine[1];
    } else {
      if (lineHelp == InLineHelp.month) {
        helpLine = MandaEqu.inLineHelpMonth(localLang);
        title = helpLine[0];
        msg = helpLine[1];
      } else {
        helpLine = MandaEqu.inLineHelpTime(localLang);
        title = helpLine[0];
        msg = helpLine[1];
      }
    }
    _showMyDialog(context, localLang, title, msg);
  }

  Future<void> _showMyDialog(
      BuildContext context, String localLang, String title, String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: _cardFontSize,
                fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  msg,
                  textAlign: MyAlignment.textAlig(localLang),
                  style:
                      TextStyle(color: Colors.black, fontSize: _cardFontSize),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                MandaEqu.alertOk(localLang),
                style:
                    TextStyle(color: Colors.blue[800], fontSize: _cardFontSize),
              ),
              onPressed: () {
                // Navigator.of(context).pop('dialog');
                _cardFontSize = _resetCardFontSize;
                Navigator.of(context, rootNavigator: true).pop();
              },
            )
          ],
        );
      },
    );
  }
}
