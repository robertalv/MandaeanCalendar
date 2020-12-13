// // import 'dart:async';
// import 'dart:io';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:path_provider/path_provider.dart';

// // class ReadWrite{
// //   static readWrite() {
// //     _localFile;
// //   }
// // }
// main() {
//   // ignore: unnecessary_statements
//   TestWidgetsFlutterBinding.ensureInitialized();
//   _save("Farid test");
//   _read();
// }

// _read() async {
//   try {
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/farid.txt');
//     String text = await file.readAsString();
//     print(text);
//   } catch (e) {
//     print("Couldn't read file");
//   }
// }

// _save(message) async {
//   final directory = await getApplicationDocumentsDirectory();
//   print(directory);
//   final file = File('${directory.path}/farid.txt');

//   // var myPath = '/Users/farid.khafaji.zadeh/projects/my_app_cal/manda_calendar⁩';
//   // final file = File('$myPath/farid.txt');

//   print(file);
//   final text = message;
//   await file.writeAsString(text);
//   print('saved');
// }

// // class CounterStorage {
// //   Future<String> get _localPath async {
// //     final directory = await getApplicationDocumentsDirectory();

// //     return directory.path;
// //   }

// //   Future<File> get _localFile async {
// //     final path = await _localPath;
// //     return File('$path/farid.txt');
// //   }

// //   Future<int> readCounter() async {
// //     try {
// //       final file = await _localFile;

// //       // Read the file
// //       String contents = await file.readAsString();

// //       return int.parse(contents);
// //     } catch (e) {
// //       // If encountering an error, return 0
// //       return 0;
// //     }
// //   }

// //   Future<File> writeCounter(int counter) async {
// //     final file = await _localFile;

// //     // Write the file
// //     return file.writeAsString('$counter');
// //   }
// // }

// // class FlutterDemo extends StatefulWidget {
// //   final CounterStorage storage;

// //   FlutterDemo({Key key, @required this.storage}) : super(key: key);

// //   // @override
// //   // _FlutterDemoState createState() => _FlutterDemoState();
// // }
