import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:puzzle_15/screens/game_screen/widgets/dialog/dialog.dart';

class PuzzleController extends GetxController {
  RxList<String> numbers = [
    '1', '2', '3', '4',
    '5', '6', '7', '8',
    '9', '10', '11', '12',
    "13" , '14', ' ' , "15"
  ].obs;

  bool gameOver = false;
  bool timer = true;
  int move = 0;
  RxInt minute = 0.obs;
  RxInt second = 0.obs;

  startGame(){
    numbers.shuffle();
    gameOver = false;
  }
  changeLocation(int index , BuildContext context){
    move++;
    if (!gameOver) {
      if (index - 1 >= 0 && numbers[index - 1] == " " && index % 4 != 0) {
        replaceElement(index, index - 1);
      } else if (index + 1 < 16 && numbers[index + 1] == " " && (index + 1) % 4 != 0) {
        replaceElement(index, index + 1);
      } else if (index - 4 >= 0 && numbers[index - 4] == " ") {
        replaceElement(index, index - 4);
      } else if (index + 4 < 16 && numbers[index + 4] == " ") {
        replaceElement(index, index + 4);
      }

      if (isSorted()) {
        gameOver = true;
        stopTimer();
        getDialog(context);
      }
    }
  }
  replaceElement(int i, int j) {
      String temp = numbers[i];
      numbers[i] = numbers[j];
      numbers[j] = temp;
  }
   bool isSorted() {
    for (int i = 0; i < 16; i++) {
      if (numbers[i] != '${i + 1}' && numbers[i] != " ") {
        return false;
      }
    }
    return true;
  }

  void startTimer() async{
    while(gameOver == false){
        await Future.delayed(Duration(seconds: 1));
        second = second + 1;
        if(second == 60){
          second = 0.obs;
          minute= minute + 1;
        }
    }
  }

  void stopTimer() {
    timer = false;
  }
  restart(){
    second = 0.obs;
    minute = 0.obs;
    move = 0;

  }


}