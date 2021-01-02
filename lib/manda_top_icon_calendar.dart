import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'manda_equivalent.dart';
import 'manda_mulwasha.dart';
import 'my_alignment.dart';
import 'my_color.dart';
import 'my_font_size.dart';
import 'user_set.dart';

class ChooseCalendar extends StatelessWidget {
  var data;
  // TextEditingController _controller;
  ChooseCalendar(data) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choose Calendar',
      home: MyChooseCalendar(data: data),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyChooseCalendar extends StatefulWidget {
  MyChooseCalendar({Key key, this.data}) : super(key: key);

  var data;

  @override
  _MyChooseCalendarState createState() => _MyChooseCalendarState(data);
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyChooseCalendarState extends State<MyChooseCalendar> {
// class ChooseCalendar extends StatelessWidget {
  String localLang;
  // var _setState;
  // var setState;
  var _myAlignment;
  var data;
  var _data;
  double _iconDropSize;
  double _fontSize;
  String _dropdownListNum1;
  String _dropdownListNum2;
  String _dropdownListNum3;
  _MyChooseCalendarState(data) {
    this.data = data;
    print(data);
    _data = data;
  }

  @override
  Widget build(BuildContext context) {
    localLang = data.lang.name;
    Map _myColorSelection = MyColor.selection();
    _myAlignment = MyAlignment.countryLanguage(localLang);
    var _myTextAlignment = MyAlignment.textAlig(localLang);
    List _calendarDisplay = MandaEqu.calendarDisplay(localLang);
    MainSize _mainZise = new MainSize(_data);

    double _sizeRate = _mainZise.rate21;
    double _cardFontSize = _mainZise.f4020;
    _iconDropSize = _mainZise.f5025;
    _fontSize = _mainZise.f2814;

    List<String> dropdownList1 = MandaEqu.selectCalendar(localLang);
    List<String> dropdownList2 = dropdownList1;
    List<String> dropdownList3 = dropdownList1;
    String hintText = dropdownList1[0];

    List<String> displayList = [];
    if (_dropdownListNum1 != null && _dropdownListNum1 != '') {
      displayList.add(_dropdownListNum1);
    }
    if (_dropdownListNum2 != null && _dropdownListNum2 != '') {
      displayList.add(_dropdownListNum2);
    }
    if (_dropdownListNum3 != null && _dropdownListNum3 != '') {
      displayList.add(_dropdownListNum3);
    }
    if (displayList == null || displayList.isEmpty) {
      displayList = ['greg'];
    }

    double marginLeft = 0;
    double marginRight = 20;
    if (localLang == 'en_US') {
      marginLeft = 20;
      marginRight = 0;
    }

    data.calendarKind.display = displayList;
    UserSetting.setCalendar(displayList);

    // print(data.calendarKind.display);

    return Scaffold(
        appBar: AppBar(
            leading: backToMainPage(context),
            backgroundColor: _myColorSelection['header'],
            title: Center(
              child: Text(_calendarDisplay[0],
                  style: TextStyle(
                      color: Colors.black, fontSize: 18.0 * _sizeRate)),
            )),
        body: Center(
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: _mainZise.marginH, vertical: 0),
                child: Center(
                    child: ListView(children: [
                  Column(children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      _calendarDisplay[1],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontSize: _cardFontSize),
                      // )
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Container(
                      alignment: _myAlignment,
                      child: Text(
                        _calendarDisplay[2],
                        textAlign: _myTextAlignment,
                        style: TextStyle(
                            color: Colors.black, fontSize: _cardFontSize),
                        // )
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(left: marginLeft, right: marginRight),
                      child: displayDrop1(context, dropdownList1, hintText),
                    ),

                    Padding(padding: EdgeInsets.only(top: 10)),
                    Container(
                      alignment: _myAlignment,
                      child: Text(
                        _calendarDisplay[3],
                        textAlign: _myTextAlignment,
                        style: TextStyle(
                            color: Colors.black, fontSize: _cardFontSize),
                        // )
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(left: marginLeft, right: marginRight),
                      child: displayDrop2(context, dropdownList2, hintText),
                    ),

                    Padding(padding: EdgeInsets.only(top: 10)),
                    Container(
                      alignment: _myAlignment,
                      child: Text(
                        _calendarDisplay[4],
                        textAlign: _myTextAlignment,
                        style: TextStyle(
                            color: Colors.black, fontSize: _cardFontSize),
                        // )
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: marginLeft, right: marginRight),
                        child: displayDrop3(context, dropdownList3, hintText)),
                    // displayDrop3(context, dropdownList3, hintText),
                  ]),
                  // Text("data"),
                  Padding(padding: EdgeInsets.only(top: 50)),

                  //// ################ alertOk ################
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
                    child: Text(MandaEqu.alertOk(localLang),
                        style: TextStyle(
                            color: Colors.black, fontSize: _cardFontSize)),
                  ),
                ])))));
  }

  String selectedEvent;
  @override
  Widget displayDrop1(
      BuildContext context, List<String> dropdownList1, String hintText) {
    List<String> dropdownList = dropdownList1.getRange(1, 4).toList();
    // dropdownList.removeRange(0, 1);

    return DropdownButtonHideUnderline(
        child: SizedBox(
            // width: _displaySize,
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
                    alignment: _myAlignment,
                    child: new Text(hintText,
                        style: TextStyle(
                            color: Colors.black45, fontSize: _fontSize)),
                  ),

                  value: selectedEvent == null ? null : selectedEvent,
                  items: dropdownList.map((String value) {
                    return new DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          alignment: _myAlignment,
                          child: new Text(value,
                              style: TextStyle(
                                  color: Colors.black, fontSize: _fontSize)),
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      selectedEvent = value;
                      int selectedChoose = dropdownList.indexOf(value);
                      _dropdownListNum1 = getChoose(selectedChoose);
                    });
                  },
                ))));
  }

  static getChoose(choose) {
    if (choose != null && choose == 0) {
      return 'greg';
    }
    if (choose != null && choose == 1) {
      return 'manda';
    }
    if (choose != null && choose == 2) {
      return 'shamsi';
    }
    return '';
  }

  String selectedEvent2;
  @override
  Widget displayDrop2(
      BuildContext context, List<String> dropdownList2, String hintText) {
    List<String> dropdownList = dropdownList2.getRange(1, 5).toList();
    // dropdownList.removeRange(0, 1);
    // var myAlignment = mulwashaLabel.myAlignment;

    // FormState form = _formKey.currentState;
    return DropdownButtonHideUnderline(
        child: SizedBox(
            // width: _displaySize,
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
                    alignment: _myAlignment,
                    child: new Text(hintText,
                        style: TextStyle(
                            color: Colors.black45, fontSize: _fontSize)),
                  ),

                  value: selectedEvent2 == null ? null : selectedEvent2,
                  items: dropdownList.map((String value) {
                    return new DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          alignment: _myAlignment,
                          child: new Text(value,
                              style: TextStyle(
                                  color: Colors.black, fontSize: _fontSize)),
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      selectedEvent2 = value;
                      int selectedChoose = dropdownList.indexOf(value);
                      _dropdownListNum2 = getChoose(selectedChoose);
                    });
                  },
                ))));
  }

  String selectedEvent3;
  @override
  Widget displayDrop3(
      BuildContext context, List<String> dropdownList3, String hintText) {
    List<String> dropdownList = dropdownList3.getRange(1, 5).toList();
    // dropdownList.removeRange(0, 1);
    // var myAlignment = mulwashaLabel.myAlignment;

    // FormState form = _formKey.currentState;
    return DropdownButtonHideUnderline(
        child: SizedBox(
            // width: _displaySize,
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
                    alignment: _myAlignment,
                    child: new Text(hintText,
                        style: TextStyle(
                            color: Colors.black45, fontSize: _fontSize)),
                  ),

                  value: selectedEvent3 == null ? null : selectedEvent3,
                  items: dropdownList.map((String value) {
                    return new DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          alignment: _myAlignment,
                          child: new Text(value,
                              style: TextStyle(
                                  color: Colors.black, fontSize: _fontSize)),
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      selectedEvent3 = value;
                      int selectedChoose = dropdownList.indexOf(value);
                      _dropdownListNum3 = getChoose(selectedChoose);
                    });
                  },
                ))));
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

  // void setState(Null Function() param0) {}
}
