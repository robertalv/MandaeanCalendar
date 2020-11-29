import 'manda_equivalent.dart';

class MulwashaLabel {
  String title;
  String male;
  String female;
  var monthName;
  String birthMonthLabel;
  var mother;
  String motherLabel;

  String birthTimeLabel;
  String alertOK;
  Map alertMsg;
  String alertTtitle;
  List dateLabel;
  // List chooseYear;
  List convertDate;
  String findBut;
  List yearMaxMin;
  List convertDateLabel;
  String backBtn;
  List boyGirl;
  String mulwashalError;
  var birthTime;
  List birthTimeSelector;
  List childTalea;
  var maleMulwasha;
  var menuDrop;
  // var mandaYearEvents;
  var mandaYearEventsLable;
  var mandaFeastName;
  // var myAlignment;
  // var birthTimeNew;

  MulwashaLabel(localLang) {
    // int selectedYear = selectedDay.year;
    this.title = MandaEqu.mulwashaTitle(localLang);
    this.male = MandaEqu.mulwashaMale(localLang);
    this.female = MandaEqu.mulwashaFemale(localLang);
    this.monthName = birthMonthName(localLang);
    this.birthMonthLabel = MandaEqu.birthLabel(localLang);
    this.mother = motherMulwasha(localLang);
    this.motherLabel = MandaEqu.motherLabel(localLang);

    this.birthTimeLabel = MandaEqu.timeLabel(localLang);
    this.alertOK = MandaEqu.alertOk(localLang);
    this.alertMsg = MandaEqu.alertConvertMsg(localLang);
    this.alertTtitle = MandaEqu.alertTtitle(localLang);
    this.dateLabel = MandaEqu.dateLabel(localLang);
    // this.chooseYear = MandaEqu.chooseYear(localLang);
    this.convertDate = MandaEqu.convertDate(localLang);
    this.findBut = MandaEqu.findBut(localLang);
    this.yearMaxMin = MandaEqu.yearMaxMin(localLang);
    this.convertDateLabel = MandaEqu.convertDateLabel(localLang);
    this.backBtn = MandaEqu.backBtn(localLang);
    this.boyGirl = MandaEqu.boyGirl(localLang);
    this.mulwashalError = MandaEqu.mulwashalError(localLang);
    this.birthTime = birthTimeName(localLang);
    // this.birthTimeNew = birthTimeNameNew(localLang);
    this.birthTimeSelector = birthTimeSelectorName(localLang);
    this.childTalea = childTaleaName(localLang);
    this.maleMulwasha = maleMulwashaName(localLang);
    this.menuDrop = menuDropList(localLang);
    // this.mandaYearEvents = MandaEqu.mandaYearEvents(localLang);
    this.mandaYearEventsLable = MandaEqu.mandaYearEventsLable(localLang);
    // this.myAlignment = MandaEqu.myAlignment(localLang);
  }

  static birthTimeName(String localLang) {
    var dataList;
    if (localLang == 'en_US') {
      dataList = MandaEqu.birthTimeEn();
    } else {
      dataList = MandaEqu.birthTimeFa();
    }

    return dataList;
  }

  static birthTimeSelectorName(String localLang) {
    var dataList;
    if (localLang == 'en_US') {
      dataList = MandaEqu.birthTimeSelectorEn();
    } else if (localLang == 'fa_IR') {
      dataList = MandaEqu.birthTimeSelectorFa();
    } else {
      dataList = MandaEqu.birthTimeSelectorAr();
    }
    return dataList;
  }

  static childTaleaName(String localLang) {
    var dataList;
    if (localLang == 'en_US') {
      dataList = MandaEqu.Talea(0);
    } else if (localLang == 'fa_IR') {
      dataList = MandaEqu.Talea(1);
    } else {
      dataList = MandaEqu.Talea(2);
    }
    return dataList;
  }

  static birthMonthName(String localLang) {
    var dataList;
    if (localLang == 'en_US') {
      dataList = MandaEqu.birthMonthNameEn();
    } else if (localLang == 'fa_IR') {
      dataList = MandaEqu.birthMonthNameFa();
    } else {
      dataList = MandaEqu.birthMonthNameAr();
    }
    return dataList;
  }

  static motherMulwasha(String localLang) {
    var dataList;
    if (localLang == 'en_US') {
      dataList = MandaEqu.femaleMulwashaEn();
      // dataList.add("----");
    } else {
      dataList = MandaEqu.femaleMulwashaFa();
      // dataList.add("----");
    }
    return dataList;
  }

  static maleMulwashaName(String localLang) {
    var dataList;
    if (localLang == 'en_US') {
      dataList = MandaEqu.maleMulwashaEn();
      // dataList.add("----");
    } else {
      dataList = MandaEqu.maleMulwashaFa();
      // dataList.add("----");
    }
    return dataList;
  }

  static menuDropList(String localLang) {
    var dataList;
    if (localLang == 'en_US') {
      dataList = MandaEqu.menuDrop(0);
    } else if (localLang == 'fa_IR') {
      dataList = MandaEqu.menuDrop(1);
    } else {
      dataList = MandaEqu.menuDrop(2);
    }
    return dataList;
  }
}
