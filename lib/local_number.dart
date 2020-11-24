import 'package:intl/intl.dart';

class LocalNum {
  static convertEntoFa(var input, String localLang) {
    if (localLang != 'en_US') {
      const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

      for (int i = 0; i < english.length; i++) {
        input = input.replaceAll(english[i], farsi[i]);
      }
    }

    return input;
  }

  static convertFatoEn(var input, String localLang) {
    if (localLang != 'en_US') {
      const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

      for (int i = 0; i < english.length; i++) {
        input = input.replaceAll(farsi[i], english[i]);
      }
    }

    return input;
  }

  static convertNumToLocalString(var input, String localLang) {
    var outPut;
    if (localLang != "en_US") {
      final percent = new NumberFormat("۱۲۳۴۵۶۷۸۹۰=", "fa_IR");

      outPut = percent.format(input).split("=");
      outPut = outPut[1];
    } else {
      outPut = input.toString();
    }
    return outPut;
  }
}
