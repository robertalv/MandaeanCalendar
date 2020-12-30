import 'calendar_month_date.dart';

class MandaGregShamsiInfo {
  static dateBuilder(var data) {
    print('CALLBACK: _MandaDateBuilder');
    print("*" * 30 + "Date builder load" + "*" * 30);
    Map gregDate = CalendarDateBuilder.greg(data);
    Map mandaDate = CalendarDateBuilder.manda(data);
    Map shamsiDate = CalendarDateBuilder.shamsi(data);

    var firstMin = getFirstMin(data);
    var lastMax = getLastMax(data);
    // print("firstMin $firstMin");
    // print('lastMax $lastMax');

    return [
      mandaDate,
      gregDate,
      shamsiDate,
      [firstMin, lastMax],
    ];
  }

  static getFirstMin(data) {
    List firstList = [
      data.gregMonth.info['first'],
      data.mandaMonth.info['first'],
      data.shamsiMonth.info['first'],
    ];
    firstList.sort();
    return firstList[0];
  }

  static getLastMax(data) {
    List lastList = [
      data.gregMonth.info['last'],
      data.mandaMonth.info['last'],
      data.shamsiMonth.info['last'],
    ];
    lastList.sort();
    return lastList[2];
  }
}
// static mandaMonthEvents(DateTime first, DateTime last, mandaDate) {
//   print("first $first  -------- last $last");
//   int monthNum = _data.mandaMonth.info['month'];
//   Map mandaEvents = mandaEventsDateBase(monthNum);
//   // print("monthEvents $monthEvents");
//   // print("monthEvents ${mandaEvents.length}");
//   return monthLoop(mandaEvents, mandaDate);
// }

// static mandaOtherEvents(DateTime first, DateTime last) {
//   // print("first $first  -------- last $last");
// }

// static monthLoop(Map monthEvents, mandaDate) {
//   List eventsList = [];
//   List matchDateList;

//   monthEvents.forEach((key, value) {
//     // print("key $key");
//     // print("value $value");
//     var matchDate =
//         mandaDate.where((element) => element[1] == key.toString());
//     matchDateList = matchDate.toList();
//     if (matchDateList.isNotEmpty) {
//       eventsList.addAll([matchDateList[0][0], value]);
//     }
//   });

//   return eventsList;
// }

// static Map mandaEventsDateBase(monthEvent) {
//   final List firstMonthEventName = MandaEqu.mandaFirstMonth();
//   final List lightDayEventName = MandaEqu.mandaLightMbattal();
//   final List heavyDayEventName = MandaEqu.mandaHeavyMbattal();
//   final Map mandaFeast = MandaEqu.mandaFeast();

//   Map mandaEventsDate = {
//     1: {
//       1: [lightDayEventName[0], firstMonthEventName[0]]
//     },
//     2: {1: firstMonthEventName},
//     3: {
//       1: [firstMonthEventName[0], mandaFeast['yahya']],
//       2: heavyDayEventName
//     },
//     4: {
//       1: firstMonthEventName,
//       28: lightDayEventName,
//       29: lightDayEventName,
//       30: [mandaFeast['kenshi']]
//     },
//     5: {
//       1: [lightDayEventName[0], firstMonthEventName[0], mandaFeast['eidBig']],
//       2: [lightDayEventName[0], mandaFeast['kersa']],
//       3: lightDayEventName,
//       4: lightDayEventName,
//       5: lightDayEventName,
//       6: [heavyDayEventName[0], mandaFeast['shoshian'][0]],
//       7: [heavyDayEventName[0], mandaFeast['shoshian'][1]],
//       8: lightDayEventName,
//       9: lightDayEventName,
//       10: lightDayEventName,
//       11: lightDayEventName,
//       12: lightDayEventName,
//       13: lightDayEventName,
//       14: lightDayEventName,
//       22: lightDayEventName,
//     },
//     6: {1: firstMonthEventName, 25: lightDayEventName},
//     7: {1: firstMonthEventName},
//     8: {
//       1: [lightDayEventName[0], firstMonthEventName[0], mandaFeast['alfil']],
//       2: lightDayEventName,
//       3: lightDayEventName,
//       4: lightDayEventName,
//       18: [mandaFeast['eidSmall']]
//     },
//     9: {1: firstMonthEventName},
//     10: {
//       1: [firstMonthEventName[0], mandaFeast['ashoreh']],
//       9: lightDayEventName,
//       15: lightDayEventName,
//       23: lightDayEventName
//     },
//     11: {1: firstMonthEventName},
//     12: {
//       1: firstMonthEventName,
//       26: heavyDayEventName,
//       27: heavyDayEventName,
//       28: heavyDayEventName,
//       29: heavyDayEventName,
//       30: heavyDayEventName,
//       31: [mandaFeast['banja'][0]],
//       32: [mandaFeast['banja'][1]],
//       33: [mandaFeast['banja'][2]],
//       34: [mandaFeast['banja'][3]],
//       35: [mandaFeast['banja'][4]]
//     },
//     13: {
//       1: [mandaFeast['banja'][0]],
//       2: [mandaFeast['banja'][1]],
//       3: [mandaFeast['banja'][2]],
//       4: [mandaFeast['banja'][3]],
//       5: [mandaFeast['banja'][4]]
//     },
//   };
//   return mandaEventsDate[monthEvent];
// }
