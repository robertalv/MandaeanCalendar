class MyFontSize {
  static s21(var data) {
    double size;
    double divecWidth = data.divecSize.width;
    if (divecWidth > 700) {
      size = 2.0;
    } else {
      size = 1.0;
    }
    return size;
  }

  static s2216(var data) {
    double size;
    double divecWidth = data.divecSize.width;

    if (divecWidth > 700) {
      size = 22.0;
    } else {
      size = 16.0;
    }
    return size;
  }

  static s2412(var data) {
    double size;
    double divecWidth = data.divecSize.width;

    if (divecWidth > 700) {
      size = 24.0;
    } else {
      size = 12.0;
    }
    return size;
  }

  static s4020(var data) {
    double size;
    double divecWidth = data.divecSize.width;

    if (divecWidth > 700) {
      size = 40.0;
    } else {
      size = 20.0;
    }
    return size;
  }

  static s4022(var data) {
    double size;
    double divecWidth = data.divecSize.width;

    if (divecWidth > 700) {
      size = 40.0;
    } else {
      size = 22.0;
    }
    return size;
  }

  static s3016(var data) {
    double size;
    double divecWidth = data.divecSize.width;

    if (divecWidth > 700) {
      size = 30.0;
    } else {
      size = 16.0;
    }
    return size;
  }

  static cellWidth(var data) {
    double size;
    double divecWidth = data.divecSize.width;

    if (divecWidth > 700) {
      size = 100.0;
    } else {
      size = divecWidth / 7;
    }
    return size;
  }

  static displayWidth(var data) {
    double size;
    double divecWidth = data.divecSize.width;
    if (divecWidth > 700) {
      size = 700;
    } else {
      size = divecWidth;
    }
    return size;
  }

  static headerMonthYearWidth(var data) {
    double size = cellWidth(data);
    double divecWidth = data.divecSize.width;
    if (divecWidth > 700) {
      size = 470;
    } else {
      size = size * 4.5;
    }
    return size;
  }
}

class TableSize {
  double divecWidth;
  double cellWidth;
  double displayWidth;
  double sizeRate;
  double iconRate;
  double minHeightCell;
  double headerMonthYear;
  double headerMonthYearWidth;
  double headerDayWeek;
  double marginDayRow;
  double dayNum;
  double f8040;
  double f5025;
  double f4020; //// used for list builder
  double marginH;
  TableSize(data) {
    divecWidth = data.divecSize.width;
    if (divecWidth > 700) {
      cellWidth = 100.0;
      displayWidth = 700.0;
      minHeightCell = 55.0;
      sizeRate = 2;
      iconRate = 1.5;
      headerMonthYear = 35.0;
      headerMonthYearWidth = 470;
      headerDayWeek = 20.0;
      marginDayRow = 20.0;
      dayNum = 40.0;
      f8040 = 80;
      f5025 = 50;
      f4020 = 40;
      marginH = (divecWidth - 700) / 2;
    } else {
      cellWidth = divecWidth / 7;
      displayWidth = divecWidth;
      minHeightCell = 40.0;
      sizeRate = 1;
      iconRate = 1;
      headerMonthYear = 18.0;
      headerMonthYearWidth = cellWidth * 4.5;
      headerDayWeek = 16.0;
      marginDayRow = 2.0;
      dayNum = 24.0;
      f5025 = 25;
      f4020 = 20;
      marginH = 0;
      if (data.lang.name == 'en_US') {
        dayNum = 20.0;
      }
    }

    if (divecWidth <= 320) {
      headerDayWeek = 11.0;
    }
    // this.divecWidth = divecWidth;
    // this.cellWidth = cellWidth;
    // this.displayWidth = displayWidth;
    // this.sizeRate = sizeRate;
    // this.f8040 = f8040;
    // this.f5025 = f5025;
    // this.marginH = marginH;
  }
}

class MainSize {
  double f8040;
  double f5025;
  double f4020; //// used for list builder
  double f2814;
  double marginH;
  double cellWidth;
  double rate21;
  double iconRate;
  double iconRateList;
  MainSize(data) {
    double divecWidth = data.divecSize.width;
    if (divecWidth > 700) {
      f8040 = 80;
      f5025 = 50;
      f4020 = 40;
      marginH = (divecWidth - 700) / 2;
      cellWidth = 100.0;
      iconRate = 1.5;
      iconRateList = 2;
      rate21 = 2.0;
      f2814 = 28;
    } else {
      rate21 = 1.0;
      f8040 = 40;
      f5025 = 25;
      f4020 = 20;
      marginH = 0;
      cellWidth = divecWidth / 7;
      iconRate = 1;
      iconRateList = 1.5;
      f2814 = 14;
    }
    this.f8040 = f8040;
    this.f5025 = f5025;
    this.marginH = marginH;
  }
}
