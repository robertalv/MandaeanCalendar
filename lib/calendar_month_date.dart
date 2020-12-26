import 'package:intl/intl.dart';

import 'manda_date.dart';
import 'manda_equivalent.dart';

class CalendarDateBuilder {
  // DateTime selectedDay;
  // DateTime today;
  // List mandaMonthDate;
  // List gregMonthDate;
  // DateTime endOfMonth;
  // DateTime startOfMonth;

  // CalendarDateBuilder(selectedDay) {

  //   this.selectedDay = selectedDay;
  //   this.today = getToday();
  //   this.gregMonthDate = greg(selectedDay);
  //   this.endOfMonth =  _start.date;
  //   this.startOfMonth = startOfMonth;

  // }

  // static getToday() {
  //   DateTime todayNow = DateTime.now();
  //   DateTime today =
  //       DateTime(todayNow.year, todayNow.month, todayNow.day, 0, 0);
  //   return today;
  // }

  static manda(var data) {
    print('CALLBACK: _MandaDateBuilder');
    DateTime selectedDay = data.selected.date;
    MandaDateBuilder mandaDate = MandaDateBuilder(selectedDay);

    List beforeDateList = [];
    List monthDateList = [];
    List afterDateList = [];
    List allDateList = [];
    // List allDateLebelList = [];
    // DateTime today = selectedDay;

    // // 11 Sartana(10) == 24 Dec(12)
    // today = DateTime(2021, 7, 1, 0, 0);
    // print("selectedDay $selectedDay");
    // var mandaDay = 11;
    // var mandaDayInMonth = 30;

    var mandaDay = mandaDate.day;
    var mandaDayInMonth = 30;
    if (mandaDate.month > 11) {
      mandaDayInMonth = 35;
    }
    DateTime startMonth = DateTime(selectedDay.year, selectedDay.month,
        selectedDay.day - mandaDay + 1, 0, 0);

    DateTime endMonth = DateTime(startMonth.year, startMonth.month,
        startMonth.day + mandaDayInMonth - 1, 0, 0);

    // data.first.date = startMonth;
    // data.last.date = endMonth;
    data.mandaMonth.info = {
      'first': startMonth,
      'last': endMonth,
      'dayInMonth': mandaDayInMonth,
      'month': mandaDate.month,
      'yahya': mandaDate.yearYahya,
      'adam': mandaDate.yearAdam,
      'monthFaAr': mandaDate.monthFa,
      'monthEn': mandaDate.monthEn,
      'kind': 'manda'
    };

    // print("startDate $startMonth");
    // print("endDate $endMonth");

    var day = DateFormat.E("en_US").format(startMonth);
    int beforeDayIndex = getNumDayOdWeek(day);
    // print(day);
    // print(beforeDayIndex);

    beforeDateList = beforeLoop(startMonth, beforeDayIndex);
    // print(beforeDateList);

    monthDateList = monthLoop(startMonth, mandaDayInMonth);
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

  static greg(var data) {
    print('CALLBACK: _GregDateBuilder');
    DateTime selectedDay = data.selected.date;
    List beforeDateList = [];
    List monthDateList = [];
    List afterDateList = [];
    List allDateList = [];
    // DateTime today = selectedDay;
    // today = DateTime(2021, 7, 1, 0, 0);
    DateTime startMonth =
        DateTime(selectedDay.year, selectedDay.month, 1, 0, 0);
    DateTime endMonth =
        DateTime(selectedDay.year, selectedDay.month + 1, 0, 0, 0);
    // data.first.date = startMonth;
    // data.last.date = endMonth;
    data.gregMonth.info = {
      'first': startMonth,
      'last': endMonth,
      'kind': 'greg'
    };
    var day = DateFormat.E("en_US").format(startMonth);
    int beforeDayIndex = getNumDayOdWeek(day);

    beforeDateList = beforeLoop(startMonth, beforeDayIndex);

    int dayInMonth = endMonth.day;
    monthDateList = monthLoop(startMonth, dayInMonth);
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
    print('CALLBACK: _MandaDateBuilder');
    DateTime selectedDay = data.selected.date;
    var jalaliDay = MandaDateBuilder.jalaliDayForSelectedDay(selectedDay);
    // MandaDateBuilder mandaDate = MandaDateBuilder(selectedDay);

    List beforeDateList = [];
    List monthDateList = [];
    List afterDateList = [];
    List allDateList = [];

    var shamsiDay = jalaliDay.day;
    print('shamsiDay: $shamsiDay');
    var shamsiDayInMonth = jalaliDay.monthLength;
    print('shamsiDayInMonth: $shamsiDayInMonth');
    // if (mandaDate.month > 11) {
    //   mandaDayInMonth = 35;
    // }
    DateTime startMonth = DateTime(selectedDay.year, selectedDay.month,
        selectedDay.day - shamsiDay + 1, 0, 0);

    DateTime endMonth = DateTime(startMonth.year, startMonth.month,
        startMonth.day + shamsiDayInMonth - 1, 0, 0);

    // data.first.date = startMonth;
    // data.last.date = endMonth;
    data.shamsiMonth.info = {
      'first': startMonth,
      'last': endMonth,
      'dayInMonth': shamsiDayInMonth,
      'month': jalaliDay.month,
      'year': jalaliDay.year,
      'monthFaAr': jalaliDay.formatter.mN,
      'monthEn': MandaEqu.jalaliMonth(jalaliDay.month),
      'kind': 'shamsi'
    };

    // print("startDate $startMonth");
    // print("endDate $endMonth");

    var day = DateFormat.E("en_US").format(startMonth);
    int beforeDayIndex = getNumDayOdWeek(day);
    // print(day);
    // print(beforeDayIndex);

    beforeDateList = beforeLoop(startMonth, beforeDayIndex);
    // print(beforeDateList);

    monthDateList = monthLoop(startMonth, shamsiDayInMonth);
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

  static beforeLoop(DateTime startMonth, int endOfLoop) {
    List dateList = [];
    // List allDateLebelList = [];
    for (var i = 0; i < endOfLoop; i++) {
      dateList.add([
        DateTime(startMonth.year, startMonth.month,
            startMonth.day - endOfLoop + i, 0, 0),
        ""
      ]);
      // allDateLebelList.add("");
    }
    return dateList;
  }

  static monthLoop(DateTime startMonth, int endOfLoop) {
    List dateList = [];
    int dayIndex = 1;
    // List allDateLebelList = [];
    for (var i = 0; i <= endOfLoop - 1; i++) {
      dateList.add([
        DateTime(startMonth.year, startMonth.month, startMonth.day + i, 0, 0),
        dayIndex.toString()
      ]);
      // allDateLebelList.add(dayIndex.toString());
      dayIndex += 1;
    }
    return dateList;
  }

  static afterLoop(DateTime endMonth, int endOfLoop) {
    List dateList = [];
    //  List allDateLebelList = [];
    for (var i = 1; i <= endOfLoop; i++) {
      dateList.add([
        DateTime(endMonth.year, endMonth.month, endMonth.day + i, 0, 0),
        ""
      ]);
      // allDateLebelList.add(" ");
    }
    return dateList;
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
