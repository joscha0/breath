import 'package:breath/shared/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  late List<String> themes;
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

  // {
  //   Duration _breathDuration =
  //       Duration(milliseconds: breathTimeMilliseconds.value);
  //   print(_breathDuration.toString());
  //   return '${_breathDuration.inSeconds}:${breathTimeMilliseconds.remainder(1000).toString().substring(0, 2)}'
  //       .padLeft(5, '0');
  // }

  @override
  void onInit() {
    themes = backgrounds.keys.toList();
    isSelected = List.generate(backgrounds.length, (index) => false).obs;
    isSelected[themes.indexOf(box.read('background'))] = true;
    super.onInit();
  }

  void selectBackground(int index) {
    isSelected.value = List.generate(themes.length, (index) => false);
    isSelected[index] = true;
    box.write('background', themes[index]);
    Get.changeTheme(Get.theme
        .copyWith(scaffoldBackgroundColor: backgrounds[themes[index]]));
  }
}
