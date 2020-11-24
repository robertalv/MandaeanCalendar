// import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIcon {
  var relig;
  var minor;
  var major;
  var firstMonth;
  var noon;
  var error;

  MyIcon(sizeRate) {
    // int selectedYear = selectedDay.year;
    this.relig = religEvent(sizeRate);
    this.minor = minorEvent(sizeRate);
    this.major = majorEvent(sizeRate);
    this.firstMonth = firstMonthEvent(sizeRate);
    this.noon = noEvent();
    this.error = onError();
  }

  Widget religEvent2(sizeRate) {
    return Icon(
      Icons.stop,
      color: Colors.lightGreen[800],
      size: 20.0 * sizeRate,
    );
  }

  Widget religEvent(sizeRate) {
    return Icon(
      // Icons.change_history,
      // Icons.exit_to_app,
      // Icons.stop,
      // Icons.note,

      // Icons.subtitles,
      // Icons.tab_sharp,
      // Icons.pages,
      Icons.view_agenda,
      color: Colors.lightGreen[800],
      size: 15.0 * sizeRate,
    );
  }

  Widget minorEvent2(sizeRate) {
    return Icon(
      Icons.album,
      color: Colors.orangeAccent[700],
      size: 15.0 * sizeRate,
    );
  }

  Widget minorEvent(sizeRate) {
    return Icon(
      Icons.tonality,
      color: Colors.orangeAccent[700],
      size: 15.0 * sizeRate,
    );
  }

  Widget majorEvent(sizeRate) {
    return Icon(
      Icons.lens,
      color: Colors.red[800],
      size: 15.0 * sizeRate,
    );
  }

  Widget firstMonthEvent(sizeRate) {
    return Icon(
      Icons.assignment_turned_in,
      color: Colors.blue[800],
      size: 15.0 * sizeRate,
    );
  }

  Widget onError() {
    return Icon(
      Icons.error,
      color: Colors.white,
      size: 25.0,
    );
  }

  Widget noEvent() {
    return Text(" ");
  }

  // static events() {
  //   var data = Icon(
  //                 Icons.stop,

  //                 color: Colors.lightGreen[800],
  //                 size: 20.0,
  //               ),
  //   return data;
  // }
}
