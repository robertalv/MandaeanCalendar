import 'package:intl/intl.dart';

import 'manda_date.dart';
import 'manda_equivalent.dart';

class CalendarDateBuilder {
  static manda(var data) {
    // print('CALLBACK: _MandaDateBuilder');
    DateTime selectedDay = data.selected.date;
    MandaDateBuilder mandaDate = MandaDateBuilder(selectedDay);

    Map beforeDateList = {};
    Map monthDateList = {};
    Map afterDateList = {};
    Map allDateList = {};

    var mandaDay = mandaDate.day;
    var mandaMonth = mandaDate.month;
    var mandaDayInMonth = 30;

    if (mandaMonth == 13) {
      mandaDayInMonth = 35;
      mandaDate = MandaDateBuilder(selectedDay.add(Duration(days: 6)));
    } else if (mandaMonth == 1) {
      mandaDayInMonth = 35;
      mandaDay = mandaDay + 5;
    }

    DateTime startMonth = DateTime(selectedDay.year, selectedDay.month,
        selectedDay.day - mandaDay + 1, 0, 0);

    DateTime endMonth = DateTime(startMonth.year, startMonth.month,
        startMonth.day + mandaDayInMonth - 1, 0, 0);

    data.mandaMonth.info = {
      'first': startMonth,
      'last': endMonth,
      'dayInMonth': mandaDayInMonth,
      'month': mandaDate.month,
      'yahya': mandaDate.yearYahya,
      'adam': mandaDate.yearAdam,
      'monthFaAr': mandaDate.monthFa,
      'monthEn': mandaDate.monthEn,
      'selectedDay': [selectedDay, mandaDate.day, 'm'],
      'kind': 'manda'
    };

    // print("startDate $startMonth");
    // print("data.mandaMonth.info ${data.mandaMonth.info}");
    // print("data.mandaMonth.info ${data.mandaMonth.info['month']}");

    var day = DateFormat.E("en_US").format(startMonth);
    int beforeDayIndex = getNumDayOdWeek(day);
    // print(day);
    // print(beforeDayIndex);

    beforeDateList = beforeLoop(startMonth, beforeDayIndex);
    // print(beforeDateList);
    if (mandaDayInMonth == 30) {
      monthDateList = monthLoop(startMonth, mandaDayInMonth, 'm');
    } else {
      monthDateList = monthPanjaLoop(startMonth, mandaDayInMonth);
    }

    day = DateFormat.E("en_US").format(endMonth);
    int afterDayIndex = 6 - getNumDayOdWeek(day);
    // print(day);
    // print(afterDayIndex);

    afterDateList = afterLoop(endMonth, afterDayIndex);
    // print(afterDateList);

    allDateList.addAll(beforeDateList);
    allDateList.addAll(monthDateList);
    allDateList.addAll(afterDateList);
    // print(allDateList);
    // print(allDateLebelList);
    return allDateList;
  }

  static greg(var data) {
    // print('CALLBACK: _GregDateBuilder');
    DateTime selectedDay = data.selected.date;
    Map beforeDateList = {};
    Map monthDateList = {};
    Map afterDateList = {};
    Map allDateList = {};

    DateTime startMonth =
        DateTime(selectedDay.year, selectedDay.month, 1, 0, 0);
    DateTime endMonth =
        DateTime(selectedDay.year, selectedDay.month + 1, 0, 0, 0);

    data.gregMonth.info = {
      'first': startMonth,
      'last': endMonth,
      'selectedDay': [selectedDay, selectedDay.day, 'g'],
      'kind': 'greg'
    };
    var day = DateFormat.E("en_US").format(startMonth);
    int beforeDayIndex = getNumDayOdWeek(day);

    beforeDateList = beforeLoop(startMonth, beforeDayIndex);

    int dayInMonth = endMonth.day;
    monthDateList = monthLoop(startMonth, dayInMonth, 'g');
    // print(monthDateList);

    day = DateFormat.E("en_US").format(endMonth);
    int afterDayIndex = 6 - getNumDayOdWeek(day);
    // print(day);
    // print(afterDayIndex);

    afterDateList = afterLoop(endMonth, afterDayIndex);
    // print(afterDateList);

    allDateList.addAll(beforeDateList);
    allDateList.addAll(monthDateList);
    allDateList.addAll(afterDateList);
    // print(allDateList);
    // print(allDateLebelList);
    return allDateList;
  }

  static shamsi(var data) {
    // print('CALLBACK: _MandaDateBuilder');
    DateTime selectedDay = data.selected.date;
    var jalaliDay = MandaDateBuilder.jalaliDayForSelectedDay(selectedDay);

    Map beforeDateList = {};
    Map monthDateList = {};
    Map afterDateList = {};
    Map allDateList = {};

    var shamsiDay = jalaliDay.day;
    // print('shamsiDay: $shamsiDay');
    var shamsiDayInMonth = jalaliDay.monthLength;

    DateTime startMonth = DateTime(selectedDay.year, selectedDay.month,
        selectedDay.day - shamsiDay + 1, 0, 0);

    DateTime endMonth = DateTime(startMonth.year, startMonth.month,
        startMonth.day + shamsiDayInMonth - 1, 0, 0);

    data.shamsiMonth.info = {
      'first': startMonth,
      'last': endMonth,
      'jalaliDay': jalaliDay,
      'dayInMonth': shamsiDayInMonth,
      'month': jalaliDay.month,
      'year': jalaliDay.year,
      'monthFaAr': jalaliDay.formatter.mN,
      'monthEn': MandaEqu.jalaliMonth(jalaliDay.month),
      'selectedDay': [selectedDay, jalaliDay.day, 's'],
      'kind': 'shamsi'
    };

    // print("startDate $startMonth");
    // print("jalaliDay $jalaliDay");

    var day = DateFormat.E("en_US").format(startMonth);
    int beforeDayIndex = getNumDayOdWeek(day);
    // print(day);
    // print(beforeDayIndex);

    beforeDateList = beforeLoop(startMonth, beforeDayIndex);
    // print(beforeDateList);

    monthDateList = monthLoop(startMonth, shamsiDayInMonth, 's');
    // print(monthDateList);

    day = DateFormat.E("en_US").format(endMonth);
    int afterDayIndex = 6 - getNumDayOdWeek(day);
    // print(day);
    // print(afterDayIndex);

    afterDateList = afterLoop(endMonth, afterDayIndex);
    // print(afterDateList);

    allDateList.addAll(beforeDateList);
    allDateList.addAll(monthDateList);
    allDateList.addAll(afterDateList);
    // print(allDateList);
    // print(allDateLebelList);
    return allDateList;
    ;
  }

  static beforeLoop(DateTime startMonth, int endOfLoop) {
    // List dateList = [];
    Map dateMap = {};
    // List allDateLebelList = [];
    for (var i = 0; i < endOfLoop; i++) {
      // ###### new
      DateTime selectedDate = DateTime(startMonth.year, startMonth.month,
          startMonth.day - endOfLoop + i, 0, 0);
      dateMap[selectedDate] = [selectedDate, ''];
      // ###### new
      // dateList.add([
      //   DateTime(startMonth.year, startMonth.month,
      //       startMonth.day - endOfLoop + i, 0, 0),
      //   ""
      // ]);

    }

    return dateMap;
  }

  static monthPanjaLoop(DateTime startMonth, int endOfLoop) {
    // List dateList = [];
    int dayIndex = 1;
    String displayDay;
    Map dateMap = {};
    // List allDateLebelList = [];
    for (var i = 0; i <= endOfLoop - 1; i++) {
      displayDay = dayIndex.toString();
      if (i < 5) {
        displayDay = "Panja";
      } else {
        dayIndex += 1;
      }
      // ###### new
      DateTime selectedDate =
          DateTime(startMonth.year, startMonth.month, startMonth.day + i, 0, 0);
      dateMap[selectedDate] = [selectedDate, displayDay, 'm'];
      // ###### new

      // dateList.add([
      //   DateTime(startMonth.year, startMonth.month, startMonth.day + i, 0, 0),
      //   displayDay
      // ]);

    }
    return dateMap;
  }

  static monthLoop(DateTime startMonth, int endOfLoop, String kind) {
    // List dateList = [];
    int dayIndex = 1;
    Map dateMap = {};
    // List allDateLebelList = [];
    for (var i = 0; i <= endOfLoop - 1; i++) {
// ###### new
      DateTime selectedDate =
          DateTime(startMonth.year, startMonth.month, startMonth.day + i, 0, 0);
      dateMap[selectedDate] = [selectedDate, dayIndex.toString(), kind];
      // ###### new

      // dateList.add([
      //   DateTime(startMonth.year, startMonth.month, startMonth.day + i, 0, 0),
      //   dayIndex.toString(),
      //   kind
      // ]);
      dayIndex += 1;
    }
    return dateMap;
  }

  static afterLoop(DateTime endMonth, int endOfLoop) {
    // List dateList = [];
    Map dateMap = {};
    //  List allDateLebelList = [];
    for (var i = 1; i <= endOfLoop; i++) {
      // ###### new
      DateTime selectedDate =
          DateTime(endMonth.year, endMonth.month, endMonth.day + i, 0, 0);
      dateMap[selectedDate] = [selectedDate, ''];
      // ###### new

      // dateList.add([
      //   DateTime(endMonth.year, endMonth.month, endMonth.day + i, 0, 0),
      //   ""
      // ]);
    }
    return dateMap;
  }

  static getNumDayOdWeek(String day) {
    Map daysWeek = {
      "Sun": 0,
      "Mon": 1,
      "Tue": 2,
      "Wed": 3,
      "Thu": 4,
      "Fri": 5,
      "Sat": 6,
    };
    return daysWeek[day];
  }
}

class StartOfMonth {
  DateTime value;

  DateTime get date {
    return value;
  }

  set date(DateTime date) {
    this.value = date;
  }
}

class EndOfMonth {
  DateTime value;

  DateTime get date {
    return value;
  }

  set date(DateTime date) {
    this.value = date;
  }
}
