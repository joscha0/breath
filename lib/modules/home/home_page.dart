import 'package:breath/modules/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rive/rive.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(SettingsPage(),
                    transition: Transition.rightToLeftWithFade);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              '5:00',
              style: Theme.of(context).textTheme.headline4,
            ),
            width: double.infinity,
            alignment: Alignment.center,
          ),
          CircularPercentIndicator(
            radius: 280,
            center: const Padding(
              padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
              child: RiveAnimation.asset('assets/lung.riv'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearPercentIndicator(),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'breathe in',
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }
}
