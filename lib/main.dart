import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puzzle_15/screens/game_screen/view/puzzle_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const PuzzleScreen(),
    );
  }
}
// //
// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sekundomer',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: StopwatchPage(),
//     );
//   }
// }
//
// class StopwatchPage extends StatefulWidget {
//   @override
//   _StopwatchPageState createState() => _StopwatchPageState();
// }
//
// class _StopwatchPageState extends State<StopwatchPage> {
//   bool _isRunning = false;
//   int _seconds = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sekundomer'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               '$_seconds sekund',
//               style: TextStyle(fontSize: 36.0),
//             ),
//             SizedBox(height: 20.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     setState(() {
//                       _isRunning = !_isRunning;
//                       if (_isRunning) {
//                         startTimer();
//                       } else {
//                         stopTimer();
//                       }
//                     });
//                   },
//                   child: Text(_isRunning ? 'To\'xtatish' : 'Boshlash'),
//                 ),
//                 SizedBox(width: 20.0),
//                 TextButton(
//                   onPressed: () {
//                     setState(() {
//                       resetTimer();
//                     });
//                   },
//                   child: Text('Qayta boshlash'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void startTimer() {
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         _seconds++;
//         if(_seconds == 5){
//           _seconds = 1;
//         }
//       });
//     });
//   }
//
//   void stopTimer() {
//     _isRunning = false;
//   }
//
//   void resetTimer() {
//     _seconds = 0;
//     _isRunning = false;
//   }
// }
