import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'main.dart';
import 'user_set.dart';

Widget topIconInfo(BuildContext context, var lang, setState) {
  return Container(
      child: FittedBox(
          fit: BoxFit.contain,
          child: Container(
            child: Row(
              children: [
                FittedBox(
                  child: Row(
                    children: [
                      languageSwitch('English', lang, setState),
                      refresh(context, lang),
                    ],
                  ),
                ),
              ],
            ),
          )));
}

Widget languageSwitch(String dropdownValue, lang, setState) {
  String localLang = lang.name;
  return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
    icon: Icon(
      Icons.language,
      color: Colors.white,
      size: 30,
    ),
    onChanged: (String newValue) {
      setState(() {
        dropdownValue = newValue;
        // print(newValue);
        var langList = {'العربية': 'ar', 'فارسی': 'fa_IR', 'English': 'en_US'};
        localLang = langList[newValue];
        lang.name = localLang;
        UserSetting.setLanguage(localLang);
      });

      // _onDaySelected(_selectedDay, _selectedEvent, _selectedHoliday);
    },
    items: <String>['English', 'فارسی', 'العربية']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          // style: TextStyle(fontSize: _longFontSize, color: Colors.black),
          style: TextStyle(fontSize: 10.0, color: Colors.black),
        ),
      );
    }).toList(),
  ));
}

Widget refresh(BuildContext context, var localLang) {
  return Center(
      child: FlatButton.icon(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MandaeanCalendar()));
          },
          icon: Icon(
            Icons.refresh,
            color: Colors.white,
            size: 30,
          ),
          label: Text("")));
}
