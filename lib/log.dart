// // Flutter code sample for DropdownButton

// // This sample shows a `DropdownButton` with a large arrow icon,
// // purple text style, and bold purple underline, whose value is one of "One",
// // "Two", "Free", or "Four".
// //
// // ![](https://flutter.github.io/assets-for-api-docs/assets/material/dropdown_button.png)

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// /// This Widget is the main application widget.
// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: Center(
//           child: MyStatefulWidget(),
//         ),
//       ),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   String dropdownValue = 'English';

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       // locale: 'en_US',
//       value: dropdownValue,
//       icon: Icon(Icons.arrow_downward),
//       iconSize: 24,
//       elevation: 16,
//       style: TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String newValue) {
//         setState(() {
//           dropdownValue = newValue;
//           print(dropdownValue);
//           // print(newValue);

//           switch (dropdownValue) {
//             case 'Arabic':
//               {
//                 print('Arabic');
//                 break;
//               }
//             case 'Farsi':
//               {
//                 print('Farsi');
//                 break;
//               }

//             // break;
//             default:
//               {
//                 print('English');
//                 break;
//               }
//           }
//         });
//       },
//       items: <String>['English', 'Farsi', 'Arabic']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }

// // import 'dart:io';
// // import 'dart:async';
// // import 'package:flutter/services.dart';
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(
// //     new MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: new ThemeData(primarySwatch: Colors.blue),
// //       home: new FlutterDemo(),
// //     ),
// //   );
// // }

// // class FlutterDemo extends StatefulWidget {
// //   FlutterDemo({Key key}) : super(key: key);

// //   @override
// //   _FlutterDemoState createState() => new _FlutterDemoState();
// // }

// // class _FlutterDemoState extends State<FlutterDemo> {
// //   int _counter;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _readCounter().then((int value) {
// //       setState(() {
// //         _counter = value;
// //       });
// //     });
// //   }

// //   Future<File> _getLocalFile() async {
// //     // get the path to the document directory.
// //     String dir = (await PathProvider.getApplicationDocumentsDirectory()).path;
// //     return new File('$dir/counter.txt');
// //   }

// //   Future<int> _readCounter() async {
// //     try {
// //       File file = await _getLocalFile();
// //       // read the variable as a string from the file.
// //       String contents = await file.readAsString();
// //       return int.parse(contents);
// //     } on FileSystemException {
// //       return 0;
// //     }
// //   }

// //   Future<Null> _incrementCounter() async {
// //     setState(() {
// //       _counter++;
// //     });
// //     // write the variable as a string to the file
// //     await (await _getLocalFile()).writeAsString('$_counter');
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return new Scaffold(
// //       appBar: new AppBar(title: new Text('Flutter Demo')),
// //       body: new Center(
// //         child: new Text('Button tapped $_counter time${
// //           _counter == 1 ? '' : 's'
// //         }.'),
// //       ),
// //       floatingActionButton: new FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: new Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SharedPreferences Demo',
//       home: SharedPreferencesDemo(),
//     );
//   }
// }

// class SharedPreferencesDemo extends StatefulWidget {
//   SharedPreferencesDemo({Key key}) : super(key: key);

//   @override
//   SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
// }

// class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   Future<int> _counter;

//   Future<void> _incrementCounter() async {
//     final SharedPreferences prefs = await _prefs;
//     final int counter = (prefs.getInt('counter') ?? 0) + 1;

//     setState(() {
//       _counter = prefs.setInt("counter", counter).then((bool success) {
//         return counter;
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _counter = _prefs.then((SharedPreferences prefs) {
//       return (prefs.getInt('counter') ?? 0);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("SharedPreferences Demo"),
//       ),
//       body: Center(
//           child: FutureBuilder<int>(
//               future: _counter,
//               builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                 switch (snapshot.connectionState) {
//                   case ConnectionState.waiting:
//                     return const CircularProgressIndicator();
//                   default:
//                     if (snapshot.hasError) {
//                       return Text('Error: ${snapshot.error}');
//                     } else {
//                       return Text(
//                         'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
//                         'This should persist across restarts.',
//                       );
//                     }
//                 }
//               })),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
