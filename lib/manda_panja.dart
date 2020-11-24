// import 'manda_base.dart';
// import 'manda_date.dart';

// class MandaPanja22 {
//   int selectedYear;
//   DateTime lastDayOfPanja;
//   int yearOfPanje;

//   MandaPanja22(selectedYear) {
//     // int selectedYear = selectedDay.year;
//     this.yearOfPanje = findPanjaYear(selectedYear);
//     this.lastDayOfPanja = findLastDayOfPanja(this.yearOfPanje);
//     this.selectedYear = selectedYear;
//   }

//   static findLastDayOfPanja(int yearOfPanje) {
//     // int yearOfPanje = findPanjaYear(selectedYear);
//     final DateTime baseYear = MandaBaseDate.baseYear;

//     DateTime lastDayOfPanja = baseYear.add(Duration(days: 365 * yearOfPanje));

//     lastDayOfPanja = MandaDate.addDayWhenHours20(lastDayOfPanja);

//     return lastDayOfPanja;
//   }

//   static findPanjaYear(int selectedYear) {
//     int yearOfPanje = selectedYear;
//     if (selectedYear > MandaBaseDate.panjeReset) {
//       yearOfPanje = selectedYear + 1;
//     }
//     return yearOfPanje;
//   }

//   //// new function find all Panja Year
//   static findPanjaYearUsingGor(DateTime selectedDate) {
//     int expectedYearDiff = 1;
//     int panjaYear;
//     int leapG;
//     int yearIndex;

//     if (selectedDate.year < 832) {
//       expectedYearDiff = 1;
//     } else if (selectedDate.year > 832 && selectedDate.year < 2340) {
//       expectedYearDiff = 2;
//     } else if (selectedDate.year > 2340 && selectedDate.year < 3848) {
//       expectedYearDiff = 3;
//     } else {
//       leapG = ((selectedDate.year) ~/ 4) -
//           (((((selectedDate.year) ~/ 100) + 1) * 3) ~/ 4);

//       yearIndex = (leapG - 202) ~/ 365;

//       expectedYearDiff = yearIndex + 2;

//       if (leapG - yearIndex * 365 == 202 && selectedDate.month < 6) {
//         expectedYearDiff = expectedYearDiff - 1;
//       }
//     }

//     panjaYear = selectedDate.year + expectedYearDiff;

//     return panjaYear;
//   }

//   //// new function find Last Day Of Panja
//   static findLastDayOfPanjaUsingYear(int yearOfPanje) {
//     return DateTime(0, 7, 21 + ((yearOfPanje - 1) * 365), 0, 0);
//   }

//   static yahyaNewYear(mandaMonth, panjaDate, selectedDay) {
//     int panjaYear = panjaDate.yearOfPanje;
//     // DateTime selectedDay = panjaDate.selectedDay;
//     DateTime lastDayOfPanja = panjaDate.lastDayOfPanja;
//     int yahyaYear = panjaYear + 1;

//     if ((mandaMonth >= 3) &&
//         ((selectedDay.difference(lastDayOfPanja)).inDays > 0)) {
//       yahyaYear = yahyaYear + 1;
//     }
//     return yahyaYear;
//   }

//   static adamNewYear(mandaMonth, panjaDate, selectedDay) {
//     final int adamBaseYear = MandaBaseDate.adamBaseYear;
//     int panjaYear = panjaDate.yearOfPanje;
//     // DateTime selectedDay = panjaDate.selectedDay;
//     DateTime lastDayOfPanja = panjaDate.lastDayOfPanja;
//     int adamYear = panjaYear + adamBaseYear + 1;
//     if ((mandaMonth >= 5) &&
//         ((selectedDay.difference(lastDayOfPanja)).inDays > 0)) {
//       adamYear = adamYear + 1;
//     }
//     return adamYear;
//   }
// }

// class MandaPanjaBuilder {
//   // int selectedYear;
//   DateTime lastDayOfPanja;
//   int yearOfPanje;
//   DateTime dayBeforeYahyaEid;
//   DateTime dayBeforeAdamEid;

//   MandaPanjaBuilder(selectedYear) {
//     // int selectedYear = selectedDay.year;
//     this.yearOfPanje = findPanjaYearUsingGor(selectedYear);
//     this.lastDayOfPanja = findLastDayOfPanjaUsingYear(this.yearOfPanje);
//     this.dayBeforeYahyaEid = findDayBeforeYahyaEid(this.lastDayOfPanja);
//     this.dayBeforeAdamEid = findDayBeforeAdamEid(this.lastDayOfPanja);
//   }

//   //// new function find all Panja Year
//   static findPanjaYearUsingGor(DateTime selectedDate) {
//     int expectedYearDiff = 1;
//     int panjaYear;
//     int leapG;
//     int yearIndex;

//     if (selectedDate.year < 832) {
//       expectedYearDiff = 1;
//     } else if (selectedDate.year > 832 && selectedDate.year < 2340) {
//       expectedYearDiff = 2;
//     } else if (selectedDate.year > 2340 && selectedDate.year < 3848) {
//       expectedYearDiff = 3;
//     } else {
//       leapG = ((selectedDate.year) ~/ 4) -
//           (((((selectedDate.year) ~/ 100) + 1) * 3) ~/ 4);

//       yearIndex = (leapG - 202) ~/ 365;

//       expectedYearDiff = yearIndex + 2;

//       if (leapG - yearIndex * 365 == 202 && selectedDate.month < 6) {
//         expectedYearDiff = expectedYearDiff - 1;
//       }
//     }

//     panjaYear = selectedDate.year + expectedYearDiff;

//     return panjaYear;
//   }

//   //// new function find Last Day Of Panja
//   static findLastDayOfPanjaUsingYear(int yearOfPanje) {
//     return DateTime(0, 7, 21 + ((yearOfPanje - 1) * 365), 0, 0);
//   }

//   //// new function yahaya birth day
//   static findDayBeforeYahyaEid(DateTime lastDayOfPanja) {
//     return DateTime(lastDayOfPanja.year, lastDayOfPanja.month,
//         lastDayOfPanja.day + 60, 0, 0);
//   }

//   //// new function Edi bozorg
//   static findDayBeforeAdamEid(DateTime lastDayOfPanja) {
//     return DateTime(lastDayOfPanja.year, lastDayOfPanja.month,
//         lastDayOfPanja.day + 120, 0, 0);
//   }

//   // static yahyaNewYear(mandaMonth, panjaDate, selectedDay) {
//   //   int panjaYear = panjaDate.yearOfPanje;
//   //   // DateTime selectedDay = panjaDate.selectedDay;
//   //   DateTime lastDayOfPanja = panjaDate.lastDayOfPanja;
//   //   int yahyaYear = panjaYear + 1;

//   //   if ((mandaMonth >= 3) &&
//   //       ((selectedDay.difference(lastDayOfPanja)).inDays > 0)) {
//   //     yahyaYear = yahyaYear + 1;
//   //   }
//   //   return yahyaYear;
//   // }

//   // static adamNewYear(mandaMonth, panjaDate, selectedDay) {
//   //   final int adamBaseYear = MandaBaseDate.adamBaseYear;
//   //   int panjaYear = panjaDate.yearOfPanje;
//   //   // DateTime selectedDay = panjaDate.selectedDay;
//   //   DateTime lastDayOfPanja = panjaDate.lastDayOfPanja;
//   //   int adamYear = panjaYear + adamBaseYear + 1;
//   //   if ((mandaMonth >= 5) &&
//   //       ((selectedDay.difference(lastDayOfPanja)).inDays > 0)) {
//   //     adamYear = adamYear + 1;
//   //   }
//   //   return adamYear;
//   // }
// }
