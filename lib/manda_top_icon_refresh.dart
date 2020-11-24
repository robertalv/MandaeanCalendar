import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'main.dart';

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
