import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BreatheController extends GetxController {
  int initTime = 300;
  RxInt time = 300.obs;
  String get timeString =>
      Duration(seconds: time.value).toString().split('.').first.substring(2);

  int initBreathTime = 5500;
  RxInt breathTime = 5500.obs;

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
      }
      if (breathTime.value > 0) {
        breathTime.value -= 100;
        update();
      } else {
        _breathTimer.cancel();
      }
    });
  }
}
