import 'package:intl/intl.dart';

class CalendarDateBuilder {
  // DateTime selectedDay;

  // GregDayBuilder(selectedDay) {
  //   this.selectedDay = selectedDay;
  // }

  static manda(DateTime selectedDay) {
    print('CALLBACK: _MandaDateBuilder');
    List beforeDateList = [];
    List monthDateList = [];
    List afterDateList = [];
    List allDateList = [];
    // List allDateLebelList = [];
    DateTime today = selectedDay;
    var mandaDay = 11;
    var mandaDayInMonth = 30;
    // // 11 Sartana(10) == 24 Dec(12)
    // today = DateTime(2021, 7, 1, 0, 0);
    // print("selectedDay $selectedDay");
    DateTime startMonth =
        DateTime(today.year, today.month, today.day - mandaDay + 1, 0, 0);
    DateTime endMonth = DateTime(startMonth.year, startMonth.month,
        startMonth.day + mandaDayInMonth - 1, 0, 0);
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

  static greg(DateTime selectedDay) {
    print('CALLBACK: _GregDateBuilder');
    List beforeDateList = [];
    List monthDateList = [];
    List afterDateList = [];
    List allDateList = [];
    DateTime today = selectedDay;
    // today = DateTime(2021, 7, 1, 0, 0);
    DateTime startMonth = DateTime(today.year, today.month, 1, 0, 0);
    DateTime endMonth = DateTime(today.year, today.month + 1, 0, 0, 0);
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
