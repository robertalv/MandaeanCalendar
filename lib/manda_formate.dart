import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'local_number.dart';
import 'manda_date.dart';
import 'manda_equivalent.dart';
import 'my_alignment.dart';

class MandaFormatedDateBuilder {
  String fullDay;
  String localLang;
  String fullYearEnFa;

  MandaFormatedDateBuilder(DateTime selectedDay, String localLang) {
    List mandaFormated = convertSelectedDayToMandaDay(selectedDay, localLang);

    this.fullYearEnFa = LocalNum.convertEntoFaAr(mandaFormated[1], localLang);
    this.fullDay = LocalNum.convertEntoFaAr(mandaFormated[0], localLang);
    this.localLang = localLang;
  }

  static convertSelectedDayToMandaDay(DateTime selectedDay, String localLang) {
    MandaDateBuilder mandaDate = MandaDateBuilder(selectedDay);

    var jalaliDay = MandaDateBuilder.jalaliDayForSelectedDay(selectedDay);

    var mandaDayNum = mandaDate.day.toString();
    String mandaYear;
    if (localLang == 'en_US') {
      mandaYear =
          '   ( ${mandaDate.yearAdam} Adam)  (${mandaDate.yearYahya} Yahyaiee)  (${jalaliDay.year} Shamsi)   ';
    } else {
      mandaYear =
          '   (ح آدم  ${mandaDate.yearAdam})  (ح یحیی  ${mandaDate.yearYahya})  (شمسی  ${jalaliDay.year})   ';
    }

    String mandaDay;
    if (localLang == 'en_US') {
      mandaDay = '  ' +
          mandaDate.monthEn +
          ' ' +
          mandaDayNum +
          '  =  ' +
          MandaEqu.jalaliMonth(jalaliDay.month) +
          ' ' +
          jalaliDay.day.toString() +
          '  ';
    } else if (localLang == 'ar') {
      mandaDay = '  ' +
          mandaDate.monthFa +
          ' ' +
          mandaDayNum +
          '  =  ' +
          jalaliDay.formatter.mN +
          ' ' +
          jalaliDay.day.toString() +
          '  ';
    } else {
      mandaDay = '  ' +
          mandaDate.monthFa +
          '  ' +
          mandaDayNum +
          '  =  ' +
          jalaliDay.formatter.mN +
          '  ' +
          jalaliDay.day.toString() +
          '  ';

      // mandaDay = '  ' +
      //     mandaDayNum.toString() +
      //     ' ' +
      //     mandaDate.monthFa +
      //     '  =  ' +
      //     jalaliDay.day.toString() +
      //     ' ' +
      //     jalaliDay.formatter.mN;
    }

    // String mandaDay = '  ' +
    //     mandaDayNum +
    //     ' , ' +
    //     mandaDate.monthEn +
    //     ' ( ' +
    //     mandaDate.monthFa +
    //     ' )   =  ' +
    //     jalaliDay.day.toString() +
    //     ' , ' +
    //     MandaEqu.jalaliMonth(jalaliDay.month) +
    //     ' ( ' +
    //     jalaliDay.formatter.mN +
    //     ' )  ';

    return [mandaDay, mandaYear];
  }

  static fullMandaDay(DateTime selectedDay, String localLang) {
    MandaDateBuilder mandaDate = MandaDateBuilder(selectedDay);

    var mandaDayNum = mandaDate.day.toString();

    String mandaFullDay;
    if (localLang == 'en_US') {
      mandaFullDay =
          '( ${mandaDate.yearAdam} Adam) (${mandaDate.yearYahya} Yahyaiee), $mandaDayNum, ${mandaDate.monthEn} ( ${mandaDate.monthFa} ) ';
    } else {
      mandaFullDay =
          '(ح آدم  ${mandaDate.yearAdam}) (ح یحیی  ${mandaDate.yearYahya}), $mandaDayNum, ${mandaDate.monthEn} ( ${mandaDate.monthFa} ) ';
    }
    return mandaFullDay;
  }
}

// @override
// Widget mandaDayFa(BuildContext context, _selectedDay, _localLang) {
//   double _divecWidth = MediaQuery.of(context).size.width;
//   double dateIconSize;
//   double _sizeRate;
//   double _listFontSize = 20;
//   if (_divecWidth > 700) {
//     _sizeRate = 2;

//     dateIconSize = 25;
//   } else {
//     _sizeRate = 1;

//     dateIconSize = 16;
//   }

//   var myDateIcon = Icon(
//     Icons.date_range,
//     size: dateIconSize,
//   );

//   var beforeDateIcon;
//   var afterDateIcon;

//   if (_localLang != "en_US") {
//     _listFontSize = 20;
//     beforeDateIcon = Text("");
//     afterDateIcon = myDateIcon;
//   } else {
//     beforeDateIcon = myDateIcon;
//     afterDateIcon = Text("");
//   }
//   var myTextAlignment = MyAlignment.textAlig(_localLang);
//   var myAlignment = MyAlignment.countryLanguage(_localLang);
//   MandaDateBuilder mandaDate = MandaDateBuilder(_selectedDay);
//   return Row(
//     children: [
//       beforeDateIcon,
//       Flexible(
//         child: Container(
//           alignment: myAlignment,
//           child: Text(
//             // _mandeanDay,
//             "",
//             textAlign: myTextAlignment,
//             style: TextStyle(
//                 fontSize: _listFontSize * _sizeRate, color: Colors.black),
//           ),
//         ),
//       ),
//       Text(
//         (mandaDate.monthFa).toString(),
//         style:
//             TextStyle(fontSize: _listFontSize * _sizeRate, color: Colors.black),
//       ),
//       Text(
//         LocalNum.convertEntoFa(mandaDate.day.toString(), _localLang),
//         style:
//             TextStyle(fontSize: _listFontSize * _sizeRate, color: Colors.black),
//       ),
//       afterDateIcon
//     ],
//   );
// }
