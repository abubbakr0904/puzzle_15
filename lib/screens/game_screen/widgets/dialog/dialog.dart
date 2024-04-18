import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:puzzle_15/screens/game_screen/view/puzzle_screen.dart';
import 'package:puzzle_15/utils/images/images.dart';

import '../../controller/puzzle_controller.dart';

Future getDialog(BuildContext context){
  var puzzleController = Get.put(PuzzleController());
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Congratulations!' , style: TextStyle(
          color : Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          fontFamily: AppImages.fontJersey
        ),),
        content: Text('You won the game!' ,style: TextStyle(
            color : Colors.white,
            fontSize: 35.sp,
            fontWeight: FontWeight.w500,
            fontFamily: AppImages.fontJersey
        ), ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
            child: Text('Play Again' , style: TextStyle(
              color : Colors.white,
              fontFamily: AppImages.fontDosis,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp
            ),),
            onPressed: () {
              Navigator.pop(context);
              puzzleController.restart();
              puzzleController.startGame();
              puzzleController.numbers = [
                '1', '2', '3', '4',
                '5', '6', '7', '8',
                '9', '10', ' ', '12',
                "13" , '14', '11' , "15"
              ].obs;
              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=>const PuzzleScreen()), (route) => false);
            },
          ),
        ],
      );
    },
  );
}