import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'manda_equivalent.dart';
import 'manda_mulwasha.dart';
import 'my_color.dart';

class HelpDoc extends StatelessWidget {
  String localLang;
  HelpDoc(localLang) {
    this.localLang = localLang;
  }

  @override
  Widget build(BuildContext context) {
    MulwashaLabel mulwashaLabel = MulwashaLabel(localLang);
    Map _myColorSelection = Mycolor.selection();
    List imageName;
    Map imageNameMap = {
      'fa_IR': [
        'images/helpFa13.png',
        'images/helpFa23.png',
        'images/helpFa33.png'
      ],
      'ar': [
        'images/helpAr13.png',
        'images/helpAr23.png',
        'images/helpAr33.png'
      ],
      'en_US': [
        'images/helpEn13.png',
        'images/helpEn23.png',
        'images/helpEn33.png',
      ]
    };
    // imageName = imageNameMap[localLang];
    imageName = imageNameMap[localLang];
    int _sizeRate = 1;
    double _divecWidth = MediaQuery.of(context).size.width;
    if (_divecWidth > 1000) {
      _sizeRate = 2;
    }
    return Scaffold(
        appBar: AppBar(
            leading: backToMainPage(context),
            backgroundColor: _myColorSelection['header'],
            title: Center(
              child: Text(MandaEqu.helpTitle(localLang),
                  style: TextStyle(
                      color: Colors.black, fontSize: 18.0 * _sizeRate)),
            )),
        body: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  Center(
                    child: InteractiveViewer(
                      panEnabled: false, // Set it to false
                      boundaryMargin: EdgeInsets.all(100),
                      minScale: 1,
                      maxScale: 2,
                      child: Column(
                        children: [
                          Image.asset(
                            imageName[0],
                            // width: 400,
                            // height: 600,
                            fit: BoxFit.fitHeight,
                          ),
                          Image.asset(
                            imageName[1],
                            // width: 400,
                            // height: 600,
                            fit: BoxFit.fitHeight,
                          ),
                          Image.asset(
                            imageName[2],
                            // width: 400,
                            // height: 600,
                            fit: BoxFit.fitHeight,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text("\n"),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MandaeanCalendar()));
                    },
                    child: Text(mulwashaLabel.backBtn,
                        style: TextStyle(
                            color: Colors.black, fontSize: 18.0 * _sizeRate)),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget backToMainPage(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MandaeanCalendar()));
        });
  }
}
