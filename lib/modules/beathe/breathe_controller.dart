import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BreatheController extends GetxController {
  int initTime = 300;
  RxInt time = 300.obs;
  String get timeString =>
      Duration(seconds: time.value).toString().split('.').first.substring(2);

  late Timer _timer;
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
    super.onClose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time.value > 0) {
        time.value -= 1;
        update();
      } else {
        _timer.cancel();
      }
      print(time.value);
    });
  }
}
