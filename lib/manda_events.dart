// import 'package:intl/intl.dart';
import 'manda_base.dart';
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
}
