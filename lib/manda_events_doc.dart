import 'manda_equivalent.dart';

class MandaEventsDoc {
  // String _malwasha = "Melvashe";

  static findEevent(index, localLang) {
    // print(index);
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
      // print(doc[index]);
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
      // print(doc[index]);
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
      // print(doc[index]);
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
      
    ${MandaEqu.mandaLightMbattal()[0]["fa_IR"].trim()}

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

    All religious ceremonies are not performed, including baptism, marriage, and slaughtering of animals

    Slaughtering of animals is not allowed

    Dokhranie is not allowed for those who have been deceased for more than 45 days

    We are allowed to eat meat (provided it has already been slaughtered and not passed
    by a Major Mbattal day), fish, eggs, and all bird eggs.

    It is permissible to perform a Dokhranie if within the first 45 days of death (45 days from the first day of burial)
    Provided that the fish or bird eggs are to be used (chicken eggs are not allowed in Dukhrani at all)
    Meat is permitted as long as it has already been slaughtered and has not passed a Major Mbattal day

    Fastening of the Hmyana is allowed

    The prayer ceremony (Rashameh and Borakheh) is performed

    Funeral services are allowed, Ghomashe and Maseghta must be made for the dead at a later time
    If a person dies on this day, Ghomashe and Maseghta must be made for the dead body
    If a person was wearing black at the time of death, the Ghomashe can be done in the first Panja, one year after the time of death
    If a person was not wearing black at the time of death, the Ghomashe can be done in the first Panja 45 days after the time of death
     """;

    return text;
  }

  static majorFa() {
    //  *****   امبطلات سنگین *****
    String text = """
  
    ${MandaEqu.mandaHeavyMbattal()[0]["fa_IR"].trim()}

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

    All religious ceremonies are Not performed, including baptism, marriage, and slaughtering of animals

    Slaughtering of animals is not allowed

    Dokhranie is not allowed for those who have been deceased for more than 45 days

    We are NOT allowed to eat meat, fish, eggs, bird eggs, and all foods that have been prepared using these ingredients

    It is permissible to perform a Dokhranie within the first 45 days of death (for 45 days from the first day of burial)
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

    پروانایا (پنجه)

    قداست روز و شب آن یکسان میباشد

    علاوه بر روزه دهان بر روزه زبان، چشم، دست و پا تاکید شده است

    برای سه وعده نماز روز فقط بوثه های نماز صبح خوانده میشود

    ذبح حلال حتی در شب مجاز میباشد

    از خوردن گوشت نازل(گوشتی که مطابق ایین مندایی ذبح نشده باشد) در این ایام جددا خودداری شود

    خوردن غذا نظیف بسیار تاکید شده است

    تعمید بسیار تاکید شده است

    بدلیل قداست این ایام همبستری و یا یا بارداری مجاز نمی باشد
    """;

    return text;
  }

  static banjaAr() {
    String text = """

    بروانایا (البنجه)

    حرمة النهار والليل واحدة

    بالإضافة إلى صيام الفم ، يتم التركيز على اللسان والعينين واليدين والقدمين

    بالنسبة للصلوات الثلاث اليومية ، يتم تقديم صلاة الفجر فقط

    الذبح جائز حتى في الليل

    تجنب تناول اللحوم نازل(اللحوم التي لم تذبح على الطريقة المندائية) فيها هذه الأيام

    يتم التأكيد بشدة على تناول الطعام النظيف

    تم التأكيد بشدة على الصباغه

    وحرمة هذه الأيام يمنع الجماع أو الحمل
    """;

    return text;
  }

  static banjaEn() {
    String text = """

    Parwanaiia (Panja) 

    The sanctity of day and night is the same

    In addition to oral fasting, the tongue, eyes, hands, and feet are emphasized

    For the three daily prayers, only the morning prayer is offered

    Slaughter is permissible even at night

    Avoid eating meat that was not slaughtered in the Mandaean way during these days

    Eating food that is prepared in the Mandaean way (Nazif) is highly emphasized

    Baptism is highly emphasized

    Due to the sanctity of these days, intercourse or pregnancy is not allowed
    """;

    return text;
  }

  static yahyaFa() {
    String text = """

    ${MandaEqu.mandaFeast()['yahya']["fa_IR"].trim()}

    بر‌ تعمید نوزادان تاکید شده است

    از خوردن گوشت نازل(گوشتی که مطابق ایین مندایی ذبح نشده باشد) در این ایام جددا خودداری شود

    خوردن غذا نظیف بسیار تاکید شده است
    """;

    return text;
  }

  static yahyaAr() {
    String text = """

    ${MandaEqu.mandaFeast()['yahya']["ar"].trim()}

    يتم التركيز على الصباغه الأطفال

    تجنب تناول اللحوم نازل(اللحوم التي لم تذبح على الطريقة المندائية) فيها هذه الأيام

    يتم التأكيد بشدة على تناول الطعام النظيف
    """;

    return text;
  }

  static yahyaEn() {
    String text = """

    ${MandaEqu.mandaFeast()['yahya']["en_US"].trim()}

    Emphasis is placed on infant baptism

    Avoid eating meat that was not slaughtered in the Mandaean way during  these days

    Eating food that is prepared in the Mandaean way (Nazif) is highly emphasized
    """;

    return text;
  }

  static kenshiFa() {
    String text = """

    ${MandaEqu.mandaFeast()['kenshi']["fa_IR"].trim()}

    روز آخر سال

    بر پاکسازی خانه تاکید شده است

    تاکید به کمک و بازید از افراد کم بضاعت شده است

    كراصا (ماندن در خانه) بمدت دو شب و یک روز (سی و شش ساعت) از عصر این روز شروع می شود

    بر تعمید و یا غسل (طماشه) قبل از كراصا تاکید شده است

    تاکید بر محافظت از جسم

    تاکید بر عدم دست زدن به یردنا(رودخانه) شده است‌

    تاکید بر عدم دست زدن به گیاهان و حیوانات شده است‌

    اگر در مدت ۳۶ ساعت كراصا، خون از بدن خارج شود و یا به حیوانات و گیاهان تماس داشته باشید
    میبایست خود را از بقیه خانواده جدا کرده و هیچگونه تماسی با بقیه افراد نداشته باشید
    لذا توصیه شده از منزل خارج نشوید و آذوقه و آب برای مدت ۳۶ ساعت تهیه نمایید

    در طول این 36 ساعت ، افرادی که خونریزی می کنند یا با حیوانات و
    گیاهان تماس می گیرند میبایست با رسته نو در روز کنشوزهلی تعمید شوند
    مگر آنکه روزه کامل بگیرند و بعد از كراصا غسل (طماشه) نمایند

    دعا و نیایش و تفکر در خصوص سالی که گذشت تاکید شده است

    بر غسل (طماشه) بعد از كراصا تاکید شده است
    """;

    return text;
  }

  static kenshiAr() {
    String text = """

    ${MandaEqu.mandaFeast()['kenshi']["ar"].trim()}

    اليوم الأخير من السنة

    يتم التركيز على تنظيف المنزل

    وقد تم التركيز على مساعدة المحتاجين وزيارتهم

    كراصا (البقاء في بيت) ليلتين ويوم واحد (ست وثلاثون ساعة) ، يبدأ مساء هذا اليوم

    يتم التركيز على الصباغه أو الغسل (الطماشة) قبل الكراصا

    التركيز على حماية الجسم

    تم التركيز على عدم لمس الیردنا(النهر)

    تم التركيز على عدم لمس النباتات والحيوانات

    خلال الكراصا (٣٦ ساعة)، إذا خرج الدم من الجسم أو لامس الحيوانات والنباتات
    يجب أن تفصل بينك وبين بقية أفراد الأسرة وعدم الاتصال بأشخاص آخرين
    لذلك يوصى بعدم مغادرة المنزل وتحضير الطعام والماء لمدة ٣٦ ساعة

    خلال هذه ٣٦ الساعات ، الأشخاص الذين يسيلون الدم أو يتعاملون مع الحيوانات والنباتات
    يجب أن يعتمدوا مع راسته جديد في يوم کنشوزهلی
    ما لم يصوموا بشكل كامل ويؤدون الغسل (الطماشة) بعد الكراصا

    يتم التأكيد على الصلاة والتفكير في العام الماضي

    يتم التأكيد على الغسل (الطماشة) بعد الكراصا
    """;

    return text;
  }

  static kenshiEn() {
    String text = """

    ${MandaEqu.mandaFeast()['kenshi']["en_US"].trim()}

    The last day of the year

    Emphasis is placed on cleaning the house

    Emphasis has been placed on helping and visiting people in need

    Kersa (Staying in a home) for two nights and one day(thirty-six hours), which starts  in the evening of this day

    Emphasis is placed on baptism or Ghasil (Tamasha) before Kersa

    Emphasis on body protection

    Emphasis has been placed on not touching the Yrdna (the river)

    Emphasis has been placed on not touching plants and animals

    During the Kersa (36 hours), if blood comes out of the body or comes in contact with animals and plants
    You should separate yourself from the rest of the family and have no contact with other people
    Therefore, it is recommended to not leave the house and prepare food and water for 36 hours

    During these 36 hours, people who are bleeding or come in contact with animals and plants
    They must be baptized with a new Rasteh on the day of Kenshi-u-Zehli
    Unless they fast completely and perform Ghusl (Tamasha) after Kersa

    Emphasis is placed on prayer and reflection in the past year

    Emphasis is placed on Ghusl (Tamasha) after Kersa
    """;

    return text;
  }

  static eidBigFa() {
    String text = """

    ${MandaEqu.mandaFeast()['eidBig']["fa_IR"].trim()}

    اولین روز سال

    (ادامه كراصا (ماندن در خانه) - تمام روز (کلا بمدت دو شب و یک روز که سی و شش ساعت است‌ 

    تاکید بر محافظت از جسم

    تاکید بر عدم دست زدن به یردنا شده است‌

    تاکید بر عدم دست زدن به گیاهان و حیوانات شده است‌

    اگر در مدت ۳۶ ساعت كراصا، خون از بدن خارج شود و یا به حیوانات و گیاهان تماس داشته باشید
    میبایست خود را از بقیه خانواده جدا کرده و هیچگونه تماسی با بقیه افراد نداشته باشید
    لذا توصیه شده از منزل خارج نشوید و آذوقه و آب برای مدت ۳۶ ساعت تهیه نمایید

    اشخاصی که در مدت ۳۶ ساعت نازل می شوند میبایست با رسته نو در روز کنشوزهلی تعمید شوند
    مگر آنکه روزه کامل بگیرند و بعد از اعتکاف غسل (طماشه) نمایند

    دعا و نیایش و تفکر در خصوص سالی که گذشت تاکید شده است

    بر غسل (طماشه) بعد از كراصا تاکید شده است
    """;

    return text;
  }

  static eidBigAr() {
    String text = """

    ${MandaEqu.mandaFeast()['eidBig']["ar"].trim()}

    اليوم الأول من السنة

    الاستمرار في الكراصا (البقاء في المنزل) - طوال اليوم (لمدة ليلتين ويوم واحد ، وهو ستة وثلاثون ساعة)

    لتركيز على حماية الجسم

    تم التركيز على عدم لمس الیردنا(النهر)

    تم التركيز على عدم لمس النباتات والحيوانات

    خلال الكراصا (٣٦ ساعة)، إذا خرج الدم من الجسم أو لامس الحيوانات والنباتات
    يجب أن تفصل بينك وبين بقية أفراد الأسرة وعدم الاتصال بأشخاص آخرين
    لذلك يوصى بعدم مغادرة المنزل وتحضير الطعام والماء لمدة ٣٦ ساعة

    خلال هذه ٣٦ الساعات ، الأشخاص الذين يسيلون الدم أو يتعاملون مع الحيوانات والنباتات
    يجب أن يعتمدوا مع راسته جديد في يوم کنشوزهلی
    ما لم يصوموا بشكل كامل ويؤدون الغسل (الطماشة) بعد الكراصا

    يتم التأكيد على الصلاة والتفكير في العام الماضي

    يتم التأكيد على الغسل (الطماشة) بعد الكراصا
    """;

    return text;
  }

  static eidBigEn() {
    String text = """

    ${MandaEqu.mandaFeast()['eidBig']["en_US"].trim()}

    The first day of the year

    Continue to Kersa (stay at home) - all day (for two nights and one day, which is thirty-six hours)

    Emphasis on body protection

    Emphasis has been placed on not touching the Yrdna (the river)

    Emphasis has been placed on not touching plants and animals

    During the Kersa (36 hours), if blood comes out of the body or comes in contact with animals and plants
    You should separate yourself from the rest of the family and have no contact with other people
    Therefore, it is recommended to not leave the house and prepare food and water for 36 hours

    During these 36 hours, people who are bleeding or come in contact with animals and plants
    They must be baptized with a new Rasteh on the day of Kenshi-u-Zehli
    Unless they fast completely and perform Ghusl (Tamasha) after Kersa

    Emphasis is placed on prayer and reflection in the past year

    Emphasis is placed on Ghusl (Tamasha) after Kersa
    """;

    return text;
  }

  static kersaFa() {
    String text = """

    ${MandaEqu.mandaFeast()['kersa']["fa_IR"].trim()}

    پایان كراصا

    بر غسل (طماشه) بعد از كراصا  تاکید شده است

    تاکید به کمک و بازید از افراد کم بضاعت شده است

    تاکید به دید و بازید شده است
    """;

    return text;
  }

  static kersaAr() {
    String text = """

    ${MandaEqu.mandaFeast()['kersa']["ar"].trim()}

    نهاية الكراصا

    يتم التأكيد على الغسل (الطماشة) بعد الكراصا

    وقد تم التركيز على مساعدة المحتاجين وزيارتهم
    """;

    return text;
  }

  static kersaEn() {
    String text = """

    ${MandaEqu.mandaFeast()['kersa']["en_US"].trim()}

    End of Kersa

    Emphasis is placed on Ghusl (Tamasha) after Kersa

    Emphasis has been placed on helping and visiting people in need
    """;

    return text;
  }

  static shoshianFa() {
    //  ${MandaEqu.mandaFeast()['shoshian'][0]["fa_IR"].trim()}
    String text = """

    عید شیشیان یا دهوا زوطا 

    رجال دین (گنزبرا و ترمیدا ) شاخه هایی را از درخت بید جمع آوری میکنند  
    و بعد از طماشه کردن آنها بر هر کدام از آن شاخه های  بوثه هایی را قرائت میکنند
    و آنها را همانند اکلیلا می بافند و آنها را کلیلا اد هلافا  (اکلیلای بید ) می نامند

    بر منداییان واجب است که اکلیلای هلافا را بر درب منزلشان آویزان کنند  
    اکلیلایی رمز بهجت و سرور و محبت است

    از روز قبل کلیله ها بر سر در یا داخل خانه نصب کنید
    """;

    return text;
  }

  static shoshianAr() {
    // ${MandaEqu.mandaFeast()['shoshian'][0]["ar"].trim()}

    String text = """

    عید شیشیان یا دهوا زوطا 

    شخصيات دينية (گنزبرا وترمیدا) تجمع الفروع من شجرة الصفصاف
    نسجوا أكليلا منهم

    يجب على المندائيين تعليق أكليلا الحلافة على باب منزلهم
    أكليلا سر السعادة والحب

    قم بتثبيت أكليلا على الباب أو داخل المنزل من اليوم السابق
    """;

    return text;
  }

  static shoshianEn() {
    // ${MandaEqu.mandaFeast()['shoshian'][0]["en_US"].trim()}
    String text = """
    
    Dehva Sheshian feast

    Religious figures (Ganzbra and Thermida) collect branches from the willow tree
    They weave a AkLila from them.

    It is obligatory on the Mandaeans to hang the AkLila on the door of their houses
    AkLila is the secret of happiness and love

    Hang the AkLila that was received the previous day on the door or inside the house
    """;

    return text;
  }

  static alfilFa() {
    String text = """

    ${MandaEqu.mandaFeast()['alfil']["fa_IR"].trim()}

    مصادف با روز اول ماه تورا

    مهیا کردن زمین برای زندگی بشریت و مهار اشرار از این روز آغاز گردید

    یک ظرف مخصوص حلوا تهیه می کنیم به نام "فل" که از مخلوط خرما با کنجد درست می شود و به شکل کروی در می آید
    """;

    return text;
  }

  static alfilAr() {
    String text = """

    ${MandaEqu.mandaFeast()['alfil']["ar"].trim()}

    بدأ إعداد الأرض لحياة البشرية وسيطرة الأشرار من هذا اليوم

    نقوم بتحضير طبق خاص من الحلاوة الطحينية يسمى "فل" والذي يصنع بخلط التمر مع السمسم وتشكيله بشكل كروي
    """;

    return text;
  }

  static alfilEn() {
    String text = """

    ${MandaEqu.mandaFeast()['alfil']["en_US"].trim()}

    The preparation of the earth for the life of humanity and the control of the wicked began from this day

    We prepare a special halva dish called "Fel" which is made by mixing dates with sesame and shaped into a sphere
    """;

    return text;
  }

  static eidSmallFa() {
    String text = """

    ${MandaEqu.mandaFeast()['eidSmall']["fa_IR"].trim()}

    زمین در این روز برای زندگی بشر مهیا گردید

    مندائیان طبق رسمی که دارند از نان برنجی وکنجد وخرما
    غذائی بنام هوخصا (مریس) درست کرده همراه با برنج وماست می خورند   
    """;

    return text;
  }

  static eidSmallAr() {
    String text = """

    ${MandaEqu.mandaFeast()['eidSmall']["ar"].trim()}

    كانت الأرض مهيأة للحياة البشرية في هذا اليوم

    وفقًا لعاداتهم الرسمية ، يصنع المندائيون طعامًا يسمى
    هوخصا (مريس) من خبز الأرز والسمسم والتمر ويأكلونه مع الأرز واللبن
    """;

    return text;
  }

  static eidSmallEn() {
    String text = """

    ${MandaEqu.mandaFeast()['eidSmall']["en_US"].trim()}

    The earth was prepared for human life on this day

    According to the Mandaean custom, they make a food called Hokhsa (Mris) 
    from rice bread, sesame, and dates and eat it with rice and yogurt.
    """;

    return text;
  }

  static ashorehFa() {
    String text = """

    ${MandaEqu.mandaFeast()['ashoreh']["fa_IR"].trim()}

    يك مناسبت تاريخى دینی  براى يادبود طوفان نوح است
    مندائیان واقعه کشتی نوح، بخاطر ادامهٔ  تعاليم دینی و حفظ مراسم نیاکان خود،
    برای روانهايى كه در طوفان غرق شدند، طلب آمرزش نمودند
    و از حبوباتى كه در كشتى بود، غذا(حلیم) پختند و مراسم لوفانى انجام دادند 
    """;

    return text;
  }

  static ashorehAr() {
    String text = """

    ${MandaEqu.mandaFeast()['ashoreh']["ar"].trim()}

    إنها مناسبة دينية تاريخية لإحياء ذكرى طوفان نوح

    طهوا طعام (حليم) تخليدًا لذكرى الغرقى وأداء المناسك(لوفاني)
    """;

    return text;
  }

  static ashorehEn() {
    String text = """

    ${MandaEqu.mandaFeast()['ashoreh']["en_US"].trim()}

    It is a historical religious occasion to commemorate the Flood of Noah

    They cooked food (Halim) in memory of the drowned and performed rituals (Lufani)
    """;

    return text;
  }
}
