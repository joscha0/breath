import 'package:breath/modules/home/home_page.dart';
import 'package:breath/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();

  runApp(GetMaterialApp(
    themeMode: ThemeMode.light,
    theme: ThemeData.light().copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              textStyle:
                  const TextStyle(fontWeight: FontWeight.w300, fontSize: 23))),
      scaffoldBackgroundColor: backgrounds[box.read('background') ?? 'blue'],
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: 70),
        headline2: TextStyle(
            fontWeight: FontWeight.w300, color: Colors.white, fontSize: 28),
        headline4: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
        headline5: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}
