import 'package:breath/shared/constants.dart';
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                  ),
                  Text(
                    'Background Color',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ToggleButtons(
                    children: [
                      for (BackgroundColors theme in c.themes) ...[
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
                      c.selectBackground(index, context);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Timers',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('total time [min]',
                            style: Theme.of(context).textTheme.headline6),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () => c.increaseTotalTime(),
                                icon: const Icon(Icons.arrow_drop_up)),
                            Text('${c.totalTimeString} min'),
                            IconButton(
                                onPressed: () => c.decreaseTotalTime(),
                                icon: const Icon(Icons.arrow_drop_down))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('breath time [sec]',
                            style: Theme.of(context).textTheme.headline6),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () => c.increaseBreathTime(),
                                icon: const Icon(Icons.arrow_drop_up)),
                            Text('${c.breathTimeString} sec'),
                            IconButton(
                                onPressed: () => c.decreaseBreathTime(),
                                icon: const Icon(Icons.arrow_drop_down))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
