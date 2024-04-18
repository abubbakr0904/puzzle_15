import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_15/screens/game_screen/controller/puzzle_controller.dart';
import 'package:puzzle_15/utils/images/images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  var puzzleController = Get.put(PuzzleController());
  AudioPlayer audioPlayer = AudioPlayer();
  bool tap = false;

  @override
  void initState() {
    puzzleController.restart();
    puzzleController.startGame();
    puzzleController.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Obx(
        () => Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "15 Puzzle",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppImages.fontJersey,
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    padding: EdgeInsets.all(10.w),
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      ...List.generate(
                          puzzleController.numbers.length,
                          (index) => ZoomTapAnimation(
                                onTap: () async {
                                  puzzleController.changeLocation(
                                      index, context);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: puzzleController.numbers[index] == (index + 1).toString() ? Colors.orange : Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Center(
                                        child: Stack(
                                      children: [
                                        Text(
                                          puzzleController.numbers[index],
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              fontFamily: AppImages.fontDosis,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 45.sp),
                                        ),
                                        Text(
                                          puzzleController.numbers[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: AppImages.fontDosis,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 40.sp),
                                        ),
                                      ],
                                    ))),
                              ))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.r),
                        color : Colors.white.withOpacity(0.2)
                      ),
                      child : Center(
                        child: Text("${puzzleController.minute} : ${puzzleController.second}" , style: TextStyle(
                          color : Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppImages.fontDosis,
                          fontSize: 30.sp,
                        ),),
                      )
                    ),
                    Container(
                      width: 100.w,
                      height: 100.h,
                      child: Center(
                        child: Text(puzzleController.move.toString() , style: TextStyle(
                          color : Colors.white,
                          fontSize: 70.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppImages.fontJersey
                        ),),
                      ),
                    ),
                    SizedBox(width: 100.w,)
                  ],
                ),
                SizedBox(height: 20.h,)
              ],
            ),
            puzzleController.gameOver
                ? Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Lottie.asset(AppImages.lottieFireWorks,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover))
                : Container(
                    width: 1,
                    height: 1,
                  )
          ],
        ),
      ),
    );
  }
}
