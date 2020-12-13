import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
        actions: <Widget>[
          // languageSwitch('English'),
          topIconInfo(context),
        ],
      ),
      // body: Center(
      //   child: RaisedButton(
      //     child: Text('Open route'),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => FaridHelpDoc()),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}

class FaridHelpDoc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: Column(
        children: [
          Text("Help .............                                                      test" +
              ".............                                                      test" +
              ".............                                                      test"),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          )
        ],
      ),
      // body: Center(
      //   child: RaisedButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Text('Ok'),
      //   ),
      // ),
    );
  }
}

class FaridMulwashal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mulwashal"),
      ),
      body: Column(
        children: [
          Text("Mulwashal .............                                                      test" +
              ".............                                                      test" +
              ".............                                                      test"),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          )
        ],
      ),
      // body: Center(
      //   child: RaisedButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Text('Ok'),
      //   ),
      // ),
    );
  }
}

Widget topIconInfo(BuildContext context) {
  return Container(
      child: FittedBox(
          fit: BoxFit.contain,
          child: Container(
            child: Row(
              children: [
                mulwashal(context),
                // languageSwitch('English'),
                helpDoc(context),
              ],
            ),
          )));
}

Widget mulwashal(BuildContext context) {
  return Center(
    child: Column(
      children: [
        Container(
          // margin: EdgeInsets.all(10),
          child: Tooltip(
            message: "Maluasha",
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FaridMulwashal()),
                  );
                },
                child: Icon(
                  Icons.assignment_ind,
                  color: Colors.deepPurple[800],
                  size: 45,
                )),
          ),
        )
      ],
    ),
  );
}

Widget helpDoc(BuildContext context) {
  return Center(
      child: FlatButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FaridHelpDoc()),
            );
          },
          icon: Icon(
            Icons.help,
            color: Colors.deepPurple[800],
            size: 45,
          ),
          label: Text("")));
}

// Widget _helpInfo() {
//   return Container(
//     child: new Stack(
//       children: [
//         new Container(
//           alignment: Alignment.center,
//           color: Colors.redAccent,
//           child: Text(
//               "Help                                                               help"),
//         ),
//         new Align(
//           alignment: Alignment.topCenter,
//           child: FloatingActionButton(
//               child: new Icon(Icons.add), onPressed: () {}),
//         )
//       ],
//     ),
//   );
// }
