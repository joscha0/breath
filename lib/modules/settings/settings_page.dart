import 'package:breath/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headline2,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetX<SettingsController>(
          init: SettingsController(),
          builder: (c) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    'Background Color',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ToggleButtons(
                    children: [
                      for (String theme in c.themes) ...[
                        Container(
                          color: backgrounds[theme],
                          width: 50,
                        )
                      ]
                    ],
                    isSelected: c.isSelected,
                    borderWidth: 3,
                    selectedBorderColor: Colors.white,
                    borderColor: Colors.transparent,
                    onPressed: (index) {
                      c.selectBackground(index);
                    },
                  )
                ],
              ),
            );
          }),
    );
  }
}
