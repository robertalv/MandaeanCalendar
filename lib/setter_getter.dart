class LocalLang {
  String lang;

  String get name {
    return lang;
  }

  set name(String name) {
    this.lang = name;
  }
}

// class CalendarActiveKind {
//   String value;

//   String get kind {
//     return value;
//   }

//   set kind(String kind) {
//     this.value = kind;
//   }
// }

class MandaCalendarActive {
  bool kind;

  bool get active {
    return kind;
  }

  set active(bool active) {
    this.kind = active;
  }
}

class GregCalendarActive {
  bool kind;

  bool get active {
    return kind;
  }

  set active(bool active) {
    this.kind = active;
  }
}

class ShamsiCalendarActive {
  bool kind;

  bool get active {
    return kind;
  }

  set active(bool active) {
    this.kind = active;
  }
}

class MandaMonthInfo {
  Map value;

  Map get info {
    return value;
  }

  set info(Map info) {
    this.value = info;
  }
}

class GregMonthInfo {
  Map value;

  Map get info {
    return value;
  }

  set info(Map info) {
    this.value = info;
  }
}

class ShamsiMonthInfo {
  Map value;

  Map get info {
    return value;
  }

  set info(Map info) {
    this.value = info;
  }
}

class Selected {
  DateTime value;

  DateTime get date {
    return value;
  }

  set date(DateTime date) {
    this.value = date;
  }
}

class StartOfMonth {
  DateTime value;

  DateTime get date {
    return value;
  }

  set date(DateTime date) {
    this.value = date;
  }
}

class EndOfMonth {
  DateTime value;

  DateTime get date {
    return value;
  }

  set date(DateTime date) {
    this.value = date;
  }
}

class DivecSize {
  double size;

  double get width {
    return size;
  }

  set width(double name) {
    this.size = name;
  }
}

class Data {
  var lang;
  var divecSize;
  var mandaKind;
  var gregKind;
  var shamsiKind;
  var selected;
  DateTime today;
  var last;
  var first;
  var mandaMonth;
  var gregMonth;
  var shamsiMonth;

  Data(
      {this.lang,
      this.today,
      this.last,
      this.first,
      this.mandaMonth,
      this.gregMonth,
      this.shamsiMonth,
      this.divecSize,
      this.selected,
      this.mandaKind,
      this.gregKind,
      this.shamsiKind});
}
