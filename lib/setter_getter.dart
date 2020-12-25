class LocalLang {
  String lang;

  String get name {
    return lang;
  }

  set name(String name) {
    this.lang = name;
  }
}

class MandaCalendar {
  bool kind;

  bool get active {
    return kind;
  }

  set active(bool active) {
    this.kind = active;
  }
}

class GregCalendar {
  bool kind;

  bool get active {
    return kind;
  }

  set active(bool active) {
    this.kind = active;
  }
}

class ShamsiCalendar {
  bool kind;

  bool get active {
    return kind;
  }

  set active(bool active) {
    this.kind = active;
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
  var manda;
  var greg;
  var shamsi;
  var selected;

  Data(
      {this.lang,
      this.divecSize,
      this.selected,
      this.manda,
      this.greg,
      this.shamsi});
}
