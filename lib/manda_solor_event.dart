import 'package:shamsi_date/shamsi_date.dart';
import 'manda_events.dart';
import 'manda_holidays.dart';
import 'manda_panja.dart';

class SorlEvents {
  static generateEventSol(selectedYear) {
    // Jalali j = Jalali(1397, 5, 6);
    // convert to Gregorian:
    // Gregorian j2g1 = j.toGregorian(); // -> 2018/8/28
    int selectedYear2 = selectedYear + 1;
    Jalali firstDayJ = Jalali(selectedYear, 1, 1);
    Jalali lastDayJ = Jalali(selectedYear2, 1, 1);
    firstDayJ = firstDayJ.addDays(-1);
    Gregorian firstDay2g = firstDayJ.toGregorian();
    DateTime firstDay =
        DateTime(firstDay2g.year, firstDay2g.month, firstDay2g.day);
    Gregorian lastDay2g = lastDayJ.toGregorian();
    DateTime lastDay = DateTime(lastDay2g.year, lastDay2g.month, lastDay2g.day);
    var events1 = generateEventGeo(firstDay2g.year);
    var events2 = generateEventGeo(lastDay2g.year);
    Map<DateTime, List> events = {};
    Map<DateTime, List> firstOfMonth = {};
    Map<DateTime, List> solrEvent = {};
    Map<DateTime, List> solrFirstOfMonth = {};
    events.addAll(events1[0]);
    events.addAll(events2[0]);

    firstOfMonth.addAll(events1[1]);
    firstOfMonth.addAll(events2[1]);

    // var beginOfMonth = events1[1] + events2[1];
    var dateEvents = events.keys.toList();
    var dateFirstOfMonth = firstOfMonth.keys.toList();

    dateEvents.forEach((date) {
      if (firstDay.isBefore(date) && lastDay.isAfter(date)) {
        solrEvent[date] = events[date];
      }
    });
    // assert(solrEvent.length == 41);

    dateFirstOfMonth.forEach((date) {
      if (firstDay.isBefore(date) && lastDay.isAfter(date)) {
        solrFirstOfMonth[date] = firstOfMonth[date];
      }
    });
    assert(solrFirstOfMonth.length == 12);
    return [solrEvent, solrFirstOfMonth];
  }

  static generateEventGeo(selectedYear) {
    DateTime selectedDay = DateTime(selectedYear, 1, 1);
    // var mandaFirstOfMonth = MandaHolidays.holidays(selectedDay);
    var mandaFirstOfMonth =
        MandaFirstDayOfMonthBuilder(selectedYear).eventsForWholeYear;

    // MandaPanja panjaDate = MandaPanja(selectedDay.year);
    // var events = MandaEvents.mandaEventsForYear(panjaDate);
    var events = MandaEventssBuilder(selectedDay.year).wholeYear;

    return [events, mandaFirstOfMonth];
  }
}
