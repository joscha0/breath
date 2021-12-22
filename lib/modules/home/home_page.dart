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
      body: GetX<HomeController>(
          init: HomeController(),
          builder: (c) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                ),
                if (c.running.value) ...[
                  Text(
                    '5:00',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  )
                ] else ...[
                  Text(
                    'breath',
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  )
                ],
                const SizedBox(height: 70),
                CircularPercentIndicator(
                  radius: 280,
                  lineWidth: 16,
                  backgroundColor: Colors.black12,
                  progressColor: Colors.white,
                  circularStrokeCap: CircularStrokeCap.round,
                  animation: true,
                  percent: 0.7,
                  center: const Padding(
                    padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: RiveAnimation.asset('assets/lung.riv'),
                  ),
                ),
                const SizedBox(height: 50),
                if (c.running.value) ...[
                  LinearPercentIndicator(
                    percent: 0.7,
                    backgroundColor: Colors.black12,
                    progressColor: const Color.fromRGBO(225, 225, 225, 1),
                    lineHeight: 12,
                    width: 200,
                    alignment: MainAxisAlignment.center,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'breathe in',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ] else ...[
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
                        c.start();
                      },
                    ),
                  )
                ],
              ],
            );
          }),
    );
  }
}
