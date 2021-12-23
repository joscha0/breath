import 'package:breath/shared/constants.dart';
import 'package:breath/shared/helpers.dart';
import 'package:breath/shared/theme_controller.dart';
import 'package:breath/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  List<BackgroundColors> themes = BackgroundColors.values;
  late RxList<bool> isSelected;

  final box = GetStorage();

  RxInt totalTimeSeconds = totalTimeSecondsDefault.obs;
  String get totalTimeString => Duration(seconds: totalTimeSeconds.value)
      .toString()
      .split('.')
      .first
      .substring(2);

  RxInt breathTimeMilliseconds = breathTimeMillisecondsDefault.obs;
  String get breathTimeString =>
      Duration(milliseconds: breathTimeMilliseconds.value)
          .toString()
          .substring(5, 10);

  RxBool soundOn = true.obs;
  RxBool hideTimer = false.obs;
  RxBool hideBreathBar = false.obs;

  @override
  void onInit() {
    isSelected = List.generate(backgrounds.length, (index) => false).obs;
    isSelected[themes.indexOf(backgroundColorFromString(
        box.read(boxBackgroundColor) ??
            defaultBackgroundColor.toString()))] = true;
    totalTimeSeconds.value = box.read(boxTotalTime) ?? totalTimeSecondsDefault;
    breathTimeMilliseconds.value =
        box.read(boxBreathTime) ?? breathTimeMillisecondsDefault;
    soundOn.value = box.read(boxSoundOn) ?? true;
    hideTimer.value = box.read(boxHideTimer) ?? false;
    hideBreathBar.value = box.read(boxHideBreathBar) ?? false;
    super.onInit();
  }

  void selectBackground(int index, BuildContext context) {
    isSelected.value = List.generate(themes.length, (index) => false);
    isSelected[index] = true;
    box.write(boxBackgroundColor, themes[index].toString());
    Get.find<ThemeController>().backgroundColor.value =
        backgrounds[themes[index]];
  }

  void increaseTotalTime() {
    if (totalTimeSeconds.value < 3570) {
      totalTimeSeconds.value += 30;
    }

    box.write(boxTotalTime, totalTimeSeconds.value);
  }

  void decreaseTotalTime() {
    if (totalTimeSeconds.value > 0) {
      totalTimeSeconds.value -= 30;
    }
    box.write(boxTotalTime, totalTimeSeconds.value);
  }

  void increaseBreathTime() {
    if (breathTimeMilliseconds.value < 59500) {
      breathTimeMilliseconds.value += 500;
    }
    box.write(boxBreathTime, breathTimeMilliseconds.value);
  }

  void decreaseBreathTime() {
    if (breathTimeMilliseconds.value > 0) {
      breathTimeMilliseconds.value -= 500;
    }
    box.write(boxBreathTime, breathTimeMilliseconds.value);
  }

  void openGithub() async {
    await launch(githubUrl);
  }

  void setSoundOn(bool value) {
    soundOn.value = value;
    box.write(boxSoundOn, value);
  }

  void setHideTimer(bool value) {
    hideTimer.value = value;
    box.write(boxHideTimer, value);
  }

  void setHideBreathBar(bool value) {
    hideBreathBar.value = value;
    box.write(boxHideBreathBar, value);
  }
}
