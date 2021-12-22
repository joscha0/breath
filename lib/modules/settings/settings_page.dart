import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SettingsPage'),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(child: Text('SettingsController')));
  }
}
