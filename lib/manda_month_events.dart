import 'package:intl/intl.dart';

import 'calendar_month_date.dart';
import 'manda_date.dart';
import 'manda_equivalent.dart';

class MandaGregShamsiInfo {
  static dateEvents(var data) {
    print('CALLBACK: _MandaDateBuilder');
    List gregDate = CalendarDateBuilder.greg(data);
    List mandaDate = CalendarDateBuilder.manda(data);
    List shamsiDate = CalendarDateBuilder.shamsi(data);

    List firstList = [
      data.gregMonth.info['first'],
      data.mandaMonth.info['first'],
      data.shamsiMonth.info['first'],
    ];

    List lastList = [
      data.gregMonth.info['last'],
      data.mandaMonth.info['last'],
      data.shamsiMonth.info['last'],
    ];

    firstList.sort();
    var firstMin = firstList[0];
    lastList.sort();
    var lastMax = lastList[2];
    print("firstMin $firstMin");
    print('lastMax $lastMax');

    return [
      mandaDate,
      gregDate,
      shamsiDate,
      [firstMin, lastMax]
    ];
  }

  // static mandaMonthInfo(DateTime selectedDay) {
  //   List beforeDateList = [];
  //   List monthDateList = [];
  //   List afterDateList = [];
  //   List allDateList = [];
  //   MandaDateBuilder mandaDate = MandaDateBuilder(selectedDay);
  //   var mandaDay = mandaDate.day;
  //   var mandaDayInMonth = 30;
  //   if (mandaDate.month == 13) {
  //     mandaDayInMonth = 5;
  //   }

  //   DateTime startMonth = DateTime(selectedDay.year, selectedDay.month,
  //       selectedDay.day - mandaDay + 1, 0, 0);

  //   DateTime endMonth = DateTime(startMonth.year, startMonth.month,
  //       startMonth.day + mandaDayInMonth - 1, 0, 0);

  //   Map data = {
  //     'first': startMonth,
  //     'last': endMonth,
  //     'dayInMonth': mandaDayInMonth,
  //     'month': mandaDate.month,
  //     'yahya': mandaDate.yearYahya,
  //     'adam': mandaDate.yearAdam,
  //     'monthFaAr': mandaDate.monthFa,
  //     'monthEn': mandaDate.monthEn,
  //     'kind': 'manda'
  //   };

  //   var day = DateFormat.E("en_US").format(startMonth);
  //   int beforeDayIndex = getNumDayOdWeek(day);
  //   // print(day);
  //   // print(beforeDayIndex);

  //   beforeDateList = beforeLoop(startMonth, beforeDayIndex);
  //   // print(beforeDateList);

  //   monthDateList = monthLoop(startMonth, mandaDayInMonth);
  //   // print(monthDateList);
  //   // Map<DateTime, List> holidaysEvents =
  //   //     MandaGregShamsiInfo.holidaysEventsMonthBuilder(data, monthDateList);
  //   MandaGregShamsiInfo.dateEvents(data);

  //   day = DateFormat.E("en_US").format(endMonth);
  //   int afterDayIndex = 6 - getNumDayOdWeek(day);
  //   // print(day);
  //   // print(afterDayIndex);

  //   afterDateList = afterLoop(endMonth, afterDayIndex);
  //   // print(afterDateList);

  //   allDateList.addAll(beforeDateList);
  //   allDateList.addAll(monthDateList);
  //   allDateList.addAll(afterDateList);
  //   // print(allDateList);
  //   // print(allDateLebelList);
  //   return allDateList;
  //   return data;
  // }

  // static gregMonthInfo(DateTime selectedDay) {
  //   DateTime startMonth =
  //       DateTime(selectedDay.year, selectedDay.month, 1, 0, 0);
  //   DateTime endMonth =
  //       DateTime(selectedDay.year, selectedDay.month + 1, 0, 0, 0);

  //   Map data = {'first': startMonth, 'last': endMonth, 'kind': 'greg'};
  //   return data;
  // }

  // static shamsiMonthInfo(DateTime selectedDay) {
  //   var jalaliDay = MandaDateBuilder.jalaliDayForSelectedDay(selectedDay);
  //   var shamsiDay = jalaliDay.day;
  //   var shamsiDayInMonth = jalaliDay.monthLength;

  //   DateTime startMonth = DateTime(selectedDay.year, selectedDay.month,
  //       selectedDay.day - shamsiDay + 1, 0, 0);

  //   DateTime endMonth = DateTime(startMonth.year, startMonth.month,
  //       startMonth.day + shamsiDayInMonth - 1, 0, 0);

  //   Map data = {
  //     'first': startMonth,
  //     'last': endMonth,
  //     'jalaliDay': jalaliDay,
  //     'dayInMonth': shamsiDayInMonth,
  //     'month': jalaliDay.month,
  //     'year': jalaliDay.year,
  //     'monthFaAr': jalaliDay.formatter.mN,
  //     'monthEn': MandaEqu.jalaliMonth(jalaliDay.month),
  //     'kind': 'shamsi'
  //   };
  //   return data;
  // }

  // static getNumDayOdWeek(String day) {
  //   Map daysWeek = {
  //     "Sun": 0,
  //     "Mon": 1,
  //     "Tue": 2,
  //     "Wed": 3,
  //     "Thu": 4,
  //     "Fri": 5,
  //     "Sat": 6,
  //   };
  //   return daysWeek[day];
  // }

  // static beforeLoop(DateTime startMonth, int endOfLoop) {
  //   List dateList = [];
  //   // List allDateLebelList = [];
  //   for (var i = 0; i < endOfLoop; i++) {
  //     dateList.add([
  //       DateTime(startMonth.year, startMonth.month,
  //           startMonth.day - endOfLoop + i, 0, 0),
  //       ""
  //     ]);
  //     // allDateLebelList.add("");
  //   }
  //   return dateList;
  // }

  // static monthLoop(DateTime startMonth, int endOfLoop) {
  //   List dateList = [];
  //   int dayIndex = 1;
  //   // List allDateLebelList = [];
  //   for (var i = 0; i <= endOfLoop - 1; i++) {
  //     dateList.add([
  //       DateTime(startMonth.year, startMonth.month, startMonth.day + i, 0, 0),
  //       dayIndex.toString()
  //     ]);
  //     // allDateLebelList.add(dayIndex.toString());
  //     dayIndex += 1;
  //   }
  //   return dateList;
  // }

  // static afterLoop(DateTime endMonth, int endOfLoop) {
  //   List dateList = [];
  //   //  List allDateLebelList = [];
  //   for (var i = 1; i <= endOfLoop; i++) {
  //     dateList.add([
  //       DateTime(endMonth.year, endMonth.month, endMonth.day + i, 0, 0),
  //       ""
  //     ]);
  //     // allDateLebelList.add(" ");
  //   }
  //   return dateList;
  // }

  // static holidaysEventsMonthBuilder(data, monthDateList) {
  //   int monthEvent = data.mandaMonth.info["month"];
  //   var test = mandaEventsDateBase(monthEvent);
  //   // print(test);
  // }

  static Map mandaEventsDateBase(monthEvent) {
    final List firstMonthEventName = MandaEqu.mandaFirstMonth();
    final List lightDayEventName = MandaEqu.mandaLightMbattal();
    final List heavyDayEventName = MandaEqu.mandaHeavyMbattal();
    final Map mandaFeast = MandaEqu.mandaFeast();

    Map mandaEventsDate = {
      1: {
        1: [lightDayEventName[0], firstMonthEventName[0]]
      },
      2: {1: firstMonthEventName},
      3: {
        1: [firstMonthEventName[0], mandaFeast['yahya']],
        2: heavyDayEventName
      },
      4: {
        1: firstMonthEventName,
        28: lightDayEventName,
        29: lightDayEventName,
        30: [mandaFeast['kenshi']]
      },
      5: {
        1: [lightDayEventName[0], firstMonthEventName[0], mandaFeast['eidBig']],
        2: [lightDayEventName[0], mandaFeast['kersa']],
        3: lightDayEventName,
        4: lightDayEventName,
        5: lightDayEventName,
        6: [heavyDayEventName[0], mandaFeast['shoshian'][0]],
        7: [heavyDayEventName[0], mandaFeast['shoshian'][1]],
        8: lightDayEventName,
        9: lightDayEventName,
        10: lightDayEventName,
        11: lightDayEventName,
        12: lightDayEventName,
        13: lightDayEventName,
        14: lightDayEventName,
        22: lightDayEventName,
      },
      6: {1: firstMonthEventName, 25: lightDayEventName},
      7: {1: firstMonthEventName},
      8: {
        1: [lightDayEventName[0], firstMonthEventName[0], mandaFeast['alfil']],
        2: lightDayEventName,
        3: lightDayEventName,
        4: lightDayEventName,
        18: [mandaFeast['eidSmall']]
      },
      9: {1: firstMonthEventName},
      10: {
        1: [firstMonthEventName[0], mandaFeast['ashoreh']],
        9: lightDayEventName,
        15: lightDayEventName,
        23: lightDayEventName
      },
      11: {1: firstMonthEventName},
      12: {
        1: firstMonthEventName,
        26: heavyDayEventName,
        27: heavyDayEventName,
        28: heavyDayEventName,
        29: heavyDayEventName,
        30: heavyDayEventName,
        31: [mandaFeast['banja'][0]],
        32: [mandaFeast['banja'][1]],
        33: [mandaFeast['banja'][2]],
        34: [mandaFeast['banja'][3]],
        35: [mandaFeast['banja'][4]]
      },
      13: {
        1: [mandaFeast['banja'][0]],
        2: [mandaFeast['banja'][1]],
        3: [mandaFeast['banja'][2]],
        4: [mandaFeast['banja'][3]],
        5: [mandaFeast['banja'][4]]
      },
    };
    return mandaEventsDate[monthEvent];
  }
}
