import 'local_number.dart';
import 'manda_date.dart';
import 'manda_equivalent.dart';

class MandaFormatedDateBuilder {
  String fullDay;
  String localLang;
  String fullYearEnFa;

  MandaFormatedDateBuilder(DateTime selectedDay, String localLang) {
    List mandaFormated = convertSelectedDayToMandaDay(selectedDay, localLang);

    this.fullYearEnFa = LocalNum.convertEntoFa(mandaFormated[1], localLang);

    this.fullDay = LocalNum.convertEntoFa(mandaFormated[0], localLang);
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

    String mandaFullDay;
    if (localLang == 'en_US') {
      mandaFullDay =
          '   ( ${mandaDate.yearAdam} Adam)  (${mandaDate.yearYahya} Yahyaiee)  $mandaDayNum, ${mandaDate.monthEn} ( ${mandaDate.monthFa} ) ';
    } else {
      mandaFullDay =
          '   (ح آدم  ${mandaDate.yearAdam})  (ح یحیی  ${mandaDate.yearYahya}) $mandaDayNum, ${mandaDate.monthEn} ( ${mandaDate.monthFa} ) ';
    }

    String mandaDay = '  ' +
        mandaDayNum +
        ' , ' +
        mandaDate.monthEn +
        ' ( ' +
        mandaDate.monthFa +
        ' )   =  ' +
        jalaliDay.day.toString() +
        ' , ' +
        MandaEqu.jalaliMonth(jalaliDay.month) +
        ' ( ' +
        jalaliDay.formatter.mN +
        ' )  ';

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
