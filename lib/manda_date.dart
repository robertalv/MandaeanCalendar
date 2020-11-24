import 'package:shamsi_date/shamsi_date.dart';
import 'manda_base.dart';

///// *************************************************************************************
/////// Assumption:
//// Pamja 13
/// Ghina 1, Arghva 2, Hatia 3, Gadea 4, Dolla 5, Nona 6,
/// Amber 7, Tora 8, Solme 9, Sertana 10, Area 11, Shobolta 12
/// Reality Dolla 1, Nona 2, ... Shobolta 8, Pamja, Ghina 9, ..Gadea 12.

class MandaDateBuilder {
  int day;
  int month;
  int yearAdam;
  int yearYahya;
  String monthFa;
  String monthEn;
  MandaDateBuilder(selectedDay) {
    Map mandaDayMonth = createMandaDate(selectedDay);
    this.day = mandaDayMonth['day'];
    this.month = mandaDayMonth['month'];
    this.yearAdam = mandaDayMonth['adamYear'];
    this.yearYahya = mandaDayMonth['yahyaYear'];
    this.monthFa = monthNameFa(this.month);
    this.monthEn = monthNameEn(this.month);
  }

  static createMandaDate(DateTime selectedDay) {
    Map mandaDayMonth;
    int adamYear;
    int yahyaYear;

    DateTime newSelectedDay =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 0, 0);

    int dayDiffToSelectedDay = findDiffFromBaseToSelectedDay(newSelectedDay);

    int yearDiffToSelectedDay = newSelectedDay.year;

    mandaDayMonth = createMandaDayMonth(dayDiffToSelectedDay);
    yahyaYear = createYahyaYear(dayDiffToSelectedDay, yearDiffToSelectedDay);
    adamYear = createAdamYear(dayDiffToSelectedDay, yearDiffToSelectedDay);

    return {
      'day': mandaDayMonth['day'],
      'month': mandaDayMonth['month'],
      'yahyaYear': yahyaYear,
      'adamYear': adamYear
    };
  }

  static findDiffFromBaseToSelectedDay(DateTime selectedDay) {
    DateTime beginningofSelectedDay = DateTime(selectedDay.year, 1, 1, 0, 0);

    int leapG = ((selectedDay.year) ~/ 4) -
        (((((selectedDay.year) ~/ 100) + 1) * 3) ~/ 4);

    int diffFromBeginningYear =
        diffBetDays(selectedDay, beginningofSelectedDay);

    int lastDayOfFeb = DateTime(selectedDay.year, 3, 0, 0, 0).day;

    int leapIndexDay = leapG;
    // if (selectedDay.year > 0) {
    leapIndexDay = leapIndexDay + 1;
    if (lastDayOfFeb == 29) {
      leapIndexDay = leapIndexDay - 1;
    }
    // }

    int diffToSelectedDay = 1 + diffFromBeginningYear + leapIndexDay;
    // return {'day': diffToSelectedDay, 'year': selectedDay.year};
    return diffToSelectedDay;
  }

  static createMandaDayMonth(int diffToSelectedDay) {
    int mandaInDays;
    Map mandaDayMonth;
    int indexDay = -203;

    if (diffToSelectedDay <= 203) {
      indexDay = 162;
    }
    diffToSelectedDay = diffToSelectedDay + indexDay;

    mandaInDays = diffToSelectedDay - (diffToSelectedDay ~/ 365) * 365;
    if (mandaInDays == 0) {
      return {'day': 5, 'month': 13};
    }

    // assert(mandaInDays < 366);
    mandaDayMonth = formateMandaDay(mandaInDays);

    return {'day': mandaDayMonth['day'], 'month': mandaDayMonth['month']};
  }

  static formateMandaDay(int mandaInDays) {
    int mandaDay;
    int mandaMonth;
    int monthIndex;
    monthIndex = mandaInDays ~/ 30;
    mandaDay = mandaInDays - monthIndex * 30;
    if (mandaDay == 0) {
      mandaDay = 30;
      monthIndex = monthIndex - 1;
    }
    mandaMonth = monthIndex + 1;
    // assert(mandaDay < 31 && mandaDay > 0);
    // assert(mandaMonth < 14 && mandaMonth > 0);

    return {'day': mandaDay, 'month': mandaMonth};
  }

  static createYahyaYear(int dayDiffToSelectedDay, int yearDiffToSelectedDay) {
    if (dayDiffToSelectedDay < 264) {
      return 1 + yearDiffToSelectedDay;
    }
    return 2 + yearDiffToSelectedDay + (dayDiffToSelectedDay - 264) ~/ 365;
  }

  static createAdamYear(int dayDiffToSelectedDay, int yearDiffToSelectedDay) {
    if (dayDiffToSelectedDay < 324) {
      return MandaBaseDate.adamBaseYear + 1 + yearDiffToSelectedDay;
    }
    return MandaBaseDate.adamBaseYear +
        2 +
        yearDiffToSelectedDay +
        (dayDiffToSelectedDay - 324) ~/ 365;
  }

  static monthNameFa(monthNum) {
    List mandaMonthName = MandaBaseDate.matchMandaMonthName(monthNum);
    return mandaMonthName[1];
  }

  String monthNameEn(monthNum) {
    List mandaMonthName = MandaBaseDate.matchMandaMonthName(monthNum);
    return mandaMonthName[0];
  }

  static diffBetDays(DateTime dateSart, DateTime dateEnd) {
    var diffDuration = dateSart.difference(dateEnd);
    int diffInhours = diffDuration.inHours;
    int diffInDays = (diffInhours / 24).round();
    return diffInDays;
  }

  static jalaliDayForSelectedDay(DateTime selectedDay) {
    // Jalali j = Jalali(1397, 5, 6);
    // convert to Gregorian:
    // Gregorian j2g1 = j.toGregorian(); // -> 2018/8/28
    // // or equivalently:
    // Gregorian j2g2 = Gregorian.fromJalali(j);

    // Gregorian g = Gregorian(2019, 10, 26);
    // // convert to Jalali:
    // Jalali g2j1 = g.toJalali(); // -> 1398/8/4
    // // or equivalently:
    // Jalali g2j2 = Jalali.fromGregorian(g);

    Gregorian gSelectedDay =
        Gregorian(selectedDay.year, selectedDay.month, selectedDay.day);

    return Jalali.fromGregorian(gSelectedDay);
  }
}

///// *************************************************************************************

class ConvertMandaDateToGorBuilder {
  int day;
  int month;
  int yearYahya;
  DateTime gDate;
  int dayDiffBaseToSelectedDay;
  ConvertMandaDateToGorBuilder(List mandaSelectedDay) {
    this.day = mandaSelectedDay[0];
    this.month = mandaSelectedDay[1];
    this.yearYahya = mandaSelectedDay[2];
    this.dayDiffBaseToSelectedDay =
        findDiffFromBaseToSelectedDay(this.yearYahya, this.month, this.day);
    this.gDate = convertToGorDate(this.dayDiffBaseToSelectedDay);
  }

  static convertToGorDate(dayDiffBaseToSelectedDay) {
    return DateTime(0, 1, 1 + dayDiffBaseToSelectedDay, 0, 0);
  }

  static findDiffFromBaseToSelectedDay(int yearYahya, int month, int day) {
    Map mandaBase = MandaBaseDate.mandaBase;
    int diffDaysFromManda =
        (month - mandaBase['m']) * 30 + (day - mandaBase['d']);

    int indexDay = 0;
    if (diffDaysFromManda < -102) {
      indexDay = 365;
    }
    int diffDaysFromMandaYear =
        diffDaysFromManda + (yearYahya - mandaBase['y']) * 365 + indexDay;

    return diffDaysFromMandaYear;
  }
}
