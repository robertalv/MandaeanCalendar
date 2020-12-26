class MyFontSize {
  // static selection(_divecWidth) {
  //   if (_divecWidth > 700) {
  //     _daysOfWeekFontSize = 24.0;
  //     _headerFontSize = 40.0;
  //     _daysFontSize = 40.0;
  //     // _centerIcon = 67;
  //     _sizeRate = 2;
  //     _marginHor = 6 + (_divecWidth - 700) / 2;
  //     _longFontSize = 22.0;
  //     dateIconSize = 30;
  //   } else {
  //     _daysOfWeekFontSize = 12.0;
  //     _headerFontSize = 20.0;
  //     _daysFontSize = 22.0;
  //     _sizeRate = 1;
  //     _marginHor = 6.0;
  //     _longFontSize = 16.0;
  //     dateIconSize = 16;
  //     if (_localLang == "en_US") {
  //       _daysFontSize = 18.0;
  //     }
  //   }
  // }
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
