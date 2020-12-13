// import 'package:flutter/material.dart';
// import 'package:MandaeanCalendar/manda_panja.dart';
// import 'panja_gor_match.dart';

// void main() async {
//   // TestWidgetsFlutterBinding.ensureInitialized();
//   WidgetsFlutterBinding.ensureInitialized();

//   // TestPanjaYear.findPanjeYearThenTest();

//   TestPanjaYear.findLastDayPanjeThenTest();

//   print("Done  " * 20);
// }

// class TestPanjaYear {
//   static void findPanjeYearThenTest() {
//     List readPanjaMatchGor = PanjaDataTest.panjaAndGor();
//     readPanjaMatchGor.forEach((element) {
//       var groDate = DateTime(element[0][0], element[0][1], element[0][2], 0, 0);
//       var panjeDate = element[1];

//       Stopwatch stopwatch = new Stopwatch()..start();
//       print('doSomething() executed in ${stopwatch.elapsed}');
//       int panjaYear = MandaPanja.findPanjaYearUsingGor(groDate);
//       print('doSomething() executed in ${stopwatch.elapsed}');
//       assert(panjaYear == panjeDate[0]);
//     });
//   }

//   static void findLastDayPanjeThenTest() {
//     var totalElapsedTime = DateTime(0, 0, 0, 0, 0);
//     int indexCount = 0;
//     List readPanjaMatchGor = PanjaDataTest.panjaAndGor();

//     readPanjaMatchGor.forEach((element) {
//       var groDate = DateTime(element[0][0], element[0][1], element[0][2], 0, 0);
//       var panjeDate = element[1];

//       Stopwatch stopwatch = new Stopwatch()..start();
//       print('doSomething() executed in ${stopwatch.elapsed}');
//       indexCount += 1;

//       int panjaYear = MandaPanja.findPanjaYearUsingGor(groDate);
//       DateTime lastDayOfPanja =
//           MandaPanja.findLastDayOfPanjaUsingYear(panjaYear);
//       totalElapsedTime = totalElapsedTime.add(stopwatch.elapsed);

//       print('doSomething() executed in ${stopwatch.elapsed}');
//       assert(groDate == lastDayOfPanja);
//     });
//     print("average elapsed time: ${totalElapsedTime.millisecond / indexCount}");
//   }
// }
