import 'package:flutter/material.dart';

import 'main.dart';
import 'my_alignment.dart';
import 'my_color.dart';
import 'my_font_size.dart';
import 'my_icon_events.dart';
import 'my_icon_events.dart';
import 'my_icon_events.dart';

class BuildEvents extends MyHomePage {
  var _myAlignment;
  var _myTextAlignment;
  Map _myColorSelection;
  MainSize _mainSize;
  String _localLang;
  double _listFontSize;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
  }

  @override
  Widget eventList(BuildContext context, List selectedEvents, var data) {
    _localLang = data.lang.name;
    _myAlignment = MyAlignment.countryLanguage(_localLang);
    _myTextAlignment = MyAlignment.textAlig(_localLang);
    _myColorSelection = MyColor.selection();
    _mainSize = new MainSize(data);

    return Column(
      children: selectedEvents
          .map((event) => Container(
                constraints: BoxConstraints(
                  minHeight: 30,
                ),
                alignment: _myAlignment,
                decoration: BoxDecoration(
                    border: Border.all(width: 0),
                    borderRadius: BorderRadius.circular(8.0),
                    color: _myColorSelection['minor']),
                margin: EdgeInsets.symmetric(
                    horizontal: _mainSize.marginH, vertical: 4),
                child: Column(children: [
                  _generateIconEvent(event),
                ]),
              ))
          .toList(),
    );
  }

  Widget _generateIconEvent(event) {
    MyIcon myIcon = new MyIcon(_mainSize.iconRateList);
    // var _myAlignment = MyAlignment.countryLanguage(_localLang);
    // var _myTextAlignment = MyAlignment.textAlig(_localLang);
    var eventIcon;
    var beforeEvent;
    var afterEvent;
    // print(event);

    if (event['en_US'].contains("Minor")) {
      eventIcon = myIcon.minor;
    } else if (event['en_US'].contains("Major")) {
      eventIcon = myIcon.major;
    } else if (event['en_US'].contains("First")) {
      eventIcon = myIcon.firstMonth;
    } else if (event['en_US'].contains("==")) {
      eventIcon = myIcon.noon;
    } else {
      eventIcon = myIcon.relig;
    }

    event = event[_localLang];
    if (_localLang == "en_US") {
      beforeEvent = eventIcon;
      afterEvent = myIcon.noon;
      _listFontSize = 20;
    } else {
      beforeEvent = myIcon.noon;
      afterEvent = eventIcon;
      _listFontSize = 22;
    }

    return Row(
      children: [
        beforeEvent,
        Flexible(
            child: Container(
          alignment: _myAlignment,
          child: Text(
            event.toString(),
            textAlign: _myTextAlignment,
            style: TextStyle(fontSize: _mainSize.f4020, color: Colors.black),
          ),
        )),
        Text(" "),
        afterEvent
      ],
    );
  }
}
