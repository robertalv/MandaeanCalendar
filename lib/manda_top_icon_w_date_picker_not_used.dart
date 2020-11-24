import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
// import 'package:manda_calendar/main.dart';
import 'main.dart';
import 'manda_mulwasha.dart';
import 'package:jalali_calendar/jalali_calendar.dart';
// import 'package:persian_date/persian_date.dart';

// class TopIconsInfo {

Widget mulwashal(BuildContext context, var localLang) {
  // get _localLang => localLang;
  return Center(
    child: Column(
      children: [
        Container(
          // margin: EdgeInsets.all(10),
          child: Tooltip(
            message: "Maluasha",
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MandaMulwashal(localLang)),
                  );
                },
                child: Icon(
                  Icons.assignment_ind,
                  color: Colors.deepPurple[800],
                  size: 45,
                )),
          ),
        )
      ],
    ),
  );
}

Widget helpDoc(BuildContext context, var localLang) {
  return Center(
      child: FlatButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpDoc(localLang)),
            );
          },
          icon: Icon(
            Icons.help,
            color: Colors.deepPurple[800],
            size: 45,
          ),
          label: Text("")));
}

class HelpDoc extends StatelessWidget {
  String localLang;
  HelpDoc(localLang) {
    this.localLang = localLang;
  }

  // get localLang => _localLang;
  @override
  Widget build(BuildContext context) {
    // String localLang = 'fa_IR';
    String imageName;
    if (localLang == 'fa_IR') {
      imageName = 'images/helpFa.png';
    } else if (localLang == 'ar') {
      imageName = 'images/helpFa.png';
    } else {
      imageName = 'images/helpEn.png';
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Help"),
      ),
      body: Column(
        children: [
          Image.asset(
            imageName,
            fit: BoxFit.fitHeight,
            // height: double.maxFinite,
            // width: double.maxFinite,
            alignment: Alignment.center,
          ),
          // Text(MandaHelpDoc.helpDocs('fa_IR')),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          )
        ],
      ),
    );
  }
}

enum SingingCharacter { male, female }

class MandaMulwashal extends StatelessWidget {
  String localLang;
  // TextEditingController _controller;
  MandaMulwashal(localLang) {
    this.localLang = localLang;
  }

  @override
  Widget build(BuildContext context) {
    String _localLang = localLang;
    return MaterialApp(
      title: 'Mulwashal',
      home: MyMulwashalPage(localLang: localLang),
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
  SingingCharacter _character = SingingCharacter.male;

  _MyMulwashalPageState(localLang) {
    this.localLang = localLang;
  }
  String localLang;
  TextEditingController _controllerYY = TextEditingController();
  TextEditingController _controllerMM = TextEditingController();
  TextEditingController _controllerDD = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
      print(DateTime(2020, 2, 31));
      showAlertDialog(context);
    }
  }

  _showDatePicker() {
    var now = DateTime.now();
    var today = new DateTime(now.year, now.month, now.day);
    final bool showTitleActions = false;
    DatePicker.showDatePicker(
      context,
      minYear: 1300,
      maxYear: 1450,
    );
    // showDatePicker(
    //     context: context,
    //     initialDate: DateTime(1370, 1, 1),
    //     firstDate: DateTime(1370, 1, 1),
    //     lastDate: DateTime(13470, 1, 1));
  }
//     final bool showTitleActions = false;
//     DatePicker.showDatePicker(context,
//         minYear: 1300,
//         maxYear: 1450,
// /*      initialYear: 1368,
//       initialMonth: 05,
//       initialDay: 30,*/
//         confirm: Text(
//           'تایید',
//           style: TextStyle(color: Colors.red),
//         ),
//         cancel: Text(
//           'لغو',
//           style: TextStyle(color: Colors.cyan),
//         ),
//         dateFormat: _format, onChanged: (year, month, day) {
//       if (!showTitleActions) {
//         _changeDatetime(year, month, day);
//       }
//     }, onConfirm: (year, month, day) {
//       _changeDatetime(year, month, day);
//       // _valuePiker =
//       //     " تاریخ ترکیبی : $_datetime  \n سال : $year \n  ماه :   $month \n  روز :  $day";
//     });
//   }

//   void _changeDatetime(int year, int month, int day) {
//     setState(() {
//       _datetime = '$year-$month-$day';
//     });
//   }

  @override
  Widget build(BuildContext context) {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    TimeOfDay selectedTime = TimeOfDay.now();
    var now = DateTime.now();
    var today = new DateTime(now.year, now.month, now.day);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(mulwashaLabel.title),
      ),
      // body: MyRadioWidget(),
      body: Column(
        children: <Widget>[
          Center(
              child: Column(children: <Widget>[
            Text(' تقویم شمسی '),
            new RaisedButton(
              onPressed: _showDatePicker,
              child: new Text('نمایش تقویم'),
            ),
          ])),
          RaisedButton(
            onPressed: null,
            child: Text("Shamsi"),
          ),

          // new RaisedButton(
          //   onPressed: _showDatePicker,
          //   child: new Text('نمایش دیت پیکر'),
          // ),
          Container(
              height: 70,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                  fontSize: 18,
                ))),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  maximumYear: 3000,
                  minimumYear: 1900,
                  initialDateTime: today,
                  onDateTimeChanged: (DateTime newDateTime) {
                    print("newDateTime $newDateTime");
                    print(selectedTime);
                    // Do something
                  },
                ),
              )),
          Form(
            key: _formKey,
            child: Row(children: <Widget>[
              Icon(Icons.date_range),
              Text("  "),
              new Flexible(
                  child: new TextFormField(
                      // onFieldSubmitted: (String value) async {},
                      controller: _controllerYY,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      // if ((value == null) || (value < 1000) || (value > 3000))
                      // validator: (value) => ((value.isEmpty ||
                      //         (int.parse(value) < 1000) ||
                      //         (int.parse(value) > 3000)))
                      //     ? 'Year cannot be blank'
                      //     : null,
                      validator: (value) => validateYY(value),
                      decoration: InputDecoration(
                        labelText: "Year",
                        hintText: "Year",
                      ))),
              Text("  "),
              new Flexible(
                  child: new TextFormField(
                      controller: _controllerMM,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      validator: (value) => validateMM(value),
                      decoration: InputDecoration(
                        labelText: "Month",
                        hintText: "Month",
                      ))),
              Text("  "),
              new Flexible(
                  child: new TextFormField(
                      controller: _controllerDD,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      validator: (value) => validateDD(value),
                      decoration: InputDecoration(
                        labelText: "Day",
                        hintText: "Day",
                      ))),
              RaisedButton(
                  child: Text(
                    'Convert',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: validateAndSave)
            ]),
          ),
          // Row(children: <Widget>[
          //   Icon(Icons.date_range),
          //   Text("  "),
          //   new Flexible(
          //       child: new TextFormField(
          //           // onFieldSubmitted: (String value) async {},
          //           controller: _controllerYY,
          //           keyboardType: TextInputType.number,
          //           maxLength: 4,
          //           inputFormatters: <TextInputFormatter>[
          //             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          //           ],
          //           // validator: validateMobile,
          //           validator: (value) {
          //             print(value);
          //             validateMobile(_controllerYY.text);
          //           },
          //           // validateMobile(_controllerYY.text),
          //           // autovalidate: true,
          //           decoration: InputDecoration(
          //             labelText: "Year",
          //             hintText: "Year",
          //           ))),
          //   Text("  "),
          //   new Flexible(
          //       child: new TextFormField(
          //           controller: _controllerMM,
          //           keyboardType: TextInputType.number,
          //           maxLength: 2,
          //           inputFormatters: <TextInputFormatter>[
          //             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          //           ],
          //           decoration: InputDecoration(
          //             labelText: "Month",
          //             hintText: "Month",
          //           ))),
          //   Text("  "),
          //   new Flexible(
          //       child: new TextFormField(
          //           controller: _controllerDD,
          //           keyboardType: TextInputType.number,
          //           maxLength: 2,
          //           inputFormatters: <TextInputFormatter>[
          //             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          //           ],
          //           decoration: InputDecoration(
          //             labelText: "Day",
          //             hintText: "Day",
          //           ))),
          // ]),
          RadioListTile<SingingCharacter>(
              title: Text(
                mulwashaLabel.male,
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              value: SingingCharacter.male,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              }),
          RadioListTile<SingingCharacter>(
              title: Text(mulwashaLabel.female,
                  style: TextStyle(fontSize: 25, color: Colors.black)),
              value: SingingCharacter.female,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              }),
          Row(children: <Widget>[
            Text(
              mulwashaLabel.motherLabel,
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Container(width: 10),
            motherMulwasha(context),
          ]),
          Row(children: <Widget>[
            Text(
              mulwashaLabel.birthMonthLabel,
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Container(width: 10),
            birthMonth(context),
          ]),
          Row(children: <Widget>[
            Text(
              mulwashaLabel.birthTimeLabel,
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Container(width: 10),
            birthTimeDrop(context),
          ]),
          findMulwasha(context),
          RaisedButton(
            // onPressed: () {
            //   Navigator.pop(context);
            // },
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MandaeanCalendar()));
            },

            child: Text('Ok'),
          )
        ],
      ),
    );
  }

  // #################

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        // Navigator.of(context).pop('dialog');
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String validateYY(String value) {
    if (value.isNotEmpty) {
      int newValue = int.parse(value);

      if ((newValue == null) || (newValue < 1000) || (newValue > 3000)) {
        // showAlertDialog(context);
        return '1000-3000';
      }
    } else {
      return '1000-3000';
    }
    return null;
  }

  String validateMM(String value) {
    if (value.isNotEmpty) {
      int newValue = int.parse(value);

      if ((newValue == null) || (newValue < 13) || (newValue > 0)) {
        // showAlertDialog(context);
        return '1-12';
      }
    } else {
      return '1-12';
    }
    return null;
  }

  String validateDD(String value) {
    if (value.isNotEmpty) {
      int newValue = int.parse(value);

      if ((newValue == null) || (newValue < 32) || (newValue > 0)) {
        // showAlertDialog(context);
        return '1-31';
      }
    } else {
      return '1-31';
    }
    return null;
  }

  // #################
  String birthValue = "--Select--";
  @override
  Widget birthMonth(BuildContext context) {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    var dropListData = mulwashaLabel.monthName;
    return DropdownButton<String>(
      value: birthValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          birthValue = newValue;
        });
      },
      items: dropListData.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  // #################
  String motherValue = "--Select--";
  @override
  Widget motherMulwasha(BuildContext context) {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    var dropListData = mulwashaLabel.mother;
    return DropdownButton<String>(
      value: motherValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          motherValue = newValue;
        });
      },
      items: dropListData.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

// #################
  String timeValue = "--Select--";
  @override
  Widget birthTimeDrop(BuildContext context) {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    var dropListData = mulwashaLabel.birthTime;
    return DropdownButton<String>(
      value: timeValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          timeValue = newValue;
        });
      },
      items: dropListData.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

// #################
  String dropdownValue = "--Select--";
  @override
  Widget findMulwasha(BuildContext context) {
    print(_character);
    print(dropdownValue);
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    var monthNameList = mulwashaLabel.monthName;
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: monthNameList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
