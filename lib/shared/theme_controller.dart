import 'package:breath/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final box = GetStorage();

  late Rx<Color> backgroundColor;

  @override
  void onInit() {
    backgroundColor = Rx<Color>(backgrounds[box.read('background') ?? 'blue']);
    super.onInit();
  }
}
