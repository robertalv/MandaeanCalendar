import 'dart:io';

import 'package:MandaeanCalendar/manda_date.dart';
import 'package:MandaeanCalendar/manda_formate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MandaeanCalendar/manda_panja.dart';
import 'package:intl/intl.dart';
import 'analyz_data.dart';

void main() async {
  // TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

///// ///// 00 generet gor date by function  - one time use
  // TestMandaDate.testGroDateUsingFunToGenerate(3000);

///// ///// 11 Ad hoc test  - one time use
  // DateTime selectedDay = TestMandaDate.testMandaData(8);
  // TestMandaDate.createMandaDate(selectedDay);

  ///// ///// 11 Ad hoc using function  - one time use
  // DateTime selectedDay = TestMandaDate.testMandaData(6);
  // var test = MandaDateBuilder4(selectedDay);

///// 22 generate data and  test
  TestMandaDate.generetAndTestMandaDate(3000);

///// 33 Ad hoc test
  /// List date = testMandaGData(1);
  // TestMandaDate.forGivenGDateGeneretAndTestMandaDate(date[0], date[1]);

  // ///// Test and comper two fun of manda date ceation
  // DateTime selectedDayAdHoc = DateTime(1920, 11, 05, 0, 0);
  // TestMandaDate.testSpeedTwoFunManaaDate(selectedDayAdHoc, 500);
  //

  print("Done  " * 20);
}

class TestMandaDate {
  static testMandaData(index) {
    List selectedDayTest = [];
    selectedDayTest.add(DateTime(2998, 01, 02, 0, 0));
    selectedDayTest.add(DateTime(2020, 01, 01, 0, 0));
    selectedDayTest.add(DateTime(2020, 01, 02, 0, 0));
    selectedDayTest.add(DateTime(2021, 01, 01, 0, 0));
    selectedDayTest.add(DateTime(2022, 01, 01, 0, 0));
    selectedDayTest.add(DateTime(2023, 01, 01, 0, 0));
    selectedDayTest.add(DateTime(2024, 01, 01, 0, 0));
    // selectedDayTest[2] = DateTime(0202, 01, 01, 0, 0);
    // selectedDayTest[3] = DateTime(0000, 07, 20, 0, 0);
    // selectedDayTest[4] = DateTime(0000, 07, 21, 0, 0);
    // selectedDayTest[5] = DateTime(0000, 07, 22, 0, 0);
    // selectedDayTest[6] = DateTime(0000, 07, 19, 0, 0);
    // selectedDayTest[7] = DateTime(0000, 01, 1, 0, 0);
    // selectedDayTest[8] = DateTime(2020, 01, 1, 0, 0);

    // DateTime selectedDayTest01 = DateTime(0000, 09, 18, 0, 0);
    // DateTime selectedDayTest02 = DateTime(0000, 09, 19, 0, 0);
    // DateTime selectedDayTest03 = DateTime(0000, 09, 20, 0, 0);
    // DateTime selectedDayTest04 = DateTime(0000, 09, 21, 0, 0);

    // DateTime selectedDayTest011 = DateTime(0000, 11, 17, 0, 0);
    // DateTime selectedDayTest012 = DateTime(0000, 11, 18, 0, 0);
    // DateTime selectedDayTest013 = DateTime(0000, 11, 19, 0, 0);
    // DateTime selectedDayTest014 = DateTime(0000, 11, 20, 0, 0);

    // DateTime selectedDay021 = DateTime(0834, 12, 02, 0, 0);

    // DateTime selectedDay031 = DateTime(2019, 02, 27, 0, 0);
    // DateTime selectedDay032 = DateTime(2019, 03, 27, 0, 0);
    // DateTime selectedDay033 = DateTime(2020, 02, 27, 0, 0);
    // DateTime selectedDay034 = DateTime(2020, 03, 27, 0, 0);
    return selectedDayTest[index];
  }

  static testMandaGData(index) {
    List selectedDay;
    List mandaDate;
    selectedDay.add(DateTime(0000, 07, 22, 0, 0));
    mandaDate.add([1, 1, 1, 443368]);

    // selectedDay[2] = DateTime(0201, 08, 17, 0, 0);
    // mandaDate[1] = [15, 3, 203, 443569];

    // selectedDay[3] = DateTime(0834, 12, 02, 0, 0);
    // mandaDate[1] = [6, 12, 836, 444203];

    // selectedDay[1] = DateTime(0999, 05, 02, 0, 0);
    // mandaDate[1] = [12, 6, 1001, 444368];

    // selectedDay[1] = DateTime(0999, 01, 01, 0, 0);
    // mandaDate[1] = [11, 2, 1000, 444367];

    // selectedDay[1] = DateTime(1080, 12, 30, 0, 0);
    // mandaDate[1] = [29, 2, 1082, 444449];

    // selectedDay[1] = DateTime(1080, 12, 31, 0, 0);
    // mandaDate[1] = [30, 2, 1082, 444449];

    // selectedDay[1] = DateTime(1083, 12, 31, 0, 0);
    // mandaDate[1] = [30, 2, 1085, 444452];

    // selectedDay[1] = DateTime(1086, 12, 31, 0, 0);
    // mandaDate[1] = [1, 3, 1089, 444455];

    // selectedDay[1] = DateTime(1337, 12, 29, 0, 0);
    // mandaDate[1] = [30, 4, 1340, 444706];

    // selectedDay[1] = DateTime(3828, 03, 05, 0, 0);
    // mandaDate[1] = [30, 2, 3831, 447198];

    return [selectedDay[index], mandaDate[index]];
  }

  static testGroDateUsingFunToGenerate(for_how_many_years) {
    DateTime groDate00 = DateTime(0, 1, 1, 0, 0);

    DateTime groDate = groDate00;

    List groList = [
      "\ndayFromZero, groNewDate, leapG, diffToSelectedDay, generetedSelectedDay\n",
      groDate
    ];
    int dayFromZero = 0;
    for (var dd = 1; dd < 365 * for_how_many_years; dd++) {
      var groNewDate = groDate.add(Duration(days: dd));
      print(groNewDate);

      // ####
      DateTime fromatedGorDate =
          DateTime(groNewDate.year, groNewDate.month, groNewDate.day, 0, 0);

      // int diffToSelectedDay =
      //     MandaDateBuilder4.findDiffFromBaseToSelectedDay(fromatedGorDate);
      int diffToSelectedDay =
          MandaDateBuilder.findDiffFromBaseToSelectedDay(fromatedGorDate);

      int diffToSelectedDayInYear = fromatedGorDate.year;

      DateTime generetedSelectedDay = DateTime(
          0, 1, diffToSelectedDay + diffToSelectedDayInYear * 365, 0, 0);

      //// ####
      dayFromZero += 1;
      // groList.add([
      //   "\n",
      //   dayFromZero,
      //   fromatedGorDate,
      //   leapG,
      //   diffToSelectedDay,
      //   generetedSelectedDay
      // ]);

      if (!listEquals([fromatedGorDate], [generetedSelectedDay])) {
        groList.add([
          "\n False",
          fromatedGorDate.difference(generetedSelectedDay).inDays
        ]);
        print("false");
        print("testMandaDate $fromatedGorDate");
        print("test1 $generetedSelectedDay");
      }
      assert(listEquals([fromatedGorDate], [generetedSelectedDay]), true);
    }
  }

  static testSpeedTwoFunManaaDate(selectedDay, howManyDays) {
    var durationOldFun = DateTime(2020, 01, 01, 0, 0);
    var durationNewFun = DateTime(2020, 01, 01, 0, 0);
    String _localLang = "en_US";

    Stopwatch stopwatch = new Stopwatch()..start();
    // for (var dd = 1; dd < howManyDays; dd++) {
    //   var groNewDate = selectedDay.add(Duration(days: dd));
    //   selectedDay = groNewDate;
    //   // print(groNewDate);

    //   //// old one
    //   // print("1  " * 20);
    //   durationOldFun = durationOldFun.add(-stopwatch.elapsed);

    //   var _panjaDate = MandaPanja(selectedDay.year);
    //   NewMandaFormatedDate2 mandaDate2 =
    //       new NewMandaFormatedDate2(selectedDay, _panjaDate, _localLang);

    //   durationOldFun = durationOldFun.add(stopwatch.elapsed);
    // }

    // stopwatch = new Stopwatch()..stop();
    // stopwatch = new Stopwatch()..start();
    for (var dd = 1; dd < howManyDays; dd++) {
      var groNewDate = selectedDay.add(Duration(days: dd));
      selectedDay = groNewDate;
      // print(groNewDate);

      /// New one
      // print("3  " * 20);
      durationNewFun = durationNewFun.add(-stopwatch.elapsed);

      MandaFormatedDateBuilder mandaDate =
          MandaFormatedDateBuilder(selectedDay, _localLang);

      durationNewFun = durationNewFun.add(stopwatch.elapsed);
    }

    print("durationOldFun: $durationOldFun");
    print("durationNewFun: $durationNewFun");
  }

  static createMandaDate(selectedDay) {
    //// old one
    print("1  " * 20);
    Stopwatch stopwatch = new Stopwatch()..start();
    print('doSomething() start in ${stopwatch.elapsed}');

    String _localLang = "en_US";
    // var _panjaDate = MandaPanja(selectedDay.year);
    // NewMandaFormatedDate2 mandaDate2 =
    //     new NewMandaFormatedDate2(selectedDay, _panjaDate, _localLang);

    print('doSomething() elapsed in ${stopwatch.elapsed}');
    print('doSomething() elapsed in ${stopwatch..stop()}');
    // String mandeanDay = mandaDate2.fullDay;
    // String mandaAndJalaiYear = mandaDate2.fullYearEnFa[_localLang];
    // print("mandeanDay 3 $mandeanDay");
    // print("mandaAndJalaiYear 3 $mandaAndJalaiYear");

    /// 2nd one
    print("2  " * 20);
    stopwatch = new Stopwatch()..start();
    print('doSomething() start in ${stopwatch.elapsed}');

    print('doSomething() elapsed in ${stopwatch.elapsed}');
    print('doSomething() elapsed in ${stopwatch..stop()}');

    /// 3dr one
    print("3  " * 20);
    stopwatch = new Stopwatch()..start();
    print('doSomething() start in ${stopwatch.elapsed}');

    MandaDateBuilder mandaDate = MandaDateBuilder(selectedDay);

    print('doSomething() elapsed in ${stopwatch.elapsed}');
    print('doSomething() elapsed in ${stopwatch..stop()}');
    print("mandaDate 1 $mandaDate");
    print("mandaDate day ${mandaDate.day}");
    print("mandaDate month ${mandaDate.month}");

    print("mandaDate adamYear ${mandaDate.yearAdam}");
    print("mandaDate yahyaYear ${mandaDate.yearYahya}");
  }

  static generetAndTestMandaDate(for_how_many_years) {
    DateTime groDate00 = DateTime(0, 1, 1, 0, 0);
    DateTime mandaMatchG00 = DateTime(1, 6, 13, 0, 0);
    int yahyaYear00 = 1;
    int admYear00 = 443368;
    // [1, 1, 833, 444200, 0832-01-02
    DateTime groDate01 = DateTime(0832, 1, 2, 0, 0);
    DateTime mandaMatchG01 = DateTime(833, 1, 1, 0, 0);
    int yahyaYear01 = 833;
    int admYear01 = 444200;
    print("wait generating data");
    List mandaAndGList = MandaGorData.generetMandaGroDate(
        groDate00, mandaMatchG00, yahyaYear00, admYear00, for_how_many_years);

    List gDate = mandaAndGList[0];
    List mandaDate = mandaAndGList[1];
    int index = 0;
    List genertMandaDateUsingFun = ["\n"];
    int myDifftoBase = 0;
    int passingIndex = 0;
    gDate.forEach((groDate) {
      passingIndex += 1;
      print(passingIndex);
      DateTime selectedDay = groDate;
      // MandaPanjaBuilder panjaDate3 = MandaPanjaBuilder(selectedDay);
      // MandaDateBuilder2 generatedMandaDate =
      //     MandaDateBuilder2(selectedDay, panjaDate3);
      //or use  this
      MandaDateBuilder generatedMandaDate = MandaDateBuilder(selectedDay);

      List mandaFunGenerated = [
        generatedMandaDate.day,
        generatedMandaDate.month,
        generatedMandaDate.yearAdam,
        generatedMandaDate.yearYahya,
        // newYearAdam,
        // newYearYahya
      ];

      ConvertMandaDateToGorBuilder funGeneratedGBaseOnMandaDate =
          ConvertMandaDateToGorBuilder([
        generatedMandaDate.day,
        generatedMandaDate.month,
        generatedMandaDate.yearYahya
      ]);

      DateTime funGeneratedGBaseOnManda = funGeneratedGBaseOnMandaDate.gDate;

      genertMandaDateUsingFun.add([
        "\n",
        myDifftoBase,
        selectedDay,
        mandaFunGenerated,
      ]);
      myDifftoBase += 1;

      List test = mandaDate[index];
      // [mandaDay, mandaMonth, yahyaYear, adamYear];
      // [2, 1, 1, 443368, 1]
      List testMandaDate = [test[2], test[1], test[3], test[4]];
      // print("test2  $test2");
      // print("generatedMandaDate  $generatedMandaDate");
      if (!listEquals(testMandaDate, mandaFunGenerated)) {
        genertMandaDateUsingFun.add([
          "\n",
          MandaDateBuilder.findDiffFromBaseToSelectedDay(selectedDay),
          selectedDay.year,
          testMandaDate,
          "\n\n False",
        ]);
        print("false");
        print("testMandaDate $testMandaDate");
        print("test1 $mandaFunGenerated");
      }

      assert(listEquals(testMandaDate, mandaFunGenerated) == true);

      if (!listEquals([groDate], [funGeneratedGBaseOnManda])) {
        genertMandaDateUsingFun.add([
          "\n",
          funGeneratedGBaseOnMandaDate.dayDiffBaseToSelectedDay,
          funGeneratedGBaseOnManda,
          "\n\n False",
        ]);
        print("false");
        print("testMandaDate $testMandaDate");
        print("test1 $mandaFunGenerated");
      }

      assert(listEquals([groDate], [funGeneratedGBaseOnManda]) == true);

      index += 1;
    });
    // MandaGorData.saveData(
    //     genertMandaDateUsingFun, "genert_manda_date_using_fun.txt");
  }

  // static forGivenGDateGeneretAndTestMandaDate(selectedDay, mandaDate) {
  //   // List mandaAndGList = MandaGorData.generetMandaGroDate(for_how_many_years);

  //   int index = 0;

  //   DateTime groDate =
  //       DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 0, 0);

  //   MandaPanjaBuilder panjaDate3 = MandaPanjaBuilder(groDate);
  //   // MandaDateBuilder2 generatedMandaDate =
  //   //     MandaDateBuilder2(groDate, panjaDate3);
  //   ////or use  this
  //   // MandaDateBuilder3 generatedMandaDate2 = MandaDateBuilder3(selectedDay);

  //   print("mandaDate  $mandaDate");
  //   print("generatedMandaDate  $generatedMandaDate");

  //   if (mandaDate[0] != generatedMandaDate.day ||
  //       mandaDate[1] != generatedMandaDate.month ||
  //       mandaDate[2] != generatedMandaDate.yearAdam ||
  //       mandaDate[3] != generatedMandaDate.yearYahya) {
  //     print("\n\nfalse");
  //   }
  //   List test = [
  //     generatedMandaDate.day,
  //     generatedMandaDate.month,
  //     generatedMandaDate.yearYahya,
  //     generatedMandaDate.yearAdam,
  //   ];
  //   print("groDate $groDate");
  //   print("mandaDate $mandaDate");
  //   print("test $test");
  //   assert(listEquals(mandaDate, test) == true);

  //   index += 1;
  // }
}
