import 'package:flutter/material.dart';

class MyAlignment {
  static countryLanguage(index) {
    Map data = {
      'en_US': Alignment.centerLeft,
      'fa_IR': Alignment.centerRight,
      'ar': Alignment.centerRight
    };
    return data[index];
  }

  static textAlig(index) {
    Map data = {
      'en_US': TextAlign.left,
      'fa_IR': TextAlign.right,
      'ar': TextAlign.right
    };
    return data[index];
  }
}
