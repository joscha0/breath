import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:breath/modules/home/home_page.dart';
import 'package:breath/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BreatheController extends GetxController {
  int initTime = totalTimeSecondsDefault;
  RxInt time = totalTimeSecondsDefault.obs;
  String get timeString =>
      Duration(seconds: time.value).toString().split('.').first.substring(2);

  int initBreathTime = breathTimeMillisecondsDefault;
  RxInt breathTime = breathTimeMillisecondsDefault.obs;

  RxBool breathIn = true.obs;

  late Timer _timer;
  late Timer _breathTimer;

  @override
  void onInit() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    startTimer();
  }

  @override
  void onClose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _timer.cancel();
    _breathTimer.cancel();
    super.onClose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time.value > 0) {
        time.value--;
        update();
      } else {
        _timer.cancel();
      }
    });

    _breathTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (time.value != 0 && breathTime.value == 0) {
        breathTime.value = initBreathTime;
        breathIn.value = !breathIn.value;
        AudioCache player = AudioCache();
        player.play('sound.mp3');
      }
      if (breathTime.value > 0) {
        breathTime.value -= 100;
        update();
      } else {
        _breathTimer.cancel();
        Get.offAll(() => const HomePage());
        Get.snackbar(
          'finished',
          '',
          backgroundColor: const Color.fromRGBO(225, 225, 225, 1),
          snackPosition: SnackPosition.BOTTOM,
          isDismissible: true,
          messageText: Container(),
          titleText: Text('finished',
              style:
                  Get.theme.textTheme.headline5?.copyWith(color: Colors.black)),
        );
      }
    });
  }
}
