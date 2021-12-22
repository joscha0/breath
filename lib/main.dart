import 'package:breath/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.lightBlue[200],
      textTheme: const TextTheme(
        headline4: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
