// import 'package:intl/intl.dart';
import 'manda_base.dart';
import 'manda_date.dart';
import 'manda_holidays.dart';

class MandaEventssBuilder {
  Map<DateTime, List> wholeYear;

  MandaEventssBuilder(selectedYear) {
    wholeYear = forWholeYear(selectedYear);
  }

  static Map<DateTime, List> forWholeYear(int selectedYear) {
    var eventsBaseDate = MandaBaseDate.mandaEventsDateBase();
    Map mandaEventMonth;
    int mandaMonth;
    DateTime date1stOfMonth;
    Map<DateTime, List> eventsDate = {};
    Map<DateTime, List> yearEventsDate = {};
    List firstDayOfMonthYear = create1StMonthForWholeYear(selectedYear);

    firstDayOfMonthYear.forEach((monthAndDateOf1stMonth) {
      mandaMonth = monthAndDateOf1stMonth[0];
      date1stOfMonth = monthAndDateOf1stMonth[1];

      mandaEventMonth = eventsBaseDate[mandaMonth];
      mandaEventMonth.forEach((eventDate, eventName) {
        // print(eventDate);
        // print(eventName);
        DateTime mandaEvenDate = DateTime(date1stOfMonth.year,
            date1stOfMonth.month, date1stOfMonth.day + eventDate - 1, 0, 0);
        // print(mandaEvenDate);
        if (mandaEvenDate.year == selectedYear) {
          eventsDate[mandaEvenDate] = eventName;
        }
      });
      yearEventsDate.addAll(eventsDate);
    });
    return yearEventsDate;
  }

  static create1StMonthForWholeYear(selectedYear) {
    List manda1stMonthWithGDate = [];
    List manda1stDateAndMonth;
    DateTime firstOfManda = DateTime(selectedYear, 1, 1, 0, 0);
    int monthIndex = 12;
    while (firstOfManda.year != selectedYear - 1) {
      manda1stDateAndMonth = MandaFirstDayOfMonthBuilder.forMonthInYear(
          monthIndex, selectedYear - 1);
      firstOfManda = manda1stDateAndMonth[0];
      monthIndex -= 1;
    }

    int mandaMonth = manda1stDateAndMonth[1];

    int durationInDay = 0;

    for (var mm = 1; mm < 15; mm++) {
      DateTime nextFirstOfManda = DateTime(firstOfManda.year,
          firstOfManda.month, firstOfManda.day + durationInDay, 0, 0);
      manda1stMonthWithGDate.add([mandaMonth, nextFirstOfManda]);
      firstOfManda = nextFirstOfManda;

      mandaMonth += 1;
      durationInDay = 30;
      if (mandaMonth > 12) {
        mandaMonth = 1;
        durationInDay = 35;
      }
    }
    return manda1stMonthWithGDate;
  }

  static forGivenMonth(int selectedMonth, int selectedYear) {
    Map<DateTime, List> monthEventsList = {};
    var eventsBaseDate = MandaBaseDate.mandaEventsDateBase();

    int daysInMonth = DateTime(selectedYear, selectedMonth + 1, 0, 0, 0).day;

    // print("firstMonth $firstMonth");
    // print("daysInMonth $daysInMonth");
    for (var i = 0; i < daysInMonth; i++) {
      DateTime selectedDay = DateTime(selectedYear, selectedMonth, 1 + i, 0, 0);
      MandaDateBuilder mandaDate = MandaDateBuilder(selectedDay);
      int mandaDay = mandaDate.day;
      int mandaMonth = mandaDate.month;
      Map monthEvents = eventsBaseDate[mandaMonth];
      if (monthEvents.isNotEmpty) {
        if (monthEvents[mandaDay] != null) {
          // print("key $mandaDay");
          // print("selectedDay $selectedDay");
          monthEventsList[selectedDay] = monthEvents[mandaDay];
          // monthEventsList.add([selectedDay, monthEvents[mandaDay]]);
        }
      }
    }
    return monthEventsList;
  }
  ///// toke longer in run
  ///
  // static formToGiveMonth(DateTime firstDate, DateTime secondDate) {
  //   Map<DateTime, List> mandaEventsMap = {};
  //   DateTime selectedDay = firstDate;
  //   int index = 0;
  //   while (selectedDay.year <= secondDate.year &&
  //       selectedDay.month <= secondDate.month) {
  //     mandaEventsMap
  //         .addAll(forGivenMonth2(selectedDay.month, selectedDay.year));
  //     index += 1;
  //     selectedDay =
  //         DateTime(selectedDay.year, selectedDay.month + index, 1, 0, 0);
  //   }
  // }

  // static forGivenMonth2(int selectedMonth, int selectedYear) {
  //   Map<DateTime, List> monthEventsMap = {};
  //   DateTime selectedDay;
  //   List givenMandaMonthEventsLast;

  //   DateTime firstDay = DateTime(selectedYear, selectedMonth, 1, 0, 0);
  //   DateTime lastDayPlus = DateTime(selectedYear, selectedMonth + 1, 1, 0, 0);

  //   selectedDay = firstDay;

  //   while (selectedDay.isBefore(lastDayPlus)) {
  //     MandaDateBuilder mandaDate = MandaDateBuilder(selectedDay);
  //     givenMandaMonthEventsLast =
  //         getEventsForGivenMandaMonth(selectedDay, mandaDate);
  //     // print(givenMandaMonthEventsLast[0]);
  //     if (givenMandaMonthEventsLast[0].isNotEmpty) {
  //       monthEventsMap.addAll(givenMandaMonthEventsLast[0]);
  //     }
  //     // print(monthEventsMap);
  //     selectedDay = givenMandaMonthEventsLast[1];
  //   }
  //   return monthEventsMap;
  // }

  // static getEventsForGivenMandaMonth(DateTime first, var mandaDate) {
  //   int mandaDay = mandaDate.day;
  //   int mandaMonth = mandaDate.month;
  //   Map monthEvents = MandaBaseDate.mandaHolidaysEventsDateBase(mandaMonth);
  //   DateTime selectedDay = first;
  //   Map<DateTime, List> eventsMap = {};
  //   int mandaMonthLinght = 30;
  //   if (mandaMonth == 13) {
  //     mandaMonthLinght = 5;
  //   }

  //   monthEvents.forEach((day, event) {
  //     if (day - mandaDay >= 0) {
  //       selectedDay =
  //           DateTime(first.year, first.month, first.day + day - mandaDay, 0, 0);
  //       if (selectedDay.month == first.month) {
  //         eventsMap[selectedDay] = event;
  //       }
  //     }
  //   });
  //   selectedDay = DateTime(first.year, first.month,
  //       first.day + mandaMonthLinght - mandaDay + 1, 0, 0);
  //   return [eventsMap, selectedDay];
  // }
}
