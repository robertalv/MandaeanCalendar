import 'manda_equivalent.dart';

class MandaBaseDate {
  List<int> mandaList;
  static var panjeReset = 833;
  static final DateTime baseYear = DateTime(0, 7, 21);
  static final int adamBaseYear = 443367;
  static final Map mandaBase = {'y': 1, 'm': 6, 'd': 13};

  static matchMandaMonthName(int index) {
    final List mandaFaName = MandaEqu.mandaMonthNameFa();
    final List mandaEnName = MandaEqu.mandaMonthNameEn();

    final Map<int, List> mandaMonthName = {
      10: [mandaEnName[0], mandaFaName[0]],
      11: [mandaEnName[1], mandaFaName[1]],
      12: [mandaEnName[2], mandaFaName[2]],
      1: [mandaEnName[3], mandaFaName[3]],
      2: [mandaEnName[4], mandaFaName[4]],
      3: [mandaEnName[5], mandaFaName[5]],
      4: [mandaEnName[6], mandaFaName[6]],
      5: [mandaEnName[7], mandaFaName[7]],
      6: [mandaEnName[8], mandaFaName[8]],
      7: [mandaEnName[9], mandaFaName[9]],
      8: [mandaEnName[10], mandaFaName[10]],
      9: [mandaEnName[11], mandaFaName[11]],
      13: [mandaEnName[12], mandaFaName[12]]
    };
    // print(mandaMonthName[index]);
    return mandaMonthName[index];
  }

  static Map mandaEventsDateBase() {
    final List lightDayEventName = MandaEqu.mandaLightMbattal();
    final List heavyDayEventName = MandaEqu.mandaHeavyMbattal();
    final Map mandaFeast = MandaEqu.mandaFeast();

    Map mandaEventsDate = {
      1: {1: lightDayEventName},
      2: {},
      3: {
        1: [mandaFeast['yahya']],
        2: heavyDayEventName
      },
      4: {
        28: lightDayEventName,
        29: lightDayEventName,
        30: [mandaFeast['kenshi']]
      },
      5: {
        1: [mandaFeast['eidBig'], lightDayEventName],
        2: [mandaFeast['kersa'], lightDayEventName],
        3: lightDayEventName,
        4: lightDayEventName,
        5: lightDayEventName,
        6: [mandaFeast['shoshian'][0], heavyDayEventName],
        7: [mandaFeast['shoshian'][1], heavyDayEventName],
        8: lightDayEventName,
        9: lightDayEventName,
        10: lightDayEventName,
        11: lightDayEventName,
        12: lightDayEventName,
        13: lightDayEventName,
        14: lightDayEventName,
        22: lightDayEventName,
      },
      6: {25: lightDayEventName},
      7: {},
      8: {
        1: [mandaFeast['alfil'], lightDayEventName],
        2: lightDayEventName,
        3: lightDayEventName,
        4: lightDayEventName,
        18: [mandaFeast['eidSmall']]
      },
      9: {},
      10: {
        1: [mandaFeast['ashoreh']],
        9: lightDayEventName,
        15: lightDayEventName,
        23: lightDayEventName
      },
      11: {},
      12: {
        26: heavyDayEventName,
        27: heavyDayEventName,
        28: heavyDayEventName,
        29: heavyDayEventName,
        30: heavyDayEventName,
        31: [mandaFeast['banja'][0]],
        32: [mandaFeast['banja'][1]],
        33: [mandaFeast['banja'][2]],
        34: [mandaFeast['banja'][3]],
        35: [mandaFeast['banja'][4]]
      },
      13: {
        1: [mandaFeast['banja'][0]],
        2: [mandaFeast['banja'][1]],
        3: [mandaFeast['banja'][2]],
        4: [mandaFeast['banja'][3]],
        5: [mandaFeast['banja'][4]]
      },
    };
    return mandaEventsDate;
  }
}
