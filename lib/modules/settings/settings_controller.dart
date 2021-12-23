import 'package:breath/shared/constants.dart';
import 'package:breath/shared/helpers.dart';
import 'package:breath/shared/theme_controller.dart';
import 'package:breath/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  List<BackgroundColors> themes = BackgroundColors.values;
  late RxList<bool> isSelected;

  final box = GetStorage();

  RxInt totalTimeSeconds = 300.obs;
  String get totalTimeString => Duration(seconds: totalTimeSeconds.value)
      .toString()
      .split('.')
      .first
      .substring(2);

  RxInt breathTimeMilliseconds = 5500.obs;
  String get breathTimeString =>
      Duration(milliseconds: breathTimeMilliseconds.value)
          .toString()
          .substring(5, 10);

  @override
  void onInit() {
    isSelected = List.generate(backgrounds.length, (index) => false).obs;
    isSelected[themes.indexOf(backgroundColorFromString(
        box.read('background') ?? defaultBackgroundColor.toString()))] = true;
    totalTimeSeconds.value = box.read('totalTime') ?? 300;
    breathTimeMilliseconds.value = box.read('breathTime') ?? 5500;
    super.onInit();
  }

  void selectBackground(int index, BuildContext context) {
    isSelected.value = List.generate(themes.length, (index) => false);
    isSelected[index] = true;
    box.write('background', themes[index].toString());
    Get.find<ThemeController>().backgroundColor.value =
        backgrounds[themes[index]];
  }

  void increaseTotalTime() {
    if (totalTimeSeconds.value < 3570) {
      totalTimeSeconds.value += 30;
    }

    box.write('totalTime', totalTimeSeconds.value);
  }

  void decreaseTotalTime() {
    if (totalTimeSeconds.value > 0) {
      totalTimeSeconds.value -= 30;
    }
    box.write('totalTime', totalTimeSeconds.value);
  }

  void increaseBreathTime() {
    if (breathTimeMilliseconds.value < 59500) {
      breathTimeMilliseconds.value += 500;
    }
    box.write('breathTime', breathTimeMilliseconds.value);
  }

  void decreaseBreathTime() {
    if (breathTimeMilliseconds.value > 0) {
      breathTimeMilliseconds.value -= 500;
    }
    box.write('breathTime', breathTimeMilliseconds.value);
  }
}
