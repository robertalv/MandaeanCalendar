import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'manda_mulwasha.dart';
import 'manda_top_icon_help.dart';
import 'manda_top_icon_holy_days.dart';
import 'manda_top_icon_mulwasha.dart';

Widget topIconDrawer(
  BuildContext context,
  var localLang,
) {
  MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
  var dropListData = mulwashaLabel.menuDrop;
  double _divecWidth = MediaQuery.of(context).size.width;
  double sizeRate = 1;
  if (_divecWidth > 700) {
    sizeRate = 2;
  }

  return Column(
    children: [
      Padding(padding: EdgeInsets.only(top: 70.0 * sizeRate)),
      ListTile(
          title: Text(dropListData[0],
              style: TextStyle(color: Colors.black, fontSize: 18.0 * sizeRate)),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MandaMulwashal(localLang)));
          }),
      Padding(padding: EdgeInsets.only(top: 10.0 * sizeRate)),
      ListTile(
          title: Text(dropListData[1],
              style: TextStyle(color: Colors.black, fontSize: 18.0 * sizeRate)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MandaDisplayHolyDays(localLang)),
            );
          }),
      Padding(padding: EdgeInsets.only(top: 10.0 * sizeRate)),
      ListTile(
          title: Text(dropListData[2],
              style: TextStyle(color: Colors.black, fontSize: 18.0 * sizeRate)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpDoc(localLang)),
            );
          }),
    ],
  );
}
