// // import 'dart:async';

// // import 'package:flutter/material.dart';
// // import 'package:table_calendar_example/manda_date.dart';

// import "dart:io";

// import 'package:flutter_test/flutter_test.dart';
// import 'package:manda_calendar/manda_date_old.dart';
// import 'package:manda_calendar/manda_date.dart';
// import 'package:manda_calendar/manda_events_new.dart';
// import 'package:manda_calendar/manda_holidays_new.dart';
// import 'file:///Users/farid.khafaji.zadeh/projects/my_app_cal/manda_calendar/test/read_write.dart';
// import 'package:path_provider/path_provider.dart';

// main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   ListTest.testMain();
// }

// _read() async {
//   try {
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/farid.txt');
//     String text = await file.readAsString();
//     print(text);
//   } catch (e) {
//     print("Couldn't read file");
//   }
// }

// _save(message, file) async {
//   // final directory = await getApplicationDocumentsDirectory();
//   // print(directory);
//   // final file = File('${directory.path}/farid.txt');

//   // var myPath = '/Users/farid.khafaji.zadeh/projects/my_app_cal/manda_calendar⁩';
//   // final file = File('$myPath/farid.txt');

//   print(file);
//   final text = message;
//   await file.writeAsString(text.toString());
//   await file.writeAsString("#########");
//   print('saved');
// }

// class ListTest extends MandaDate {
//   static testMain() async {
//     // ignore: unnecessary_statements
//     // CounterStorage.readWrite();

//     // var fileName = "Letters.txt";
//     final directory = await getApplicationDocumentsDirectory();
//     print(directory);
//     final file = File('${directory.path}/farid.txt');

//     DateTime selectedDay = new DateTime(2020, 9, 15);
//     DateTime first = new DateTime(2020, 9, 1);

//     List mandaDate = MandaDate.createMandaDayForSelectedDay(selectedDay);
//     print("mandaDate: $mandaDate");

//     // List newMandaDate = NewMandaDate.newMandaDayForSelectedDay(selectedDay);
//     // print("newMandaDate: $newMandaDate");

//     /// Test #1
//     ///
//     // int endMonth = 31;
//     // for (var mm = 1; mm < 13; mm++) {
//     //   if (mm == 12) {
//     //     endMonth = 31;
//     //   } else {
//     //     endMonth = DateTime(2020, mm + 1, 0).day;
//     //   }

//     //   for (var dd = 1; dd < endMonth + 1; dd++) {
//     //     selectedDay = DateTime(2020, mm, dd);
//     //     List mandaDate = MandaDate.createMandaDayForSelectedDay(selectedDay);
//     //     print("mandaDate: $mandaDate");

//     //     _save(mandaDate, file);
//     //   }
//     // }

//     // var firstManda = MandaHolidays.holidays(first);
//     // print(firstManda.keys);

//     // MandaEvents.mandaEventsFromBase2020();

//     // file.writeAsStringSync("$mandaDate", mode: FileMode.append);

//     //

//     // // Or Test #2
//     // Map diffInDays = MandaDate.diffFormSelectedDayToBase(selectedDay);
//     // List mandaDayMonth = MandaDate.covertDiffToMandaDay(diffInDays);
//     // var monthName = MandaDate.matchMandaMonthName(mandaDayMonth[1]);
//     //       print(MandaDate.getMandaYear(mandaDayMonth, diffInDays ));
//     // print("mandaMonthName[index][0]: $monthName");

//     /// Or Test #3
//     // testAdd();

//     // testSubt();
//     print("End of Testing  " * 20);
//   }

//   static testAdd() {
//     List data = getDataTotestFromTo(true);
//     print("data $data");
//     print("testFrom08To22");
//     print("data1" * 20);
//     checkmandaDayAdd(data[0]);
//     checkmandaMonthAdd(data[1]);
//     checkmandaYear(data[2], data[3]);
//     print("End of Testing  " * 20);
//   }

//   static testSubt() {
//     List data = getDataTotestFromTo(false);
//     print("data $data");
//     print("testFrom08To22");
//     print("data1" * 20);
//     checkTheDataSubt(data[0]);
//     checkmandaMonthSub(data[1]);
//     checkmandaYear(data[2], data[3]);
//     print("End of Testing  " * 20);
//   }

//   static getDataTotestFromTo(var add) {
//     List daysList = [];
//     List monthList = [];
//     List yesrListYahya = [];
//     List yesrListAdam = [];
//     DateTime selectedDayNew;
//     DateTime selectedDay;

//     for (var dd = 0; dd < 36500; dd++) {
//       if (add) {
//         selectedDay = new DateTime(2019, 3, 20);
//         selectedDayNew = selectedDay.add(Duration(days: dd));
//       } else {
//         selectedDay = new DateTime(2019, 3, 19);
//         selectedDayNew = selectedDay.subtract(Duration(days: dd));
//       }
//       print("selectedDay: $selectedDay");

//       print("selectedDay: $selectedDayNew");
//       // xxx +=1;
//       if (dd == 359) {
//         print("object");
//       }
//       var mandaDate = MandaDate.createMandaDayForSelectedDay(selectedDayNew);
//       daysList.add(MandaDate.mandaDay(mandaDate));
//       monthList.add(MandaDate.mandaMonth(mandaDate));
//       yesrListYahya.add(MandaDate.mandaYearYahya(mandaDate));
//       yesrListAdam.add(MandaDate.mandaYearAdam(mandaDate));

//       // if ((selectedDay.year == 2022) & (selectedDay.month == 3) & (selectedDay.day == 18)){
//       print("d=============================================d: $dd");
//       //   break;
//       // }
//     }
//     // print("testFrom08To22: $diffInDays");
//     return [daysList, monthList, yesrListYahya, yesrListAdam];
//   }

//   static dataBetaTest() {
//     List diffInDays = [];
//     int xxx = 0;
//     for (var yy = 1; yy < 20; yy++) {
//       for (var mm = 1; mm < 13; mm++) {
//         for (var dd = 1; dd < 31; dd++) {
//           diffInDays.add(dd);
//           print("xxx=============================================d: $xxx");
//           xxx += 1;
//         }
//       }
//       for (var dd = 1; dd < 6; dd++) {
//         diffInDays.add("Banjeh");
//         print("xxx=============================================d: $xxx");
//         xxx += 1;
//       }
//       if (xxx == 73000) {
//         print("d=============================================break");
//         break;
//       }
//     }
//     print("diffInDays: $diffInDays");
//     return diffInDays;
//   }

//   static checkTheDataSubt(List data) {
//     int end = data.length;
//     print('length: $end');
//     int cont = 0;

//     for (int yy = 1; yy < 160; yy++) {
//       print('yy########## $yy');
//       for (int dd = 1; dd < 6; dd++) {
//         print('dd########## $cont');
//         print(data[cont]);
//         assert(data[cont] == 'Banjeh');
//         cont += 1;
//       }
//       for (int mm = 1; mm < 13; mm++) {
//         print('mm########## $mm');
//         for (int dd = 0; dd < 30; dd++) {
//           print('dd########## $cont');
//           print(data[cont]);
//           assert(data[cont] == 30 - dd);
//           cont += 1;
//         }
//       }

//       print('$yy ##########' * 10);
//       if (cont == end) {
//         print("d=============================================break");
//         break;
//       }
//     }

//     print('##########' * 10);
//   }

//   static checkmandaDayAdd(List data) {
//     int end = data.length;
//     print('length: $end');
//     int cont = 0;

//     for (int yy = 1; yy < 160; yy++) {
//       print('yy########## $yy');

//       for (int mm = 1; mm < 13; mm++) {
//         print('mm########## $mm');
//         for (int dd = 1; dd < 31; dd++) {
//           print('checkmandaDayAdd########## $cont');
//           print(data[cont]);
//           assert(data[cont] == dd);
//           cont += 1;
//         }
//       }
//       for (int dd = 1; dd < 6; dd++) {
//         print('checkmandaDayAdd########## $cont');
//         print(data[cont]);
//         assert(data[cont] == 'Banjeh');
//         cont += 1;
//       }

//       print('$yy ##########' * 10);
//       if (cont == end) {
//         print("d=============================================break");
//         break;
//       }
//     }

//     print('##########' * 10);
//   }

//   static checkmandaMonthAdd(List data) {
//     int end = data.length;
//     print('length: $end');
//     int cont = 0;

//     for (int yy = 1; yy < 160; yy++) {
//       print('yy########## $yy');

//       for (int mm = 1; mm < 13; mm++) {
//         print('mm########## $mm');
//         for (int dd = 1; dd < 31; dd++) {
//           print('ddcheckmandaMonthAdd $dd');
//           print('########## $cont');
//           print(data[cont]);
//           assert(data[cont] == mm);
//           cont += 1;
//         }
//       }
//       for (int dd = 1; dd < 6; dd++) {
//         print('dd########## $cont');
//         print(data[cont]);
//         assert(data[cont] == 13);
//         cont += 1;
//       }

//       print('$yy ##########' * 10);
//       if (cont == end) {
//         print("d=============================================break");
//         break;
//       }
//     }

//     print('##########' * 10);
//   }

//   static checkmandaMonthSub(List data) {
//     int end = data.length;
//     int cont = 0;
//     print('length: $end');
//     print('checkmandaMonthSub data: $data');

//     for (int yy = 1; yy < 160; yy++) {
//       print('yy########## $yy');

//       for (int dd = 1; dd < 6; dd++) {
//         print('dd########## $cont');
//         print(data[cont]);
//         assert(data[cont] == 13);
//         cont += 1;
//       }

//       for (int mm = 1; mm < 13; mm++) {
//         int mm1 = 13 - mm;
//         print('mm########## $mm1');
//         for (int dd = 1; dd < 31; dd++) {
//           print('ddcheckmandaMonthAdd $dd');
//           print('########## $cont');
//           print(data[cont]);
//           assert(data[cont] == mm1);
//           cont += 1;
//         }
//       }

//       print('$yy ##########' * 10);
//       if (cont == end) {
//         print("d=============================================break");
//         break;
//       }
//     }

//     print('##########' * 10);
//   }

//   static checkmandaYear(List data1, List data2) {
//     int end = data1.length - 1;
//     print('length: $end');

//     for (int yy = 1; yy < end; yy++) {
//       if (yy == 36397) {
//         print("object");
//       }
//       print('checkmandaYear########## $yy');
//       print(data1[yy]);
//       print(data1[yy + 1]);
//       var index1 = data1[yy] - data1[yy + 1];
//       assert((index1 == 0) | (index1.abs() == 1));

//       var index2 = data2[yy] - data2[yy + 1];
//       assert((index2 == 0) | (index2.abs() == 1));
//     }

//     print('##########' * 10);
//   }

//   static reverseData(List data) {
//     int end = data.length;
//     List reverseData = [];
//     for (int yy = 1; yy < end; yy++) {
//       reverseData.add(data[yy]);
//     }
//     return reverseData;
//   }
// }
