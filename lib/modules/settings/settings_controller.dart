import 'package:breath/shared/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  late List<String> themes;
  late RxList<bool> isSelected;

  final box = GetStorage();

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
