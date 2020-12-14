import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mandaean_calendar/manda_events.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Test1stMonth.creatEventUsingFun(0, 3000);

  Test1stMonth.comperSpeedOldAndNewFun(2020, 100);

  print("Done  " * 20);
}

class Test1stMonth {
  static void creatEventUsingFun(int fromYear, int for_how_many_years) {
    int toYear = fromYear + for_how_many_years;
    int mandaYearIndex = 0;
    int passingIndex = 0;
    for (var yy = fromYear; yy < toYear; yy++) {
      Map eventDateFun = MandaEventssBuilder(yy).wholeYear;
      List bataData = testDataBaseEvent(yy);

      List newFunDate = [];
      List newBataDate = [];
      eventDateFun.forEach((date, value) {
        if (date.year == yy) {
          newFunDate.add(date);
        }
      });
      bataData.forEach((date) {
        if (date.year == yy) {
          newBataDate.add(date);
        }
      });
      newBataDate = newBataDate.toSet().toList();
      passingIndex += 1;
      print(passingIndex);
      assert(listEquals(newFunDate, newBataDate), true);
    }
  }

  static void comperSpeedOldAndNewFun(int fromYear, int for_how_many_years) {
    var durationOldFun = DateTime(2020, 01, 01, 0, 0);
    var durationNewFun = DateTime(2020, 01, 01, 0, 0);
    Stopwatch stopwatch = new Stopwatch()..start();
    int toYear = fromYear + for_how_many_years;
    for (var yy = fromYear; yy < toYear; yy++) {
      durationNewFun = durationNewFun.add(-stopwatch.elapsed);
      Map<DateTime, List> newFun = MandaEventssBuilder(yy).wholeYear;
      durationNewFun = durationNewFun.add(stopwatch.elapsed);
    }
    //// Old Function
    // stopwatch = new Stopwatch()..stop();
    // stopwatch = new Stopwatch()..start();
    // for (var yy = fromYear; yy < toYear; yy++) {
    //   durationOldFun = durationOldFun.add(-stopwatch.elapsed);
    //   MandaPanja panjaDate = new MandaPanja(yy);
    //   Map<DateTime, List> oldFun = MandaEvents.mandaEventsForYear(panjaDate);

    //   durationOldFun = durationOldFun.add(stopwatch.elapsed);
    // }
    print("durationOldFun: $durationOldFun");
    print("durationNewFun: $durationNewFun");
  }

  static testDataBaseEvent(int year) {
    int diffInDay = 365 * year;
    List eventList = [];
    int fromYear = year - 3;
    int toYear = year + 3;
    for (var yy = fromYear; yy < toYear; yy++) {
      int diffInDay = 365 * yy;
      eventList = eventList +
          [
            DateTime(0, 1, 13 + diffInDay, 0, 0),
            DateTime(0, 2, 18 + diffInDay, 0, 0),
            DateTime(0, 2, 19 + diffInDay, 0, 0),
            DateTime(0, 2, 20 + diffInDay, 0, 0),
            DateTime(0, 2, 21 + diffInDay, 0, 0),
            DateTime(0, 3, 6 + diffInDay, 0, 0),
            DateTime(0, 4, 18 + diffInDay, 0, 0),
            DateTime(0, 4, 26 + diffInDay, 0, 0),
            DateTime(0, 5, 2 + diffInDay, 0, 0),
            DateTime(0, 5, 10 + diffInDay, 0, 0),
            DateTime(0, 7, 12 + diffInDay, 0, 0),
            DateTime(0, 7, 13 + diffInDay, 0, 0),
            DateTime(0, 7, 14 + diffInDay, 0, 0),
            DateTime(0, 7, 15 + diffInDay, 0, 0),
            DateTime(0, 7, 16 + diffInDay, 0, 0),
            DateTime(0, 7, 17 + diffInDay, 0, 0),
            DateTime(0, 7, 18 + diffInDay, 0, 0),
            DateTime(0, 7, 19 + diffInDay, 0, 0),
            DateTime(0, 7, 20 + diffInDay, 0, 0),
            DateTime(0, 7, 21 + diffInDay, 0, 0),
            DateTime(0, 7, 22 + diffInDay, 0, 0),
            DateTime(0, 9, 20 + diffInDay, 0, 0),
            DateTime(0, 9, 21 + diffInDay, 0, 0),
            DateTime(0, 11, 16 + diffInDay, 0, 0),
            DateTime(0, 11, 17 + diffInDay, 0, 0),
            DateTime(0, 11, 18 + diffInDay, 0, 0),
            DateTime(0, 11, 19 + diffInDay, 0, 0),
            DateTime(0, 11, 20 + diffInDay, 0, 0),
            DateTime(0, 11, 21 + diffInDay, 0, 0),
            DateTime(0, 11, 22 + diffInDay, 0, 0),
            DateTime(0, 11, 23 + diffInDay, 0, 0),
            DateTime(0, 11, 24 + diffInDay, 0, 0),
            DateTime(0, 11, 25 + diffInDay, 0, 0),
            DateTime(0, 11, 26 + diffInDay, 0, 0),
            DateTime(0, 11, 27 + diffInDay, 0, 0),
            DateTime(0, 11, 28 + diffInDay, 0, 0),
            DateTime(0, 11, 29 + diffInDay, 0, 0),
            DateTime(0, 11, 30 + diffInDay, 0, 0),
            DateTime(0, 12, 1 + diffInDay, 0, 0),
            DateTime(0, 12, 2 + diffInDay, 0, 0),
            DateTime(0, 12, 10 + diffInDay, 0, 0),
            DateTime(1, 1, 12 + diffInDay, 0, 0)
          ];
    }
    return eventList;
  }
}
