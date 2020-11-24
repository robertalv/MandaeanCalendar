import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'manda_equivalent.dart';

// class MyScrollingText {
Widget myScrollingText(BuildContext context, var myMessage, sizeRate) {
  var myVelocity = -20.0;
  if (myMessage.contains("Next")) {
    myVelocity = 20.0;
  }

  return Container(
      child: Column(
    children: [
      buildMarquee(myMessage.toString(), myVelocity, sizeRate),
    ].map(wrapWithStuff).toList(),
  ));
}

Widget buildMarquee(String myMessage, var myVelocity, sizeRate) {
  return Marquee(
    text: myMessage,
    style: TextStyle(fontSize: 15.0 * sizeRate),
    blankSpace: 150.0,
    velocity: myVelocity,
    numberOfRounds: 5,
    pauseAfterRound: Duration(seconds: 1),
  );
}

Widget wrapWithStuff(Widget child) {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Container(height: 35.0, color: Colors.white, child: child),
  );
}

Widget _buildComplexMarquee() {
  return Marquee(
    text: 'Some sample text that takes some space.',
    style: TextStyle(fontWeight: FontWeight.bold),
    scrollAxis: Axis.horizontal,
    crossAxisAlignment: CrossAxisAlignment.start,
    blankSpace: 20.0,
    velocity: 100.0,
    pauseAfterRound: Duration(seconds: 1),
    showFadingOnlyWhenScrolling: true,
    fadingEdgeStartFraction: 0.1,
    fadingEdgeEndFraction: 0.1,
    numberOfRounds: 3,
    startPadding: 10.0,
    accelerationDuration: Duration(seconds: 1),
    accelerationCurve: Curves.linear,
    decelerationDuration: Duration(milliseconds: 500),
    decelerationCurve: Curves.easeOut,
  );
}

class scrollingText {
  static generateEventsforScroll(Map<DateTime, List> events, Map holidays) {
    // print(
    //     "************* Whole year events loaded on Text Scrolling*************");
    Map eventsScrollText = {};

    // final DateFormat formatter = DateFormat('yyyy-MM-dd');
    var dateEvents = events.keys.toList();
    // var dateBeginOfMonth = holidays.keys.toList();
    String exSpeace = ' ' * 10;
    final todayDay = DateTime.now();
    // final todayDay = DateTime(2020, 2, 1);
    int nextMonth = DateTime(todayDay.year, todayDay.month + 1, 1).month;

    dateEvents = sortDate(dateEvents);
    // dateBeginOfMonth = sortDate(dateBeginOfMonth);
    // int i = 1;

    // dateBeginOfMonth.forEach((date) {
    //   String formatted = formatter.format(date);
    //   Map selectedEvent = holidays[date][0];
    //   firstMonthEvents['en_US']
    //       .add(formatted + " " + selectedEvent['en_US'] + exSpeace);
    //   firstMonthEvents['fa_IR']
    //       .add(formatted + " " + selectedEvent['fa_IR'] + exSpeace);
    //   firstMonthEvents['ar']
    //       .add(formatted + " " + selectedEvent['ar'] + exSpeace);
    // });
    var majorIndex = true;
    var minorIndex = true;
    var panjaIndex = true;
    var dehvaRabaIndex = true;
    var shushianIndex = true;

    String eventsTextEn = '';
    String eventsTextFa = '';
    String eventsTextAr = '';
    var textData = MandaEqu.scrollingText();

    dateEvents.forEach((date) {
      // String formatted = formatter.format(date);

      List selectedEvents = events[date];
      if (nextMonth == date.month) {
        selectedEvents.forEach((selectedEvent) {
          // print(selectedEvent.runtimeType);
          if (selectedEvent.runtimeType.toString().contains("List")) {
            selectedEvent = selectedEvent[0];
          }

          if (selectedEvent['en_US'].contains("Major")) {
            if (majorIndex == true) {
              majorIndex = false;
              eventsTextEn =
                  eventsTextEn + selectedEvent['en_US'].trim() + exSpeace;
              eventsTextFa =
                  eventsTextFa + selectedEvent['fa_IR'].trim() + exSpeace;
              eventsTextAr =
                  eventsTextAr + selectedEvent['ar'].trim() + exSpeace;
            }
          } else if (selectedEvent['en_US'].contains("Minor")) {
            if (minorIndex == true) {
              minorIndex = false;
              eventsTextEn =
                  eventsTextEn + selectedEvent['en_US'].trim() + exSpeace;
              eventsTextFa =
                  eventsTextFa + selectedEvent['fa_IR'].trim() + exSpeace;
              eventsTextAr =
                  eventsTextAr + selectedEvent['ar'].trim() + exSpeace;
            }
          } else if (selectedEvent['en_US'].contains("Panja")) {
            if (panjaIndex == true) {
              panjaIndex = false;
              eventsTextEn =
                  eventsTextEn + textData['panja']['en_US'].trim() + exSpeace;
              eventsTextFa =
                  eventsTextFa + textData['panja']['fa_IR'].trim() + exSpeace;
              eventsTextAr =
                  eventsTextAr + textData['panja']['ar'].trim() + exSpeace;
            }
          } else if (selectedEvent['en_US'].contains("Kenshi") ||
              selectedEvent['en_US'].contains("Raba") ||
              selectedEvent['en_US'].contains("Kersa")) {
            if (dehvaRabaIndex == true) {
              dehvaRabaIndex = false;
              eventsTextEn = eventsTextEn +
                  textData['dehvaRaba']['en_US'].trim() +
                  exSpeace;
              eventsTextFa = eventsTextFa +
                  textData['dehvaRaba']['fa_IR'].trim() +
                  exSpeace;
              eventsTextAr =
                  eventsTextAr + textData['dehvaRaba']['ar'].trim() + exSpeace;
            }
          } else if (selectedEvent['en_US'].contains("Shushian")) {
            if (shushianIndex == true) {
              shushianIndex = false;
              eventsTextEn = eventsTextEn +
                  textData['shushian']['en_US'].trim() +
                  exSpeace;
              eventsTextFa = eventsTextFa +
                  textData['shushian']['fa_IR'].trim() +
                  exSpeace;
              eventsTextAr =
                  eventsTextAr + textData['shushian']['ar'].trim() + exSpeace;
            }
          } else {
            eventsTextEn =
                eventsTextEn + selectedEvent['en_US'].trim() + exSpeace;
            eventsTextFa =
                eventsTextFa + selectedEvent['fa_IR'].trim() + exSpeace;
            eventsTextAr = eventsTextAr + selectedEvent['ar'].trim() + exSpeace;
          }
        });
      }
    });
    if (eventsTextEn.isNotEmpty) {
      eventsTextEn = textData['next']['en_US'].trim() + exSpeace + eventsTextEn;
      eventsTextFa = textData['next']['fa_IR'].trim() + exSpeace + eventsTextFa;
      eventsTextAr = textData['next']['ar'].trim() + exSpeace + eventsTextAr;
    }
    eventsScrollText['en_US'] = eventsTextEn;
    eventsScrollText['fa_IR'] = eventsTextFa;
    eventsScrollText['ar'] = eventsTextAr;

    // print(eventsScrollText);

    return eventsScrollText;
  }

  static sortDate(List<DateTime> newProducts) {
    // print('before: $newProducts');
    newProducts.sort((a, b) => a.compareTo(b));
    return newProducts;
    // print('after: $newProducts');
  }
}
