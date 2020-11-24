import 'manda_date.dart';
import 'manda_equivalent.dart';

class MandaFirstDayOfMonthBuilder {
  Map<DateTime, List> eventsForWholeYear;
  List manda1stMonthWithGDate;
  MandaFirstDayOfMonthBuilder(int selectedYear) {
    this.eventsForWholeYear = find1stDayofMonth(selectedYear);
  }
  static Map<DateTime, List> find1stDayofMonth(int selectedYear) {
    //// Find New Year of each year then find the first day of Manda month
    /// for Jan then add 30 days to find next month go on until new year of
    /// nex year. It could be 12 or 13 first day of Manda month on one year
    /// Panja month =13, Max Day=5
    /// Othe month < 12 and Max day =30
    Map<DateTime, List> wholeYear1stMonth = {};

    final List eventName = MandaEqu.mandaFirstMonth();

    DateTime dateFirstOfManda;
    List mandaMatchNewYear = forMonthInYear(1, selectedYear);
    dateFirstOfManda = mandaMatchNewYear[0];
    int mandaMonth = mandaMatchNewYear[1];

    int durationInDay = 0;

    for (var mm = 1; mm < 14; mm++) {
      dateFirstOfManda = DateTime(dateFirstOfManda.year, dateFirstOfManda.month,
          dateFirstOfManda.day + durationInDay, 0, 0);

      if (dateFirstOfManda.year == selectedYear) {
        wholeYear1stMonth[dateFirstOfManda] = eventName;
      }

      mandaMonth += 1;
      durationInDay = 30;
      if (mandaMonth > 12) {
        mandaMonth = 1;
        durationInDay = 35;
      }
    }

    return wholeYear1stMonth;
  }

  static List forMonthInYear(int selectedMonth, int selectedYear) {
    var newGYear;
    DateTime dateFirstOfManda;
    newGYear = DateTime(selectedYear, selectedMonth, 1, 0, 0);
    MandaDateBuilder mandaDateThatMatchSelectedMonth =
        MandaDateBuilder(newGYear);
    int mandaMonth = mandaDateThatMatchSelectedMonth.month;
    int mandaDay = mandaDateThatMatchSelectedMonth.day;

    int day = 0;
    if (mandaMonth == 13) {
      day = 6 - mandaDay;
      mandaMonth = 1;
    } else if (mandaDay != 1) {
      day = 31 - mandaDay;
      if (mandaMonth == 12) {
        day = day + 5;
        mandaMonth = 0;
      }
      mandaMonth += 1;
    }

    dateFirstOfManda = DateTime(selectedYear, selectedMonth, 1 + day, 0, 0);
    return [dateFirstOfManda, mandaMonth];
  }

  static roundTo24(DateTime date, int diff) {
    return date.add(Duration(hours: 24 - diff));
  }
}
