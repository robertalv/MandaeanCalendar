import 'package:MandaeanCalendar/manda_holidays.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Test1stMonth.find1stMonthUsingFun(3000);

  // var my1StMonthOfYearUsingFun =
  //     MandaFirstDayOfMonthBuilder(817).eventsForWholeYear.keys.toList();

  // Test1stMonth.comperSpeedOldAndNewFun(2020, 100);

  print("Done  " * 20);
}

class Test1stMonth {
  static void find1stMonthUsingFun(int for_how_many_years) {
    DateTime my1stMonthBase = DateTime(0, 1, 19, 0, 0);
    int mandaMonthBase = 7;
    List my1StMonthOfYearUsingFun = [];
    List my1StMonthOfYear = [];
    int durationDay;
    int index = 0;
    int passingIndex = 0;
    for (var yy = 0; yy < for_how_many_years; yy++) {
      index = 0;

      my1StMonthOfYearUsingFun =
          MandaFirstDayOfMonthBuilder(yy).eventsForWholeYear.keys.toList();
      // print(my1StMonthOfYearUsingFun);

      my1StMonthOfYearUsingFun.forEach((usingFun) {
        if (usingFun.isBefore(DateTime(yy + 1, 1, 1))) {
          passingIndex += 1;
          print(passingIndex);
          my1StMonthOfYearUsingFun;
          // print(mandaMonthBase);
          durationDay = 30;
          if (mandaMonthBase == 1) {
            durationDay = 35;
          }
          if (yy == 0 && index == 0) {
            durationDay = 0;
          }
          my1stMonthBase = my1stMonthBase.add(Duration(days: durationDay));
          // print(my1stMonthBase);
          my1StMonthOfYear.add(my1stMonthBase);
          mandaMonthBase += 1;
          if (mandaMonthBase == 13) {
            mandaMonthBase = 1;
          }
          // if (my1stMonthBase.year == 71 && my1stMonthBase.month == 10) {
          //   print("stop to watch");
          // }
          DateTime myTestBase = DateTime(my1stMonthBase.year,
              my1stMonthBase.month, my1stMonthBase.day, 0, 0);
          DateTime myTestUsingFun =
              DateTime(usingFun.year, usingFun.month, usingFun.day, 0, 0);

          if (myTestBase.toString() != myTestUsingFun.toString()) {
            print(my1stMonthBase.toString());
            print(usingFun.toString());
            print("false");
          }
          assert(myTestBase.toString() == myTestUsingFun.toString());
          index += 1;
        }
      });

      my1stMonthBase = my1StMonthOfYear.last;
      my1StMonthOfYear = [];
      my1StMonthOfYearUsingFun = [];
    }
  }

  static void comperSpeedOldAndNewFun(int fromYear, int for_how_many_years) {
    var durationOldFun = DateTime(2020, 01, 01, 0, 0);
    var durationNewFun = DateTime(2020, 01, 01, 0, 0);
    Stopwatch stopwatch = new Stopwatch()..start();
    int toYear = fromYear + for_how_many_years;
    for (var yy = fromYear; yy < toYear; yy++) {
      durationNewFun = durationNewFun.add(-stopwatch.elapsed);
      MandaFirstDayOfMonthBuilder(yy).eventsForWholeYear;
      durationNewFun = durationNewFun.add(stopwatch.elapsed);
    }
    //// Old Function
    // stopwatch = new Stopwatch()..stop();
    // stopwatch = new Stopwatch()..start();
    // for (var yy = fromYear; yy < toYear; yy++) {
    //   durationOldFun = durationOldFun.add(-stopwatch.elapsed);
    //   MandaHolidays.firstDayOfMandaMonth(yy);
    //   durationOldFun = durationOldFun.add(stopwatch.elapsed);
    // }
    print("durationOldFun: $durationOldFun");
    print("durationNewFun: $durationNewFun");
  }
}
