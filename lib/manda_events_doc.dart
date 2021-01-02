import 'manda_equivalent.dart';

class MandaEventsDoc {
  // String _malwasha = "Melvashe";

  static findEevent(index, localLang) {
    print(index);
    String minor = MandaEqu.mandaLightMbattal()[0]["en_US"].trim();
    String major = MandaEqu.mandaHeavyMbattal()[0]["en_US"].trim();
    String banja1 = MandaEqu.mandaFeast()['banja'][0]["en_US"].trim();
    String banja2 = MandaEqu.mandaFeast()['banja'][1]["en_US"].trim();
    String banja3 = MandaEqu.mandaFeast()['banja'][2]["en_US"].trim();
    String banja4 = MandaEqu.mandaFeast()['banja'][3]["en_US"].trim();
    String banja5 = MandaEqu.mandaFeast()['banja'][4]["en_US"].trim();
    String yahya = MandaEqu.mandaFeast()['yahya']["en_US"].trim();
    String kenshi = MandaEqu.mandaFeast()['kenshi']["en_US"].trim();
    String eidBig = MandaEqu.mandaFeast()['eidBig']["en_US"].trim();
    String kersa = MandaEqu.mandaFeast()['kersa']["en_US"].trim();
    String shoshian1 = MandaEqu.mandaFeast()['shoshian'][0]["en_US"].trim();
    String shoshian2 = MandaEqu.mandaFeast()['shoshian'][1]["en_US"].trim();
    String alfil = MandaEqu.mandaFeast()['alfil']["en_US"].trim();
    String eidSmall = MandaEqu.mandaFeast()['eidSmall']["en_US"].trim();
    String ashoreh = MandaEqu.mandaFeast()['ashoreh']["en_US"].trim();
    Map doc;
    if (localLang == "fa_IR") {
      doc = {
        minor: minorFa(),
        major: majorFa(),
        banja1: banjaFa(),
        banja2: banjaFa(),
        banja3: banjaFa(),
        banja4: banjaFa(),
        banja5: banjaFa(),
        yahya: yahyaFa(),
        kenshi: kenshiFa(),
        eidBig: eidBigFa(),
        kersa: kersaFa(),
        shoshian1: shoshianFa(),
        shoshian2: shoshianFa(),
        alfil: alfilFa(),
        eidSmall: eidSmallFa(),
        ashoreh: ashorehFa(),
      };
      print(doc[index]);
    } else if (localLang == "ar") {
      doc = {
        minor: minorAr(),
        major: majorAr(),
        banja1: banjaAr(),
        banja2: banjaAr(),
        banja3: banjaAr(),
        banja4: banjaAr(),
        banja5: banjaAr(),
        yahya: yahyaAr(),
        kenshi: kenshiAr(),
        eidBig: eidBigAr(),
        kersa: kersaAr(),
        shoshian1: shoshianAr(),
        shoshian2: shoshianAr(),
        alfil: alfilAr(),
        eidSmall: eidSmallAr(),
        ashoreh: ashorehAr(),
      };
      print(doc[index]);
    } else {
      doc = {
        minor: minorEn(),
        major: majorEn(),
        banja1: banjaEn(),
        banja2: banjaEn(),
        banja3: banjaEn(),
        banja4: banjaEn(),
        banja5: banjaEn(),
        yahya: yahyaEn(),
        kenshi: kenshiEn(),
        eidBig: eidBigEn(),
        kersa: kersaEn(),
        shoshian1: shoshianEn(),
        shoshian2: shoshianEn(),
        alfil: alfilEn(),
        eidSmall: eidSmallEn(),
        ashoreh: ashorehEn(),
      };
      print(doc[index]);
    }
    return doc[index];
  }

  // static eventsFa(index) {
  //   print(index);
  //   String minor = MandaEqu.mandaLightMbattal()[0]["en_US"].trim();
  //   String major = MandaEqu.mandaHeavyMbattal()[0]["en_US"].trim();
  //   String banja1 = MandaEqu.mandaFeast()['banja'][0]["en_US"].trim();
  //   String banja2 = MandaEqu.mandaFeast()['banja'][1]["en_US"].trim();
  //   String banja3 = MandaEqu.mandaFeast()['banja'][2]["en_US"].trim();
  //   String banja4 = MandaEqu.mandaFeast()['banja'][3]["en_US"].trim();
  //   String banja5 = MandaEqu.mandaFeast()['banja'][4]["en_US"].trim();
  //   String yahya = MandaEqu.mandaFeast()['yahya']["en_US"].trim();
  //   String kenshi = MandaEqu.mandaFeast()['kenshi']["en_US"].trim();
  //   String eidBig = MandaEqu.mandaFeast()['eidBig']["en_US"].trim();
  //   String kersa = MandaEqu.mandaFeast()['kersa']["en_US"].trim();
  //   String shoshian1 = MandaEqu.mandaFeast()['shoshian'][0]["en_US"].trim();
  //   String shoshian2 = MandaEqu.mandaFeast()['shoshian'][1]["en_US"].trim();
  //   String alfil = MandaEqu.mandaFeast()['alfil']["en_US"].trim();
  //   String eidSmall = MandaEqu.mandaFeast()['eidSmall']["en_US"].trim();
  //   String ashoreh = MandaEqu.mandaFeast()['ashoreh']["en_US"].trim();

  //   Map doc = {
  //     minor: minorFa(),
  //     major: majorFa(),
  //     banja1: banjaFa(),
  //     banja2: banjaFa(),
  //     banja3: banjaFa(),
  //     banja4: banjaFa(),
  //     banja5: banjaFa(),
  //     yahya: yahyaFa(),
  //     kenshi: kenshiFa(),
  //     eidBig: eidBigFa(),
  //     kersa: kersaFa(),
  //     shoshian1: shoshianFa(),
  //     shoshian2: shoshianFa(),
  //     alfil: alfilFa(),
  //     eidSmall: eidSmallFa(),
  //     ashoreh: ashorehFa(),
  //   };
  //   print(doc[index]);
  //   return doc[index];
  // }

  // static mandaEventsDoc(index) {
  //   print(index);
  //   String minor = MandaEqu.mandaLightMbattal()[0]["en_US"].trim();
  //   String major = MandaEqu.mandaHeavyMbattal()[0]["en_US"].trim();
  //   String banja1 = MandaEqu.mandaFeast()['banja'][0]["en_US"].trim();
  //   String banja2 = MandaEqu.mandaFeast()['banja'][1]["en_US"].trim();
  //   String banja3 = MandaEqu.mandaFeast()['banja'][2]["en_US"].trim();
  //   String banja4 = MandaEqu.mandaFeast()['banja'][3]["en_US"].trim();
  //   String banja5 = MandaEqu.mandaFeast()['banja'][4]["en_US"].trim();
  //   String yahya = MandaEqu.mandaFeast()['yahya']["en_US"].trim();
  //   String kenshi = MandaEqu.mandaFeast()['kenshi']["en_US"].trim();
  //   String eidBig = MandaEqu.mandaFeast()['eidBig']["en_US"].trim();
  //   String kersa = MandaEqu.mandaFeast()['kersa']["en_US"].trim();
  //   String shoshian1 = MandaEqu.mandaFeast()['shoshian'][0]["en_US"].trim();
  //   String shoshian2 = MandaEqu.mandaFeast()['shoshian'][1]["en_US"].trim();
  //   String alfil = MandaEqu.mandaFeast()['alfil']["en_US"].trim();
  //   String eidSmall = MandaEqu.mandaFeast()['eidSmall']["en_US"].trim();
  //   String ashoreh = MandaEqu.mandaFeast()['ashoreh']["en_US"].trim();

  //   if (index == minor) {
  //     minorFa();
  //   }

  //   //  const minor = "test";
  //   // switch (index) {
  //   //   case minor:
  //   //     // do something
  //   //     break;
  //   //   case myPI:
  //   //     // do something else
  //   //     break;
  //   // }
  //   // ;
  // }

  static minorFa() {
    // امبطلات سبک
    String text = """
      
      ${MandaEqu.mandaLightMbattal()[0]["fa_IR"].trim()} *****

      کلیه مراسم دینی انجام نمی شوند اعم از تعمید، عقد و ازدواج و ذبح

      ذبح حیوانات مجاز نمی باشد

      انجام مراسم دخرانی برای متوفیانی که ۴۵ روز از وفات آنها گذشته باشد، مجاز نمی باشد

      اجازه خوردن گوشت ( به شرطی که قبلا ذبح شده و با امبطل سنگین نازل نشده)، ماهى و تخم مرغ و تخم پرندگان را داريم

      انجام دادن لوفانی دخرانی برای ۴۵ روز اول وفات(از روز اول دفن کردن به مدت ۴۵ روز) مجاز می باشد
      با این شرطی که از ماهی و یا تخم پرندگان (تخم مرغ کلا در دخرانی مجاز نمباشد) استفاده کرد
      استفاده از گوشت به شرطی مجاز است که قبلا ذبح شده و با امبطل سنگین نازل نشده

      ‌بستن همیانه مجاز می باشد

      مراسم رشامه و براخه انجام می شود

      مراسم تدفین مجاز میباشد ولی بعدا میبایست برای میت قماشی و مسقتا درست کرد
      اگر شخصی در این روز فوت کند میبایست برای میت قماشی و مسقتا درست کرد
      اگر شخصی در زمان فوت لباس مشکی در تن داشت، قماشی در اولین بنجه یکسال بعد از زمان فوت قابل انجام است 
      اگر شخصی در زمان فوت لباس مشکی در تن نداشت، قماشی در اولین بنجه ۴۵ روز بعداز زمان فوت قابل انجام است

    """;

    return text;
  }

  static minorAr() {
    String text = """
      ${MandaEqu.mandaLightMbattal()[0]["ar"].trim()}

      لا يتم تنفيذ جميع الاحتفالات الدينية ، بما في ذلك المعمودية والزواج والذبح

      ولا يجوز ذبح الحيوانات

      لا يُسمح دخرانی للمتوفى الذي مضى ٤٥ يومًا على وفاته

      يسمح لنا بتناول اللحوم (بشرط أن تكون قد ذبحت بالفعل ولم تمر
      بحلول يوم مبطل ثقیل ) والأسماك والبيض و كل بيض الطيور

      يجوز إجراء الدخراني لأول ٤٥ يومًا من الوفاة (لمدة ٤٥ يومًا من أول يوم للدفن)
      بشرط أن تكون الستعمل الأسماك أو بيض الطيور (لا يسمح بتواجد بيض الدجاج في الدخراني إطلاقا)
      يسمح باستخدام اللحوم بشرط أن تكون قد ذبحت بالفعل ولم تمر بحلول يوم مبطل ثقیل

      يسمح بربط الهمیانه

      يتم تنفيذ مراسم الرشامه و البراخه

      يُسمح بخدمات الجنازة ، يجب القماشی و المسقتا للجثة 
      إذا مات شخص في هذا اليوم ، يجب القماشی و المسقتا للجثة
      إذا كان الشخص يرتدي اللون الأسود وقت الوفاة ، فيمكن عمل القماشی في أول البنجه بعد عام واحد من وقت الوفاة
      إذا لم يكن الشخص يرتدي اللون الأسود وقت الوفاة ، فيمكن عمل القماشی في أول البنجه ٤٥ يومًا بعد وقت الوفاة

     """;

    return text;
  }

  static minorEn() {
    String text = """
      ${MandaEqu.mandaLightMbattal()[0]["en_US"].trim()}

All religious ceremonies are Not performed, including baptism, marriage, and slaughter

Slaughter of animals is not allowed

Dokhranie are not allowed for the deceased who have passed 45 days after their death

We are allowed to eat meat (provided it has already been slaughtered and not passed
by a Major Mbattal day), fish, eggs, and "all bird eggs".

It is permissible to perform a Dokhranie for the first 45 days of death (for 45 days from the first day of burial)
Provided that the fish or bird eggs are to be used (chicken eggs are not allowed in Dukhrani at all)
Meat is permitted as long as it has already been slaughtered and has not passed by a Major Mbattal day

Fastening of the Hmyana is allowed

The prayer ceremony (Rashameh and Borakheh) is performed

Funeral services are allowed, Ghomashe and Maseghta must be made for the dead later
If a person dies on this day, Ghomashe and Maseghta must be made for the dead body
If a person was wearing black at the time of death, the Ghomashe can be done in the first Panja one year after the time of death
If a person was not wearing black at the time of death, the Ghomashe can be done in the first Panja 45 days after the time of death.


     """;

    return text;
  }

  static majorFa() {
    String text = """
      امبطلات سنگین

کلیه مراسم دینی انجام نمی شوند اعم از تعمید، عقد و ازدواج و ذبح

ذبح حیوانات مجاز نمی باشد

انجام مراسم دخرانی برای متوفیانی که ۴۵ روز از وفات آنها گذشته باشد، مجاز نمی باشد

‌بستن همیانه مجاز نمی باشد

 اجازه خوردن گوشت، ماهى و تخم مرغ و تخم پرندگان و تمام خوراكى هايى كه در تهیه آنها از اين مواد استفاده شده را نداريم

 انجام دادن لوفانی دخرانی برای ۴۵ روز اول وفات(از روز اول دفن کردن به مدت ۴۵ روز) در امبطلات سنگین مجاز می باشد
با این شرطی که همیانه بسته می شود و از گوشت ،ماهی و یا تخم پرندگان (تخم مرغ کلا در دخرانی مجاز نمی باشد) استفاده نکرد

 مراسم براخه فقط در امبطلات سنگین انجام نمی شود و به دعای مختصر پسند خواهد شد


مراسم تدفین مجاز میباشد ولی بعدا میبایست برای میت قماشی و مسقتا درست کرد
اگر شخصی در این روز فوت کند میبایست برای میت قماشی و مسقتا درست کرد
اگر شخصی در زمان فوت لباس مشکی در تن داشت، قماشی در اولین بنجه یکسال بعد از زمان فوت قابل انجام است 
اگر شخصی در زمان فوت لباس مشکی در تن نداشت، قماشی در اولین بنجه ۴۵ روز بعداز زمان فوت قابل انجام است    


""";

    return text;
  }

  static majorAr() {
    String text = """
      ${MandaEqu.mandaHeavyMbattal()[0]["ar"].trim()}

      لا يتم تنفيذ جميع الاحتفالات الدينية ، بما في ذلك المعمودية والزواج والذبح

      ولا يجوز ذبح الحيوانات

      لا يُسمح دخرانی للمتوفى الذي مضى ٤٥ يومًا على وفاته

      ولا يجوز لنا بتناول اللحوم والأسماك والبيض و كل بيض الطيور

      يجوز إجراء الدخراني لأول ٤٥ يومًا من الوفاة (لمدة ٤٥ يومًا من أول يوم للدفن)
      بشرط أن تكون الستعمل الأسماك أو بيض الطيور (لا يسمح بتواجد بيض الدجاج في الدخراني إطلاقا)
      يسمح باستخدام اللحوم بشرط أن تكون قد ذبحت بالفعل ولم تمر بحلول يوم مبطل ثقیل

      ولا يجوز بربط الهمیانه

      يتم تنفيذ مراسم الرشامه و البراخه

      يُسمح بخدمات الجنازة ، يجب القماشی و المسقتا للجثة 
      إذا مات شخص في هذا اليوم ، يجب القماشی و المسقتا للجثة
      إذا كان الشخص يرتدي اللون الأسود وقت الوفاة ، فيمكن عمل القماشی في أول البنجه بعد عام واحد من وقت الوفاة
      إذا لم يكن الشخص يرتدي اللون الأسود وقت الوفاة ، فيمكن عمل القماشی في أول البنجه ٤٥ يومًا بعد وقت الوفاة

     """;

    return text;
  }

  static majorEn() {
    String text = """
      ${MandaEqu.mandaHeavyMbattal()[0]["en_US"].trim()}

All religious ceremonies are Not performed, including baptism, marriage, and slaughter

Slaughter of animals is not allowed

Dokhranie are not allowed for the deceased who have passed 45 days after their death

We are NOT allowed to eat meat, fish, eggs, bird eggs, and all foods that have been prepared using these ingredients

It is permissible to perform a Dokhranie for the first 45 days of death (for 45 days from the first day of burial)
Provided that the fish or bird eggs are to be used (chicken eggs are not allowed in Dukhrani at all)
Meat is permitted as long as it has already been slaughtered and has not passed by a Major Mbattal day

Fastening of the Hmyana is NOT allowed

The prayer ceremony (Rashameh and Borakheh) is performed

Funeral services are allowed, Ghomashe and Maseghta must be made for the dead later
If a person dies on this day, Ghomashe and Maseghta must be made for the dead body
If a person was wearing black at the time of death, the Ghomashe can be done in the first Panja one year after the time of death
If a person was not wearing black at the time of death, the Ghomashe can be done in the first Panja 45 days after the time of death.

     """;

    return text;
  }

  static banjaFa() {
    String text = """
    پنجه (پروانایا)

قداست روز و شب آن یکسان میباشد

علاوه بر روزه دهان بر روزه زبان، چشم، دست و پا تاکید شده است

برای سه وعده نماز روز فقط بوثه های نماز صبح خوانده میشود

ذبح حلال حتی در شب مجاز میباشد

از خوردن گوشت نازل در این ایام جددا خودداری شود

خوردن غذا نظیف بسیار تاکید شده است

تعمید بسیار تاکید شده است

بدلیل قداست این ایام همبستری و یا تشکیل نطفه مجاز نمی باشد

    """;

    return text;
  }

  static banjaAr() {
    String text = """
    پنجه (پروانایا)

    """;

    return text;
  }

  static banjaEn() {
    String text = """
    پنجه (پروانایا)

    """;

    return text;
  }

  static yahyaFa() {
    String text = """
    ${MandaEqu.mandaFeast()['yahya']["fa_IR"].trim()}
      دهوا اد دیما - میلاد حضرت یحیی

      بر‌ تعمید نوزادان تاکید شده است

      از خوردن گوشت نازل در این ایام جددا خودداری شود
    """;

    return text;
  }

  static yahyaAr() {
    String text = """
    ${MandaEqu.mandaFeast()['yahya']["ar"].trim()}
      دهوا اد دیما - میلاد حضرت یحیی

    """;

    return text;
  }

  static yahyaEn() {
    String text = """
    ${MandaEqu.mandaFeast()['yahya']["en_US"].trim()}
      دهوا اد دیما - میلاد حضرت یحیی

    """;

    return text;
  }

  static kenshiFa() {
    String text = """
    ${MandaEqu.mandaFeast()['kenshi']["fa_IR"].trim()}
      کنشو زهلی
      روز آخر سال

    بر پاکسازی خانه تاکید شده است

    بر تعمید و یا غسل (طماشه) قبل از اعتکاف  تاکید شده است

    تاکید به کمک و بازید از افراد کم بضاعت شده است

    اعتکاف بمدت دو شب و یک روز که سی و شش ساعت از عصر همین روز شروع می شود

    تاکید بر محافظت از جسم

    تاکید بر عدم دست زدن به یردنا شده است‌

    تاکید بر عدم دست زدن به گیاهان و حیوانات شده است‌

    اگر در مدت ۳۶ ساعت اعتکاف، خون از بدن خارج شود و یا به حیوانات و گیاهان تماس داشته باشید
    میبایست خود را از بقیه خانواده جدا کرده و هیچگونه تماسی با بقیه افراد نداشته باشید
    لذا توصیه شده از منزل خارج نشوید و آذوقه و آب برای مدت ۳۶ ساعت تهیه نمایید

    اشخاصی که در مدت ۳۶ ساعت نازل می شوند میبایست با رسته نو در روز کنشوزهلی تعمید شوند
    مگر آنکه روزه کامل بگیرند و بعد از اعتکاف غسل (طماشه) نمایند

    دعا و نیایش و تفکر در خصوص سالی که گذشت تاکید شده است

    بر غسل (طماشه) بعد از اعتکاف  تاکید شده است

    """;

    return text;
  }

  static kenshiAr() {
    String text = """
    ${MandaEqu.mandaFeast()['kenshi']["fa_IR"].trim()}
      کنشو زهلی

    """;

    return text;
  }

  static kenshiEn() {
    String text = """
    ${MandaEqu.mandaFeast()['kenshi']["fa_IR"].trim()}
      کنشو زهلی

    """;

    return text;
  }

  static eidBigFa() {
    String text = """
    ${MandaEqu.mandaFeast()['eidBig']["fa_IR"].trim()}
      دهوا ربا - عید بزرگ

     اولین روز سال

     (ادامه اعتکاف - تمام روز (کلا بمدت دو شب و یک روز که سی و شش ساعت است‌ 

    تاکید بر محافظت از جسم

    تاکید بر عدم دست زدن به یردنا شده است‌

    تاکید بر عدم دست زدن به گیاهان و حیوانات شده است‌

    اگر در مدت ۳۶ ساعت اعتکاف، خون از بدن خارج شود و یا به حیوانات و گیاهان تماس داشته باشید
    میبایست خود را از بقیه خانواده جدا کرده و هیچگونه تماسی با بقیه افراد نداشته باشید.
    لذا توصیه شده از منزل خارج نشوید و آذوقه و آب برای مدت ۳۶ ساعت تهیه نمایید

    اشخاصی که در مدت ۳۶ ساعت نازل می شوند میبایست با رسته نو در روز کنشوزهلی تعمید شوند
    مگر آنکه روزه کامل بگیرند و بعد از اعتکاف غسل (طماشه) نمایند

    دعا و نیایش و تفکر در خصوص سالی که گذشت تاکید شده است

    بر غسل (طماشه) بعد از اعتکاف  تاکید شده است
    """;

    return text;
  }

  static eidBigAr() {
    String text = """
    ${MandaEqu.mandaFeast()['eidBig']["fa_IR"].trim()}
      دهوا ربا - عید بزرگ

    """;

    return text;
  }

  static eidBigEn() {
    String text = """
    ${MandaEqu.mandaFeast()['eidBig']["fa_IR"].trim()}
      دهوا ربا - عید بزرگ

    """;

    return text;
  }

  static kersaFa() {
    String text = """
    ${MandaEqu.mandaFeast()['kersa']["fa_IR"].trim()}
    دهوا ربا - پایان کراصا

    پایان اعتکاف

    بر غسل (طماشه) بعد از اعتکاف  تاکید شده است

    تاکید به کمک و بازید از افراد کم بضاعت شده است

    تاکید به دید و بازید شده است

    """;

    return text;
  }

  static kersaAr() {
    String text = """
    ${MandaEqu.mandaFeast()['kersa']["fa_IR"].trim()}
      دهوا ربا - پایان کراصا

    """;

    return text;
  }

  static kersaEn() {
    String text = """
    ${MandaEqu.mandaFeast()['kersa']["fa_IR"].trim()}
      دهوا ربا - پایان کراصا

    """;

    return text;
  }

  static shoshianFa() {
    String text = """
      ${MandaEqu.mandaFeast()['shoshian'][0]["fa_IR"].trim()}

    """;

    return text;
  }

  static shoshianAr() {
    String text = """
      ${MandaEqu.mandaFeast()['shoshian'][0]["fa_IR"].trim()}

    """;

    return text;
  }

  static shoshianEn() {
    String text = """
      ${MandaEqu.mandaFeast()['shoshian'][0]["fa_IR"].trim()}

    """;

    return text;
  }

  static alfilFa() {
    String text = """
      ${MandaEqu.mandaFeast()['alfil']["fa_IR"].trim()}
      مصادف با روز اول ماه تورا

      غذای مخصوصی  بنام” فل “ آماده می‌کنیم که ازمخلوط کردن خرما با کُنجد که بصورت حلوای کروی شکل آنرا میسازند

      مهیا کردن زمین برای زندگی بشریت و مهار اشرار از این روز آغاز گردید

    """;

    return text;
  }

  static alfilAr() {
    String text = """
      ${MandaEqu.mandaFeast()['alfil']["fa_IR"].trim()}

    """;

    return text;
  }

  static alfilEn() {
    String text = """
      ${MandaEqu.mandaFeast()['alfil']["fa_IR"].trim()}

    """;

    return text;
  }

  static eidSmallFa() {
    String text = """
      ${MandaEqu.mandaFeast()['eidSmall']["fa_IR"].trim()}

    """;

    return text;
  }

  static eidSmallAr() {
    String text = """
      ${MandaEqu.mandaFeast()['eidSmall']["fa_IR"].trim()}

    """;

    return text;
  }

  static eidSmallEn() {
    String text = """
      ${MandaEqu.mandaFeast()['eidSmall']["fa_IR"].trim()}

    """;

    return text;
  }

  static ashorehFa() {
    String text = """
      ${MandaEqu.mandaFeast()['ashoreh']["fa_IR"].trim()}
      يك مناسبت تاريخى دینی  براى يادبود طوفان نوح است
    مندائیان واقعه کشتی نوح، بخاطر ادامهٔ  تعاليم دینی و حفظ مراسم نیاکان خود،
    برای روانهايى كه در طوفان غرق شدند، طلب آمرزش نمودند
    و از حبوباتى كه در كشتى بود، غذا پختند و مراسم لوفانى انجام دادند 

    """;

    return text;
  }

  static ashorehAr() {
    String text = """
      ${MandaEqu.mandaFeast()['ashoreh']["fa_IR"].trim()}

    """;

    return text;
  }

  static ashorehEn() {
    String text = """
      ${MandaEqu.mandaFeast()['ashoreh']["fa_IR"].trim()}

    """;

    return text;
  }
}
