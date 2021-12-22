import 'package:breath/modules/beathe/breathe_page.dart';
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
            width: double.infinity,
          ),
          Text(
            'breath',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Container(
            height: 280,
            width: 280,
            padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
            child: RiveAnimation.asset('assets/lung.riv'),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 130,
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('START'),
                  Icon(
                    Icons.play_arrow_rounded,
                  )
                ],
              ),
              onPressed: () {
                Get.to(() => BreathePage());
              },
            ),
          )
        ],
      ),
    );
  }
}
