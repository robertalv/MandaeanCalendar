import 'package:flutter/material.dart';

class MandaEqu {
  // String _malwasha = "Melvashe";

  static mandaMonthNameFa() {
    final List<String> data = [
      'سرطانا',
      'آریا',
      'شمبلتا',
      'قینا',
      'ارقوا',
      'هطیا',
      'گدیا',
      'دولا',
      'نونا',
      'امبرا',
      'تورا',
      'صلمی',
      'پنجه',
    ];
    return data;
  }

  static mandaMonthNameEn() {
    final List<String> data = [
      'Sartana',
      'Aria',
      'Shombolta',
      'Qaina',
      'Arqawa',
      'Hatia',
      'Gadia',
      'Daula',
      'Nuna',
      'Embra ',
      'Taura',
      'Ṣelmi',
      'Panja'
    ];
    return data;
  }

  static mandaFirstMonth() {
    Map firstMonth = {
      'en_US': ' First day of Mandaic Month ',
      'fa_IR': ' اول ماه مندایی  ',
      'ar': ' رأس الشهر '
    };
    return [firstMonth];
  }

  static mandaLightMbattal() {
    Map lightMbattal = {
      'en_US': ' Minor Mbattal Day ',
      'fa_IR': ' روز أمبطل سبک ',
      'ar': ' یوم مبطل خفیف '
    };

    return [lightMbattal];
  }

  static mandaHeavyMbattal() {
    Map heavytMbattal = {
      'en_US': ' Major Mbattal Day ',
      'fa_IR': ' روز أمبطل سنگین   ',
      'ar': ' یوم مبطل ثقیل '
    };
    return [heavytMbattal];
  }

  static mandaFeastName() {
    Map heavytMbattal = {
      'en_US': ' Religious Occasion ',
      'fa_IR': ' مناسبت دینی ',
      'ar': ' مناسبه دینیه '
    };
    return [heavytMbattal];
  }

  static mandaYearEventsLable(index) {
    Map data = {
      'en_US': [
        'Religious Occasion',
        ' Display the religious occasions of the year '
      ],
      'fa_IR': ['مناسبت های دینی', '  نمایش  مناسبت های دینی سال       '],
      'ar': ['للمناسبات دینیه', 'عرض للمناسبات الدينية العام ']
    };
    return data[index];
  }

  static mandaYearEvents(index) {
    String exSpeace = " " * 10;
    Map data = {
      'en_US': [
        '  Select an occasion',
        '  Religious Holy Days',
        '  First day of Mandaic Month',
        '  Minor Mbattal Day',
        '  Major Mbattal Day',
      ],
      'fa_IR': [
        '  یک مناسبت دینی انتخاب کنید      ',
        '  اعیاد و مناسبت های مذهبی      ',
        '  اول ماه مندایی  ',
        '  روز أمبطل سبک  ',
        '  روز أمبطل سنگین  '
      ],
      'ar': [
        '  اختر مناسبة دینیه  ',
        '  الأعياد والمناسبات الدينية  ',
        '  رأس الشهر  ',
        '  یوم مبطل خفیف  ',
        '  یوم مبطل ثقیل  '
      ],
    };
    return data[index];
  }

  static mandaFeast() {
    final Map mandaFeast = {
      'banja': [
        {
          'en_US': 'Parwanaiia (Panja) Feast - Day 1',
          'fa_IR': ' پروانایا (پنجه) روز اول ',
          'ar': 'بروانایا (البنجه) یوم اول '
        },
        {
          'en_US': 'Parwanaiia (Panja) Feast - Day 2',
          'fa_IR': ' پروانایا (پنجه) روز دوم ',
          'ar': 'بروانایا (البنجه) یوم ثانی '
        },
        {
          'en_US': 'Parwanaiia (Panja) Feast - Day 3',
          'fa_IR': ' پروانایا (پنجه) روز سوم ',
          'ar': 'بروانایا (البنجه) یوم ثالث '
        },
        {
          'en_US': 'Parwanaiia (Panja) Feast - Day 4',
          'fa_IR': ' پروانایا (پنجه) روز چهارم ',
          'ar': 'بروانایا (البنجه) یوم الرابع '
        },
        {
          'en_US': 'Parwanaiia (Panja) Feast - Day 5',
          'fa_IR': ' پروانایا (پنجه) روز پنجم ',
          'ar': 'بروانایا (البنجه) یوم الخامس '
        },
      ],
      'yahya': {
        'en_US': 'Dehva ed Daima feast (Birth of John the Baptist)',
        'fa_IR': ' (دهوا اد دیما (میلاد حضرت یحیی  ',
        'ar': ' (دهوا اد دیما (میلاد نبی یحیی  ',
      },
      'kenshi': {
        'en_US': 'Kenshi-u-Zehli feast - Beginning of Kersa',
        'fa_IR': ' کنشو زهلی - شروع كراصا  ',
        'ar': ' کنشو زهلی - بداية كراصا  '
      },
      'eidBig': {
        'en_US': 'Dehva Raba feast (The Great feast) - Second day of Kersa',
        'fa_IR': ' دهوا ربا (عید بزرگ) - روز دوم كراصا   ',
        'ar': 'دهوا ربا (عید الکبیر) -  كراصا یوم ثانی '
      },
      'kersa': {
        'en_US': 'Dehva Raba feast - End of Kersa',
        'fa_IR': ' دهوا ربا - پایان کراصا ',
        'ar': 'دهوا ربا - یوم الطلعه '
      },
      'shoshian': [
        {
          // 'en_US': 'The remembrance of Shushian feast - Day 1',
          'en_US': 'Dehva Sheshian feast - Day 1',
          'fa_IR': ' عید شیشیان - روز اول  ',
          'ar': ' عید شیشیان - یوم اول  '
        },
        {
          // 'en_US': 'The remembrance of Shushian feast - Day 2',
          'en_US': 'Dehva Sheshian feast - Day 2',
          'fa_IR': ' عید شیشیان - روز دوم ',
          'ar': ' عید شیشیان - یوم ثانی '
        }
      ],
      'alfil': {
        'en_US': 'The Fel festival',
        'fa_IR': 'جشن فل  ',
        'ar': 'احتفال فل  '
      },
      // 'alfil': {'en_US': 'The Fel feast', 'fa_IR': 'عید فل', 'ar': 'العید فل'},
      'eidSmall': {
        'en_US': 'The Dehva Honina feast (The small feast) ',
        'fa_IR': '(عید کوچک ) دهوا حنینا ',
        'ar': ' (العید الصغیر ) دهوا حنینا '
      },
      'ashoreh': {
        'en_US': 'The Ashorieh day (AbulHeris)',
        'fa_IR': '(عاشوریه (ابوالهریس ',
        'ar': '(عاشوریه (ابوالهریس '
      },
    };
    return mandaFeast;
  }

  static jalaliMonth(int index) {
    List month = [
      'Farvardin',
      'Ordibehesht',
      'Khordad',
      'Tir',
      'Mordad',
      'Shahrivar',
      'Mehr',
      'Aban',
      'Azar',
      'Dey',
      'Bahman',
      'Esfand'
    ];
    return month[index - 1];
  }

  static changeDayFormate(String dayFa) {
    String newFormateDay = dayFa;
    switch (dayFa) {
      case 'یکشنبه':
        {
          newFormateDay = 'یک شنبه';
        }
        break;

      case 'دوشنبه':
        {
          newFormateDay = 'دو شنبه';
        }
        break;

      case 'سه‌شنبه':
        {
          newFormateDay = 'سه‌ شنبه';
        }
        break;

      case 'چهارشنبه':
        {
          newFormateDay = 'چهار شنبه';
        }
        break;

      case 'پنجشنبه':
        {
          newFormateDay = 'پنج شنبه';
        }
        break;
    }

    return newFormateDay;
  }

  static changeMonthFormate(String month) {
    Map monthAr = {
      'January': ' كانون الثاني',
      'February': 'شباط ',
      'March': ' آذار ',
      'April': 'نيسان ',
      'May': 'أيار ',
      'June': 'حزيران ',
      'July': 'تموز ',
      'August': 'آب ',
      'September': 'أيلول ',
      'October': 'تشرين الأول ',
      'November': 'تشرين الثاني ',
      'December': 'كانون الأول ',
    };
    return monthAr[month];
  }

  static changeDayFormate22(String dayFa) {
    String newFormateDay = dayFa;
    String fixDay = "شنبه";
    switch (dayFa) {
      case 'یکشنبه':
        {
          newFormateDay = '۱' + fixDay;
          // newFormateDay = newFormateDay.split('').reversed.join('');
          // newFormateDay = fixDay;
        }
        break;

      case 'دوشنبه':
        {
          newFormateDay = "($fixDay)2";
          // newFormateDay = '۲' + fixDay;
        }
        break;

      case 'سه‌شنبه':
        {
          newFormateDay = ' سه ‌شنبه';
          // newFormateDay = 'سه‌ شنبه';
        }
        break;

      case 'چهارشنبه':
        {
          newFormateDay = 'چهار شنبه';
          // newFormateDay = 'چهار شنبه';
        }
        break;

      case 'پنجشنبه':
        {
          newFormateDay = 'پنج شنبه';
          // newFormateDay = 'پنج شنبه';
        }
        break;

      case 'جمعه':
        {
          newFormateDay = 'جمعه';
        }
        break;

      case 'شنبه':
        {
          newFormateDay = 'شنبه';
        }
        break;
    }

    return newFormateDay;
  }

  static backBtn(index) {
    Map mulwashal = {
      'en_US': '<< Back to Calendar',
      'fa_IR': '<< بازگشت به تقویم',
      'ar': '<< العودة إلى التقويم'
    };
    return mulwashal[index];
  }

  static calendarTitle(index) {
    Map mulwashal = {
      'en_US': '  Mandaean Calendar',
      'fa_IR': '  تقویم  مندایی',
      'ar': ' التقويم المندائي '
    };
    return mulwashal[index];
  }

  static mulwashaTitle(index) {
    Map mulwashal = {
      'en_US': 'Melvashe',
      'fa_IR': ' ملواشه  ',
      'ar': ' ملواشه  '
    };
    return mulwashal[index];
  }

  static birthLabel(index) {
    Map mulwashal = {
      'en_US': ' Birth Month ',
      'fa_IR': '    ماه تولد ',
      'ar': 'شهر المیلاد '
    };
    return mulwashal[index];
  }

  static motherLabel(index) {
    Map mulwashal = {
      'en_US': " Mother's Melvashe ",
      'fa_IR': 'ملواشه مادر  ',
      'ar': '  ملواشة الام  '
    };
    return mulwashal[index];
  }

  static timeLabel(index) {
    Map mulwashal = {
      'en_US': ' Birth Time ',
      'fa_IR': '  ساعت تولد  ',
      'ar': 'الساعة المیلاد'
    };
    return mulwashal[index];
  }

  static mulwashalError(index) {
    Map mulwashal = {
      'en_US':
          "Error!!   Please select the Mother's Melvashe, Birth Month and Time",
      'fa_IR': '  خطا!!    لطفا ملواشه مادر، ماه و ساعت تولد را انتخاب کنید ',
      'ar': 'خطأ!!   يرجى تحديد ملواشة الام، الشهر و وساعة المیلاد'
    };
    return mulwashal[index];
  }

  static mulwashaFemale(index) {
    Map mulwashal = {'en_US': 'Female', 'fa_IR': 'مونث', 'ar': 'انثی'};
    return mulwashal[index];
  }

  static mulwashaMale(index) {
    Map mulwashal = {'en_US': 'Male', 'fa_IR': 'مذکر', 'ar': 'الذکر'};
    return mulwashal[index];
  }

  static boyGirl(index) {
    Map mulwashal = {
      'en_US': [
        '_Bar_',
        '_Path_',
        'Male Melvashe',
        'Female Melvashe',
        "Choose one:"
      ],
      'fa_IR': [
        ' بر ',
        ' پث',
        ' ملواشه مذکر',
        '  ملواشه مونث',
        ':یکی را انتخاب کن '
      ],
      'ar': [' بر ', ' پث', ' ملواشه الذکر', ' ملواشه انثی', ':اختر واحدة'],
    };
    return mulwashal[index];
  }

  static alertOk(index) {
    Map mulwashal = {'en_US': 'OK', 'fa_IR': 'تائید', 'ar': 'موافق'};
    return mulwashal[index];
  }

  static alertTtitle(index) {
    Map mulwashal = {
      'en_US': ' Error!!   Please correct the date ',
      'fa_IR': '  خطا!!    لطفا تاریخ را اصلاح نمائید ',
      'ar': ' خطأ!!   يرجى تصحيح التاريخ'
    };
    return mulwashal[index];
  }

  static selectOccasion(index) {
    Map data = {
      'en_US': ' And Select an occasion ',
      'fa_IR': ' و دوباره یک مناسبت انتخاب کنید  ',
      'ar': ' واختر مناسبة مرة أخرى  '
    };
    return data[index];
  }

  static alertConvertMsg(index) {
    String enMsg =
        "\n\nMonth formate MM between 1 to 12.\n\nDay formate DD between 1 to 31.";
    String faMsg =
        "\n\n ماه بین ۱ تا ۱۲ انتخاب کنید\n\n روز بین ۱ تا ۳۱ انتخاب کنید";
    String arMsg = "\n\n اختر الشهر بين ۱ و ۱۲ \n\n اختر اليوم بين ۱ و ۳۱";
    Map mulwashal = {
      'en_US': {
        'g': " Year format YYYY between 1921 to 2121. $enMsg ",
        's': " Year format YYYY between 1300 to 1500. $enMsg "
      },
      'fa_IR': {
        'g': " سال بین ۱۹۲۱  تا ۲۱۲۱ انتخاب کنید $faMsg ",
        's': " سال بین ۱۳۰۰ تا ۱۵۰۰ انتخاب کنید $faMsg "
      },
      'ar': {
        'g': " اختر السنة بين ۱۹۲۱ و ۲۱۲۱ $arMsg ",
        's': " اختر السنة بين ۱۳۰۰ و ۱۵۰۰ $arMsg "
      }
    };

    return mulwashal[index];
  }

  static dateLabel(index) {
    Map mulwashal = {
      'en_US': ['Year', 'Month', 'Day'],
      'fa_IR': ['سال', 'ماه', 'روز'],
      'ar': ['عام', 'شهر', 'يوم']
    };
    return mulwashal[index];
  }

  static chooseYear(index) {
    String dateF1 = " تاریخ" + "\n" + "شمسی";
    String dateF2 = " تاریخ" + "\n" + "میلادی";
    String dateA1 = " التاریخ" + "\n" + "شمسية";
    String dateA2 = " التاریخ" + "\n" + "الجورجية";

    Map mulwashal = {
      'en_US': ['Gregorian\nDate', 'Solar\nDate'],
      'fa_IR': [dateF2, dateF1],
      'ar': [dateA2, dateA1]
    };
    return mulwashal[index];
  }

  static convertDateLabel(index) {
    Map data = {
      'en_US': [' Mandaean Date: ', 'Gregorian Date: ', 'Solar Date: '],
      'fa_IR': ['تاریخ مندایی: ', 'تاریخ میلادی: ', ' تاریخ شمسی:'],
      'ar': ['تاریخ مندایی: ', 'تاریخ الجورجية:', 'تاریخ شمسية:']
    };
    return data[index];
  }

  static yearMaxMin(index) {
    Map mulwashal = {
      'en_US': [1920, 2120],
      'fa_IR': [1299, 1499],
      'ar': [1299, 1499]
    };
    return mulwashal[index];
  }

  static convertDate(index) {
    Map mulwashal = {
      'en_US': [
        'Convert to Mandaean Date',
        ' If you do not know your birth month in Mandaean  \n please convert your birth date here.'
      ],
      'fa_IR': [
        ' تبدیل به تاریخ مندایی',
        '  اگر ماه تولد خود را در مندایی نمی دانید\n لطفا تاریخ تولد خود را اینجا تبدیل کنید  '
      ],
      'ar': [
        ' تحويل إلى التاريخ مندائي   ',
        '  إذا كنت لا تعرف شهر ميلادك في المندائية  \n فيرجى تغيير تاريخ ميلادك هنا  '
      ]
    };
    return mulwashal[index];
  }

  static femaleMulwashaEn() {
    final List<String> mandaEnName = [
      // "----",
      'Hawa ',
      'Sharat',
      'Yasman',
      'Modl-lal',
      'Anhar',
      'Mahnash',
      'Simet',
      'Hawa Simet',
      'Sharat Simet',
      'Mamani',
      'Hawa Mamani',
      'Maliha',
      'Narges',
    ];
    return mandaEnName;
  }

  static femaleMulwashaFa() {
    final List<String> mandaEnName = [
      // "----",
      '  هوا                     ',
      '  شارت  ',
      '  یاسمن  ',
      '  مدلل  ',
      '  انهر  ',
      '  مهنش  ',
      '  سیمت  ',
      ' هوا سیمت ',
      '  شارت سیمت  ',
      '  مامانی  ',
      ' هوا مامانی ',
      '  ملیحه  ',
      '  نرگس  ',
    ];
    return mandaEnName;
  }

  static maleMulwashaEn() {
    final List<String> mandaEnName = [
      'Ram',
      'Yahana',
      'Zahron',
      'Yahya',
      'Bayan',
      'Sam',
      'Bahram',
      'Emhettem',
      'Emhettem Yahana',
      'Emhettem Zahrone',
      'Adam',
      'Adam Yahana',
      'Adam Zahrone',
    ];
    return mandaEnName;
  }

  static maleMulwashaFa() {
    final List<String> mandaEnName = [
      'رام',
      'یهانا',
      'زهرُن',
      'یحیی',
      'بیان',
      'سام',
      'بهرم',
      'امهتم',
      ' امهتم یهانا',
      'امهتم زهرُن',
      'آدم',
      'آدم یهانا',
      'آدم زهرُن',
    ];
    return mandaEnName;
  }

  static birthTimeEn() {
    final List<String> data = [
      // '----',
      '6:00',
      '8:00',
      '10:00',
      '12:00',
      '14:00',
      '16:00',
      '18:00',
      '20:00',
      '22:00',
      '24:00',
      '2:00',
      '4:00',
    ];
    return data;
  }

  static birthTimeFa() {
    final List<String> data = [
      // '----',
      '۶:۰۰',
      '۸:۰۰',
      '۱۰:۰۰',
      '۱۲:۰۰',
      '۱۴:۰۰',
      '۱۶:۰۰',
      '۱۸:۰۰',
      '۲۰:۰۰',
      '۲۲:۰۰',
      '۲۴:۰۰',
      '۲:۰۰',
      '۴:۰۰',
    ];
    return data;
  }

  static birthTimeSelectorEn() {
    final List data = [
      {
        'atAfter': [' at', ' after '],
        'before': ' before  '
      }
    ];
    return data;
  }

  static birthTimeSelectorFa() {
    final List data = [
      {
        'atAfter': ['راس ساعت   ', 'بعداز ساعت'],
        'before': '  قبل از ساعت  '
      }
    ];
    return data;
  }

  static birthTimeSelectorAr() {
    final List data = [
      {
        'atAfter': ['الساعة', 'بعد الساعة'],
        'before': '  قبل الساعة   '
      }
    ];
    return data;
  }

  static birthMonthNameFa() {
    final List<String> data = [
      // "----",
      '  امبرا ',
      '  تورا',
      '  صلمی',
      '  سرطانا',
      '  آریا',
      '  شمبلتا',
      '  پنجه روز اول',
      '  پنجه روز دوم',
      '  پنجه روز سوم',
      '  پنجه روز چهارم    ',
      '  پنجه روز پنجم',
      '  قینا',
      '  ارقوا',
      '  هطیا',
      '  گدیا',
      '  دولا',
      '  نونا',
    ];
    return data;
  }

  static birthMonthNameAr() {
    final List<String> data = [
      // "----",
      '  امبرا    ',
      '  تورا',
      '  صلمی',
      '  سرطانا',
      '  آریا',
      '  شمبلتا',
      '  پنجه اليوم الأول',
      '  پنجه اليوم الثاني',
      '  پنجه اليوم الثالث',
      '  پنجه اليوم الرابع',
      '  پنجه اليوم الخامس',
      '  قینا',
      '  ارقوا',
      '  هطیا',
      '  گدیا',
      '  دولا',
      '  نونا',
    ];
    return data;
  }

  static birthMonthNameEn() {
    final List<String> data = [
      // "----",
      'Embra',
      'Taura',
      'Ṣelmi',
      'Sartana',
      'Aria',
      'Shombolta',
      'Panja Day 1    ',
      'Panja Day 2',
      'Panja Day 3',
      'Panja Day 4',
      'Panja Day 5',
      'Qaina',
      'Arqawa',
      'Hatia',
      'Gadia',
      'Daula',
      'Nuna',
    ];
    return data;
  }

  static findBut(index) {
    Map mulwashal = {
      'en_US': '  Find Melvashe  ',
      'fa_IR': '   پیدا کردن ملواشه  ',
      'ar': '   اكتشف ملواشه   '
    };
    return mulwashal[index];
  }

  static Talea(index) {
    final List data = [
      [
        "----",
        'Sheep',
        'bull',
        'Scales',
        'Crab',
        'Lion',
        'Wheat',
        'Bamboo',
        'Scorpio',
        'Horse',
        'Goat',
        'Camel',
        'Fish',
        'Talea: '
      ],
      [
        "----",
        'گوسفند',
        'گاو نر',
        'ترازو',
        'خرچنگ',
        'شیر',
        'خوشه گندم',
        'نی',
        'عقرب',
        'اسب',
        'بز',
        'شتر',
        'ماهی',
        'طالع : '
      ],
      [
        "----",
        'خروف',
        'الثور',
        'میزان',
        'سلطعون',
        'أسد',
        'سنبله',
        'گصبه',
        'العقرب',
        'حصان',
        'ماعز',
        'جمل',
        'سمك',
        'طالع : '
      ]
    ];
    return data[index];
  }

  static menuDrop(index) {
    final List data = [
      [
        // "-",
        'Melvashe',
        'Religious Occasions',
        'Help',
      ],
      [
        // "-",
        '              ملواشه',
        'مناسبت های دینی',
        '                راهنما',
      ],
      [
        // "-",
        '        ملواشه',
        'مناسبات دینیه',
        '        مساعدة',
      ],
    ];
    return data[(index)];
  }

  static helpTitle(index) {
    Map mulwashal = {'en_US': 'Help', 'fa_IR': ' راهنما  ', 'ar': ' مساعدة  '};
    return mulwashal[index];
  }

  static myAlignment(index) {
    Map data = {
      'en_US': Alignment.centerLeft,
      'fa_IR': Alignment.centerRight,
      'ar': Alignment.centerRight
    };
    return data[index];
  }

  static scrollingText() {
    Map data = {
      "panja": {
        'en_US': "Panja (Parwanaiia) Feast",
        'fa_IR': 'پنجه (پروانایا)',
        'ar': 'البنجه (بروانایا)'
      },
      "dehvaRaba": {
        'en_US': "Dehva Raba feast",
        'fa_IR': 'دهوا ربا - عید بزرگ',
        'ar': 'دهوا ربا - عید الکبیر'
      },
      "shushian": {
        'en_US': "The Shushian feast",
        'fa_IR': 'عید شوشیان',
        'ar': 'عید شوشیان'
      },
      "next": {
        'en_US': "Next Month >>",
        'fa_IR': 'ماه آینده >>',
        'ar': 'الشهر القادم >>'
      },
    };
    return data;
  }

  static donotUseMelvash(index) {
    Map mulwashal = {
      'en_US':
          ' If you are not familiar with the concepts of  \nMelvashe, please do not use this section!',
      'fa_IR':
          '،اگر با مفاهیم ملواشه آشنا نمی باشید \n! لطفا از این قسمت استفاده نفرمایید',
      'ar':
          '،إذا لم تكن على دراية بمفاهيم الملوشة \n! فيرجى عدم استخدام هذا القسم '
    };
    return mulwashal[index];
  }

  static inLineHelpMother(index) {
    Map mulwashal = {
      'en_US': [
        "Mother's Melvashe",
        "- The Melvashe for the mother of the person you want to find." +
            "\n\n- At always has the word 'Path' which divides the Melvashe into two parts." +
            " Use the first part as such:" +
            "\n\n  * Select 'Hawa Simet' when the mother's Melvashe is 'Hawa Simet_Path_Yasmanou'." +
            "\n\n  * Select 'Mahnash' when the mother's Melvashe is 'Mahnash_Path_Anhar'."
      ],
      'fa_IR': [
        ' ملواشه مادر ',
        "ملواشه مادر شخصی که میخواهید برای او ملواشه پیدا کنید" +
            "\n\n" +
            "همیشه کلمه 'پث' وجود دارد که ملواشه را به دو قسمت تقسیم میکند. از قسمت اول استفاده کنید" +
            "\n" +
            " :برای مثال" +
            "\n\n" +
            "هوا سميت را انتخاب کنید وقتی ملواشه مادر ( هوا سميت پث یاسمن ) باشد" +
            "\n\n" +
            "مهنش راانتخاب کنید وقتی ملواشه مادر (مهنش پث انهر ) باشد"
      ],
      'ar': [
        '    ملواشة الام ',
        "ملواشة والدة الشخص الذي تريد البحث عن الملواشه له أو لها" +
            "\n\n" +
            "يحتوي دائمًا على كلمة 'پث' التي تقسم الملواشه إلى جزأين. استخدم الجزء الأول" +
            "\n" +
            " : فمثلا" +
            "\n\n" +
            " استخدم 'هوا سميت' عندما يكون ملواشة الام (هواسميت پث یاسمن)" +
            "\n\n" +
            " استخدم 'مهنش' عندما يكون ملواشة الام (مهنش پث انهر)"
      ]
    };
    return mulwashal[index];
  }

  static inLineHelpMonth(index) {
    Map mulwashal = {
      'en_US': [
        "Birth Month",
        "- The birth month in the Mandaean date of the person you want to find a Melvashe for." +
            "\n\n- Convert the birthday to Mandaean Date (Use the convertor in the app)." +
            " Then select Mandaean's month of birth month, for example:" +
            "\n\nSelect 'Taura' when the birth date is '2020/10/20'" +
            "\n\nSelect 'Aria' when the birth date is '1971/1/29'." +
            "\n\n- To use the app's date convertor, enter a date. For example 1971 for year, 1 for month, 29 for day." +
            "\n\nCheck Gregoraion Year for the birth date in Gregoraion." +
            "\n\nThen select the 'Convert to Mandaean Date button."
      ],
      'fa_IR': [
        ' ماه تولد ',
        "ماه تولد به مندایی شخصی که می خواهید ملواشه ی برای او پیدا کنید" +
            "\n\n" +
            "تاریخ تولد را به تاریخ مندایی تبدیل کنید (از مبدل تاریخ در برنامه استفاده کنید) " +
            "\n" +
            "ماه تولد به مندایی را انتخاب کنید"
                "\n" +
            " :برای مثال" +
            "\n\n" +
            "تورا را انتخاب کنید وقتی تاریخ تولد ( ۲۰ - ۱۰ - ۲۰۲۰ ) باشد" +
            "\n\n" +
            " آریا را انتخاب کنید وقتی تاریخ تولد ( ۲۹ - ۰۱ - ۱۹۷۱) باشد" +
            "\n\n برای استفاده از مبدل تاریخ برنامه ؛ تاریخ را وارد کنید. به عنوان مثال ، ۱۹۷۱ برای سال، ۱ برای ماه، ۲۹ برای روز" +
            "\n سال ميلادي را برای تاریخ تولد در ميلادي انتخاب کنید" +
            "\nسپس دکمه 'تبدیل به تاریخ مندایی' را انتخاب کنید"
      ],
      'ar': [
        ' شهر المیلاد ',
        "شهر الميلاد في المندایی للشخص الذي تريد أن تجد الملواشه له أو لها" +
            "\n\n" +
            "كونفر عيد الميلاد للتاريخ المندایی. (استخدم محول التاريخ في البرنامه)" +
            "\n" +
            " : فمثلا" +
            "\n\n" +
            " استخدم ' تورا' عندما للتاريخ المیلاد ( ۲۰ - ۱۰ - ۲۰۲۰ )" +
            "\n\n" +
            " استخدم 'آریا' عندما للتاريخ المیلاد ( ۲۹ - ۰۱ - ۱۹۷۱)" +
            "\n\n لاستخدام محول التاريخ في التطبيق ، أدخل التاريخ. على سبيل المثال ، ۱۹۷۱ للسنة ، ۱ للشهر ، ۲۹ لليوم" +
            "\n حدد السنة ميلادية لتاريخ الميلاد في ميلادي" +
            "\n ' ثم حدد الزر 'تحويل إلى التاريخ مندائي"
      ]
    };
    return mulwashal[index];
  }

  static inLineHelpTime(index) {
    Map mulwashal = {
      'en_US': [
        "Birth Time ",
        "- The birth time of the person you want to find a Melvashe for." +
            "\n\n- Select 'at' when the time of birth is on the hour mark on even hours only, for example at 6:00, 8:00, 10:00, 22:00." +
            "\n\n - Otherwise, select 'after', which gives you a two-hour return." +
            " For example:" +
            "\n\n  * If the birth time is after 6:00 but before 8:00 such as 6:01, 7:00, 7:59," +
            " then select after 6:00, the app will display before 8:00" +
            "\n\n  * If the birth time is after 8:00 but before 10:00 such as 8:01, 9:30, 9:59," +
            " then select after 8:00, the app will display before 10:00"
      ],
      'fa_IR': [
        ' ساعت تولد ',
        "زمان تولد شخصی که می خواهید ملواشه ی برای او پیدا کنید" +
            "\n\n" +
            " راس ساعت را انتخاب کنید وقتی زمان تولد راس ساعتهای زوج باشد مانند ۶:۰۰ یا ۸:۰۰ یا  ۱۰:۰۰ یا ۲۲:۰۰" +
            "\n\n" +
            "در غیر این صورت ، 'بعدازساعت' را انتخاب کنید که به شما بازده زمانی دو ساعت می دهد" +
            "\n" +
            " :برای مثال" +
            "\n\n اگر زمان تولد بعد از ساعت ۶:۰۰ اما قبل از ساعت ۸:۰۰ مانند ۶:۰۱ ، ۷:۰۰ ، ۷:۵۹ باشد" +
            "\n بعد از ساعت ۶:۰۰ را انتخاب کنید، برنامه قبل از ساعت ۸:۰۰ را نمایش خواهد داد" +
            "\n\n اگر زمان تولد بعد از ساعت ۸:۰۰ اما قبل از ساعت ۱۰:۰۰ مانند ۸:۰۱ ، ۹:۳۰ ، ۹:۵۹ باشد" +
            "\n بعد از ساعت ۸:۰۰ را انتخاب کنید، برنامه قبل از ساعت ۱۰:۰۰ را نمایش خواهد داد"
      ],
      'ar': [
        ' الساعة المیلاد ',
        "الساعة الميلاد للشخص الذي تريد أن تجد الملواشه له أو لها" +
            "\n\n" +
            " حدد 'الساعة' عندما يكون وقت الولادة هو الجزء العلوي من زوج الساعات،\n مثل ۶:۰۰ أو ۸:۰۰ أو ۱۰:۰۰ أو ۲۲:۰۰" +
            "\n\n" +
            "خلاف ذلك ، حدد'بعد الساعة' ، والذي يمنحك وقت العودة لمدة ساعتين" +
            "\n" +
            " : فمثلا" +
            "\n\n إذا كان وقت الميلاد بعد الساعة ۶:۰۰ ولكن قبل الساعة ۸:۰۰ مثل ۶:۰۱ و ۷:۰۰ و ۷:۵۹" +
            "\n حدد بعد الساعة ۶:۰۰ ، سيعرض البرنامج قبل الساعة ۸:۰۰" +
            "\n\n إذا كان وقت الميلاد بعد الساعة ۸:۰۰ ولكن قبل الساعة ۱۰:۰۰ مثل ۸:۰۱ و ۹:۳۰ و ۹:۵۹" +
            "\n حدد بعد الساعة ۸:۰۰ ، سيعرض البرنامج قبل الساعة ۱۰:۰۰"
      ]
    };
    return mulwashal[index];
  }
}
