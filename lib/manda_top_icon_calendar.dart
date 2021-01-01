import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'manda_equivalent.dart';
import 'manda_mulwasha.dart';
import 'my_color.dart';

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
  double _iconDropSize = 50;
  double _fontSize = 18.0;
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
    // _setState = setState;
    print(data);
    print(data.lang);
    print(data.lang.name);
    localLang = data.lang.name;
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    Map _myColorSelection = MyColor.selection();
    _myAlignment = MandaEqu.myAlignment(localLang);

    int _sizeRate = 1;
    double _cardFontSize = 20.0;
    double _divecWidth = MediaQuery.of(context).size.width;
    if (_divecWidth > 700) {
      _sizeRate = 2;
      _cardFontSize = 30.0;
    }
    List<String> dropdownList1 = MandaEqu.selectCalendar(localLang);
    List<String> dropdownList2 = dropdownList1;
    List<String> dropdownList3 = dropdownList1;
    String hintText1 = dropdownList1[0];
    String hintText2 = dropdownList1[0];
    String hintText3 = dropdownList1[0];
    print(_dropdownListNum1);
    print(_dropdownListNum2);
    print(_dropdownListNum3);

    List displayList = [];
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

    data.calendarKind.display = displayList;

    print(data.calendarKind.display);

    return Scaffold(
        appBar: AppBar(
            leading: backToMainPage(context),
            backgroundColor: _myColorSelection['header'],
            title: Center(
              child: Text(MandaEqu.helpTitle(localLang),
                  style: TextStyle(
                      color: Colors.black, fontSize: 18.0 * _sizeRate)),
            )),
        body: Center(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                child: Center(
                    child: ListView(children: [
                  Column(children: [
                    Text("data"),
                    displayDrop1(context, dropdownList1, hintText1),
                    Text("data2"),
                    displayDrop2(context, dropdownList2, hintText2),
                    Text("data2"),
                    displayDrop3(context, dropdownList3, hintText3),
                  ]),
                  Text("data"),
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
                ]))

                //         Text("\n"),
                //       ],
                //     ),
                //     RaisedButton(
                //       color: Colors.brown[100],
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(4.0),
                //           side: BorderSide(color: Colors.black)),
                //       onPressed: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => MandaeanCalendar()));
                //       },
                //       child: Text(mulwashaLabel.backBtn,
                //           style: TextStyle(
                //               color: Colors.black, fontSize: _cardFontSize)),
                //     ),
                //   ],
                // ),
                )));
  }

  String selectedEvent;
  @override
  Widget displayDrop1(
      BuildContext context, List<String> dropdownList1, String hintText) {
    List<String> dropdownList = dropdownList1.getRange(1, 4).toList();
    // dropdownList.removeRange(0, 1);
    // dropdownList.removeRange(3, 4);
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
