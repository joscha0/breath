import 'package:breath/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              textStyle:
                  const TextStyle(fontWeight: FontWeight.w300, fontSize: 23))),
      scaffoldBackgroundColor: Colors.blue[200],
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: 70),
        headline2: TextStyle(
            fontWeight: FontWeight.w300, color: Colors.white, fontSize: 28),
        headline4: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
        headline5: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
