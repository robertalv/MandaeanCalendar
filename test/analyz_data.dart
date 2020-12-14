import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mandaean_calendar/manda_date.dart';
// import 'package:path_provider/path_provider.dart';

void main() async {
  /// /Users/farid.khafaji.zadeh/Library/Developer/CoreSimulator/Devices/62BC68C9-FD07-42F8-B1FE-DDE43FD671BD/data/Containers/Data/Application/FDD2FA23-4F01-4ACB-8B14-E24C7B46AF49/Documents
  WidgetsFlutterBinding.ensureInitialized();

  //// **********************************
  // ///run this one time to generet manda and gor date
  // ///save panja_gor_match.text results to panja_gor_match.dart
  //// **********************************
  // MandaGorData.generetPanjaData(3000);
  //// **********************************

  // List readPanjaMatchGor = PanjaDataTest.panjaAndGor();
//// **********************************
  // ///run this one time to generet list of diff between manda and gor year
  // ///results saved to panja_gor_year_diff.txt results
  //// **********************************
  // List panjaAndGorYeay =
  // MandaGorData.findPanjaAndGorYeayRelation(readPanjaMatchGor);
  //// **********************************
  ///
  //// **********************************
  // ///run this one time to generet gor date using function
  // ///results saved to genert_gor_date_using_fun.txtresults
  //// **********************************
  MandaGorData.generetGroDateRelation(3000);
  //// **********************************

  // List panjaDate =
  //     MandaGorData.generetPanjaDataAndCheckIfMatch(readPanjaMatchGor);
  // _save(panjaDate, "genert_panja_date.txt");

  print("################# End");
}

class MandaGorData {
  static saveData(message, fileName) async {
    var fileNamePath =
        "/Users/farid.khafaji.zadeh/projects/my_app_cal/manda_calendar_v3/test/" +
            fileName;
    final text = message.toString();
    new File(fileNamePath).writeAsString(text);
    print('saved');
  }

  static generetGroDateRelation(for_how_many_years) {
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
      DateTime beginningofSelectedDay =
          DateTime(fromatedGorDate.year, 1, 1, 0, 0);

      int leapG = ((fromatedGorDate.year) ~/ 4) -
          (((((fromatedGorDate.year) ~/ 100) + 1) * 3) ~/ 4);

      DateTime lastDayOfFebDate = DateTime(fromatedGorDate.year, 3, 0, 0, 0);
      int lastDayOfFeb = lastDayOfFebDate.day;

      if (fromatedGorDate.year > 0) {
        leapG = leapG + 1;
        if (lastDayOfFeb == 29) {
          leapG = leapG - 1;
        }
      }

      int diffFromBeginningYear =
          MandaDateBuilder.diffBetDays(fromatedGorDate, beginningofSelectedDay);

      int leapIndexDay = 0;

      int diffToSelectedDay = diffFromBeginningYear + leapG + leapIndexDay;

      DateTime generetedSelectedDay = DateTime(
          0, 1, 1 + diffToSelectedDay + (fromatedGorDate.year * 365), 0, 0);

      //// ####
      dayFromZero += 1;
      groList.add([
        "\n",
        dayFromZero,
        fromatedGorDate,
        leapG,
        diffToSelectedDay,
        generetedSelectedDay
      ]);

      if (!listEquals([fromatedGorDate], [generetedSelectedDay])) {
        groList.add([
          "\n False",
          fromatedGorDate.difference(generetedSelectedDay).inDays
        ]);
        print("false");
        print("testMandaDate $fromatedGorDate");
        print("test1 $generetedSelectedDay");
      }
    }
    MandaGorData.saveData(groList, "genert_gor_date_using_fun.txt");
  }

  static generetMandaGroDate(
      groDate00, mandaMatchG00, yahyaYear, admYear, for_how_many_years) {
    //// Pamja 13
    /// Ghina 1, Arghva 2, Hatia 3, Gadea 4, Dolla 5, Nona 6,
    /// Amber 7, Tora 8, Solme 9, Sertana 10, Area 11, Shobolta 12
    // DateTime groDate00 = DateTime(0, 1, 1, 0, 0);
    // DateTime mandaMatchG00 = DateTime(1, 6, 13, 0, 0);
    // int yahyaYear = 1;
    // int admYear = 443368;
    DateTime groDate = groDate00;
    DateTime mandaMatchG = mandaMatchG00;
    int mandaY = mandaMatchG.year;
    int mandaM = mandaMatchG.month;
    int mandaD = mandaMatchG.day;
    List groList = [groDate];
    List mandaList = [
      [mandaY, mandaM, mandaD, admYear, yahyaYear]
    ];
    List mandaAndGre = [
      [
        '\n myYearIndex, diffToSelectedDay, leapG,gor Date, manda Y, manda M, manda d, adam Y, yahya Y   \n 0,0,0',
        groDate,
        [mandaY, mandaM, mandaD]
      ]
    ];
    int myYearIndex = 0;
    for (var dd = 1; dd < 365 * for_how_many_years; dd++) {
      var groNewDate = groDate.add(Duration(days: dd));
      print(groNewDate);
      print("****** Generating Data");
      groList.add(
          DateTime(groNewDate.year, groNewDate.month, groNewDate.day, 0, 0));
      mandaD += 1;
      var mandaYMD = formateMandaDate(mandaY, mandaM, mandaD);
      mandaY = mandaYMD[0];
      mandaM = mandaYMD[1];
      mandaD = mandaYMD[2];

      if (mandaM == 3 && mandaD == 1) {
        yahyaYear += 1;
      }

      if (mandaM == 5 && mandaD == 1) {
        admYear += 1;
      }

      // ####

      DateTime beginningofSelectedDay = DateTime(groNewDate.year, 1, 1, 0, 0);

      int leapG = ((groNewDate.year) ~/ 4) -
          (((((groNewDate.year) ~/ 100) + 1) * 3) ~/ 4);

      int diffFromBeginningYear =
          MandaDateBuilder.diffBetDays(groNewDate, beginningofSelectedDay);

      int diffToSelectedDay = diffFromBeginningYear + leapG;

      //// ####

      mandaList.add([mandaY, mandaM, mandaD, admYear, yahyaYear]);
      // dayIndex += 1;
      if (diffFromBeginningYear == 0) {
        myYearIndex += 1;
      }
      mandaAndGre.add([
        '\n',
        myYearIndex,
        diffToSelectedDay,
        leapG,
        groNewDate,
        [mandaY, mandaM, mandaD, admYear, yahyaYear]
      ]);
    }
    return [groList, mandaList, mandaAndGre];
  }

  static findPanjaAndGorYeayRelation(groPanjaList) {
    var oneYearDifff;
    List newPanjaGorYear = [];
    var xSpaeac;
    Map yearMatch = {832: 2};
    int expectedYearDiff = 1;
    groPanjaList.forEach((element) {
      oneYearDifff = false;
      xSpaeac = '\n' + ' ' * 10;
      var groDate = DateTime(element[0][0], element[0][1], element[0][2], 0, 0);
      var panjeDate = element[1];
      int diffYear = panjeDate[0] - groDate.year;
      int leapG =
          ((groDate.year) ~/ 4) - (((((groDate.year) ~/ 100) + 1) * 3) ~/ 4);

      if (groDate.year > 832 && groDate.year <= 2340) {
        expectedYearDiff = 2;
      } else if (groDate.year > 2340) {
        expectedYearDiff = 3;
      }
      if (diffYear == expectedYearDiff) {
        oneYearDifff = true;
        xSpaeac = '  ';
      }

      // int panjaYear = findPanjaYearUsingGor(groDate);
      // assert(panjaYear == panjeDate[0]);

      newPanjaGorYear.add([
        "\n",
        groDate,
        panjeDate,
        '===',
        leapG,
        diffYear,
        xSpaeac,
        oneYearDifff
      ]);
    });
    saveData(newPanjaGorYear, "panja_gor_year_diff.txt");
  }

  static findPanjaYearUsingGor(groDate) {
    int expectedYearDiff = 1;
    int panjaYear;
    int leapG;
    int yearIndex;

    if (groDate.year >= 832) {
      leapG =
          ((groDate.year) ~/ 4) - (((((groDate.year) ~/ 100) + 1) * 3) ~/ 4);

      yearIndex = (leapG - 202) ~/ 365;

      expectedYearDiff = yearIndex + 2;

      if (leapG - yearIndex * 365 == 202 && groDate.month < 6) {
        expectedYearDiff = expectedYearDiff - 1;
      }
    }

    panjaYear = groDate.year + expectedYearDiff;

    return panjaYear;
  }

  static findMandaDateUsingMonthAndDay(groList, List mandaList, selectedDate) {
    List newData = [];
    int index = 0;
    mandaList.forEach((element) {
      if (element[1] == selectedDate[0] && element[2] == selectedDate[1]) {
        newData.add([
          [groList[index].year, groList[index].month, groList[index].day],
          element
        ]);
      }
      index += 1;
    });
    return newData;
  }

  static findMandaDateUsingMonthAndDayFormated(
      groList, List mandaList, selectedDate) {
    List newData = [];
    int index = 0;
    mandaList.forEach((element) {
      if (element[1] == selectedDate[0] && element[2] == selectedDate[1]) {
        newData.add(['\n', groList[index], element]);
      }
      index += 1;
    });
    return newData;
  }

  static generetPanjaData(for_how_many_years) {
    DateTime groDate00 = DateTime(0, 1, 1, 0, 0);
    DateTime mandaMatchG00 = DateTime(1, 6, 13, 0, 0);
    int yahyaYear = 1;
    int admYear = 443368;
    List mandaAndGorData = MandaGorData.generetMandaGroDate(
        groDate00, mandaMatchG00, yahyaYear, admYear, for_how_many_years);
    // DateTime selectedDay = DateTime(2021, 2, 1);
    // List panjeAndGorMatch = MandaGorData.findMandaDateUsingMonthAndDay(
    //     mandaAndGorData[0], mandaAndGorData[1], [13, 5]);

    List panjeAndGorMatch = MandaGorData.findMandaDateUsingMonthAndDayFormated(
        mandaAndGorData[0], mandaAndGorData[1], [13, 5]);

    List yahyaNewYearAndGorMatch =
        MandaGorData.findMandaDateUsingMonthAndDayFormated(
            mandaAndGorData[0], mandaAndGorData[1], [3, 1]);

    List adamNewYearAndGorMatch =
        MandaGorData.findMandaDateUsingMonthAndDayFormated(
            mandaAndGorData[0], mandaAndGorData[1], [5, 1]);

    saveData(mandaAndGorData[2], "manda_date.txt");
    saveData(panjeAndGorMatch, "panja_gor_match.txt");
    saveData(yahyaNewYearAndGorMatch, "yahya_gor_match.txt");
    saveData(adamNewYearAndGorMatch, "adam_gor_match.txt");
  }

  static generetPanjaDataAndCheckIfMatch(List groPanjaList) {
    List newData = [];
    var leapG;
    int leapGIndex;
    var matchPanje;
    var panjeDate;
    var grodate;
    var diffPanjeRealTOBase;
    var diffAddingTOBase;
    DateTime panjeOnGroDateUsingBase;
    var panjeOnMandaDateUsingBase;
    groPanjaList.forEach((element) {
      matchPanje = false;
      var xSpaeac = '\n' + ' ' * 10;
      grodate = DateTime(element[0][0], element[0][1], element[0][2], 0, 0);
      panjeDate = element[1];
      leapG =
          ((grodate.year) ~/ 4) - (((((grodate.year) ~/ 100) + 1) * 3) ~/ 4);
      int groYearIndex = ((grodate.year - 835) ~/ 4);
      int diffGorYearIndex = (grodate.year - 835) - 4 * groYearIndex;

      // var panjeByMandaYear = findPanjeByMandaYear(panjeDate[0]);
      var panjeByGorDate = findPanjeByGorDate(grodate);
      var panjeByGorDateUsingLeap = findPanjeByGorDateUsingLeap(grodate);

      if (panjeByGorDateUsingLeap == panjeByGorDate) {
        matchPanje = true;
        xSpaeac = ' ';
      } else {
        print("false");
      }

      panjeOnGroDateUsingBase = panjeByGorDateUsingLeap;

      diffPanjeRealTOBase = DateTime(0, 7, 21, 0, 0).difference(grodate).inDays;
      diffAddingTOBase = DateTime(0, 7, 21, 0, 0)
          .difference(DateTime((panjeDate[0] - 1), 7, 21, 0, 0))
          .inDays;
      var diffBaseTOPanjaReal = diffPanjeRealTOBase - diffAddingTOBase;

      if (grodate == panjeOnGroDateUsingBase) {
        matchPanje = true;
        xSpaeac = ' ';
      }

      // assert(grodate == panjeOnGroDateUsingBase);

      newData.add([
        "\n",
        grodate,
        panjeDate,
        "==",
        diffBaseTOPanjaReal,
        "==",
        leapG,
        "==",
        panjeOnGroDateUsingBase,
        panjeOnMandaDateUsingBase,
        xSpaeac,
        matchPanje
      ]);
    });
    return newData;
  }
}

findPanjeByGorDateUsingLeap(grodate) {
  int leapG =
      ((grodate.year) ~/ 4) - (((((grodate.year) ~/ 100) + 1) * 3) ~/ 4);

  if (grodate.year > 834) {
    int groYearIndex = ((grodate.year - 835) ~/ 4);
    int diffGorYearIndex = (grodate.year - 835) - 4 * groYearIndex;
    if (diffGorYearIndex == 0) {
      leapG = leapG + 1;
    }
  }

  int yearIndex = 0;

  if (grodate.year == 832 && grodate.month > 6) {
    yearIndex = 1;
  }
  if (grodate.year > 832) {
    yearIndex = 1;
  }

  if (grodate.year == 2340 && grodate.month > 6) {
    yearIndex = 2;
  }
  if (grodate.year > 2340) {
    yearIndex = 2;
  }
  return DateTime(grodate.year + yearIndex, 7, 21 - leapG, 0, 0);
}

findPanjeByMandaYear(mandaYear) {
  return DateTime(0, 7, 21 + ((mandaYear - 1) * 365), 0, 0);
}

findPanjeByGorDate(grodate) {
  int yearIndex = 0;

  if (grodate.year == 832 && grodate.month > 6) {
    yearIndex = 1;
  }
  if (grodate.year > 832) {
    yearIndex = 1;
  }

  if (grodate.year == 2340 && grodate.month > 6) {
    yearIndex = 2;
  }
  if (grodate.year > 2340) {
    yearIndex = 2;
  }
  return DateTime(0, 7, ((grodate.year + yearIndex) * 365) + 21, 0, 0);
}

formateMandaDate(yy, mm, dd) {
  if (mm < 13 && dd == 31) {
    mm = mm + 1;
    dd = 1;
  }
  if (mm == 13 && dd == 6) {
    yy = yy + 1;
    mm = 1;
    dd = 1;
  }
  assert(dd < 31);
  assert(mm < 14);
  return [yy, mm, dd];
}

// _save(message, fileName) async {
//   var fileNamePath =
//       "/Users/farid.khafaji.zadeh/projects/my_app_cal/manda_calendar_v3/test/" +
//           fileName;
//   final text = message.toString();
//   new File(fileNamePath).writeAsString(text);
//   print('saved');
// }

_read(fileName) async {
  var fileNamePath =
      "/Users/farid.khafaji.zadeh/projects/my_app_cal/manda_calendar_v3/test/" +
          fileName;

  var contents = new File(fileNamePath).readAsString().then((String contents) {
    print('_read');
    print(contents);
    return contents;
  });
  // .then((String contents);
}

// findPanjaDateFor(year) {
//   DateTime baseYear = DateTime(0, 7, 21);
//   DateTime createDayMacthPanja = baseYear.add(Duration(days: 365 * year));
//   // var formatter = new DateFormat('yyyy-MM-dd');
//   String pajnaFormate = DateFormat.H().format(createDayMacthPanja);

//   var pajnaHour = int.parse(pajnaFormate);
//   print(pajnaHour);
//   print(createDayMacthPanja);
//   if (pajnaHour >= 20) {
//     createDayMacthPanja =
//         createDayMacthPanja.add(Duration(hours: 24 - pajnaHour));
//   }
//   // if ()
//   print(createDayMacthPanja);
//   print("#################");
//   return createDayMacthPanja;
// }

// findPanjaDateFor20(year) {
//   DateTime baseYear = DateTime(2020, 3, 18);
//   year = year - 2020 - 1;
//   DateTime createDayMacthPanja = baseYear.add(Duration(days: 365 * year));
//   print(createDayMacthPanja);
// }
//
// _save(message, fileName) async {
//   // var myPath = '/Users/farid.khafaji.zadeh/projects/my_app_cal/manda_calendar⁩';
//   // final file = File('$myPath/farid.txt');
//   final directory = await getApplicationDocumentsDirectory();
//   print(directory);
//   final file = File('${directory.path}/$fileName');

//   print(file);
//   final text = message;
//   await file.writeAsString(text);
//   print('saved');
// }

// class ListTest extends MandaDate {
//   static testMain() async {
//     // int yearY = 2069;
//     // int yearA = 445436;
//     int leapG;
//     int selectedY = 0;
//     int selectedM = 1;
//     int selectedD = 1;
//     int mandaY = 1;
//     int mandaM = 6;
//     int mandaD = 13;
//     // int selectedY = 2018;
//     // int selectedM = 7;
//     // int selectedD = 1;
//     // int mandaY = 2021;
//     // int mandaM = 4;
//     // int mandaD = 14;
//     // int oldMandaY = mandaY;
//     // int mdi = 0;
//     // int mmi = 0;
//     // int myi = 0;

//     Map data = {};
//     List gDateAndMDate = [];
//     List mandaDate = [];
//     List newMandaDate = [];
//     List panjaData = [];
//     List myNewDayMacthPanja = [];
//     List createNewDayMacthPanja = [];
//     int endLoop = 365 * 2125;
//     int samOfLeap = 0;
//     int hh = 0;
//     // for (var yy = 0; yy < 2; yy++) {
//     for (var dd = 0; dd < endLoop; dd++) {
//       // mandaD = mandaD + mdi;
//       // mandaM = mandaM + mmi;
//       // mandaY = mandaY + myi;
//       DateTime newDayMacthPanja;
//       DateTime selectedDay = new DateTime(selectedY, selectedM, selectedD + dd);

//       int leapDay = (selectedDay.year / 4).toInt();
//       int gy = selectedDay.year;
//       leapG = ((gy) ~/ 4) - (((((gy) ~/ 100) + 1) * 3) ~/ 4);

//       int diffY = selectedDay.year - mandaY;
//       int diffM = selectedDay.month - mandaM;
//       int diffD = selectedDay.day - mandaD;
//       int allDiff = diffY * 365 + diffM * 30 + diffD;

//       gDateAndMDate.add([
//         dd + 1,
//         "${selectedDay.year} - ${selectedDay.month} - ${selectedDay.day}",
//         "   ",
//         "${mandaY} - ${mandaM} - ${mandaD}",
//         '\n',
//         '\n'
//       ]);

// //       var formatter = new DateFormat('yyyy-MM-dd');
// //       String formattedDate = formatter.format(selectedDay);

// //       newMandaDate.add([
// //         dd + 1,
// //         formattedDate,
// //         mandaY,
// //         mandaM,
// //         mandaD,
// //         'SamLeap=',
// //         leapG,
// //         'allDiff',
// //         allDiff,
// //         '\n'
// //       ]);

// //       mandaDate.add([
// //         dd + 1,
// //         selectedDay,
// //         mandaY,
// //         mandaM,
// //         mandaD,
// //         'Leap=',
// //         leapDay,
// //         'SamLeap=',
// //         leapG,
// //         'MaySamLeap=',
// //         samOfLeap,
// //         '(---',
// //         diffY,
// //         diffM,
// //         diffD,
// //         'allDiff',
// //         allDiff,
// //         '\n'
// //       ]);

// //       if ((mandaM == 2) && (mandaD == 30)) {
// //         mandaY += 1;
// //       }

// //       if (mandaD == 30) {
// //         mandaD = 0;
// //         mandaM += 1;
// //       }
// //       if ((mandaM == 13) && (mandaD == 5)) {
// //         mandaM = 1;
// //         mandaD = 0;
//  //       List panjaDate = mandaDate.last;

// //         int mny = (panjaDate[2] - 1);
// //         print(mny);

// //         if (leapG >= 202) {
// //           hh = -1;
// //         }
// //         DateTime createDayMacthPanja = new DateTime(0 + mny, 7, 21 - leapG);
// //         createDayMacthPanja = createDayMacthPanja.add(Duration(days: hh));

// //         createNewDayMacthPanja.add([dd + 1, createDayMacthPanja]);
// //         createNewDayMacthPanja.add(['\n']);

// //         newDayMacthPanja = new DateTime(0 + mny, 7, 21 - leapG);
// //         myNewDayMacthPanja.add(newDayMacthPanja);
// //         myNewDayMacthPanja.add(['\n']);
// //         panjaData.add(mandaDate.last);
// //         mandaDate.add(['\n']);
// //         newMandaDate.add(['\n']);
// //       }

// //       if ((selectedDay.month == 12) && (selectedDay.day == 31)) {
// //         int yearIfLeap = DateTime(selectedDay.year, 3, 0).day;
// //         if (yearIfLeap == 29) {
// //           samOfLeap += 1;
// //         }

// //         data[selectedDay.year] = mandaDate;
// //         mandaDate = [];
// //         // newMandaDate = [];
// //       }
// //       mandaD += 1;
// //     }

// //     int ix = 0;
// //     List panjaNotMatch = [];
// //     List panjaDateNew = [];
// //     DateTime baseDate = DateTime(0, 7, 21);
// //     panjaData.forEach((pdate) {
// //       DateTime realPanja = pdate[1];
// //       var diffToBase = realPanja.difference(baseDate);
// //       var diffDays = diffToBase.inDays;
// //       var diffYears = (diffToBase.inDays) ~/ 365;

// //       panjaDateNew.add([
// //         pdate[0],
// //         pdate[1],
// //         pdate[2],
// //         pdate[3],
// //         pdate[4],
// //         pdate[7],
// //         pdate[8],
// //         'in Days:',
// //         diffDays,
// //         'in Years:',
// //         diffYears,
// //         'diff Years:',
// //         (diffDays - diffYears * 365),
// //         '\n'
// //       ]);
// //       // DateTime panja = myNewDayMacthPanja[ix];
// //       DateTime panja = createNewDayMacthPanja[ix][1];

// //       // if ((((panja.runtimeType.toString()).contains("DateTime")))) {
// //       if ((panja.year == realPanja.year) &&
// //           (panja.month == realPanja.month) &&
// //           (panja.day == realPanja.day)) {
// //       } else {
// //         print("fail");
// //         print("real $pdate");
// //         print("generet $panja[ix]");
// //         panjaNotMatch.add([pdate, panja]);
// //         panjaNotMatch.add(['\n']);
// //       }
// //       ix += 2;
// //       // }
// //     });

// //     // }
// //     // print(mandaDate);
// //     // print(data);
// //     _save(data.toString(), "manda.text");
// //     _save(panjaData.toString(), "panja.text");
// //     _save(myNewDayMacthPanja.toString(), "new_panja.text");
// //     _save(panjaNotMatch.toString(), "panja_not_match.text");
// //     _save(gDateAndMDate.toString(), "gDate_AndMDate.text");
// //     _save(createNewDayMacthPanja.toString(), "create_new_panja.text");
// //     _save(newMandaDate.toString(), "newManda.text");
// //     _save(panjaDateNew.toString(), "panjaDateNew.text");
// //   }
// // }
