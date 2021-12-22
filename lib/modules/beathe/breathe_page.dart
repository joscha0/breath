import 'package:breath/shared/rive_speed_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rive/rive.dart';

import 'breathe_controller.dart';

class BreathePage extends GetView<BreatheController> {
  const BreathePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetX<BreatheController>(
          init: BreatheController(),
          builder: (c) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                  ),
                  Text(
                    c.timeString,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  CircularPercentIndicator(
                    radius: 280,
                    lineWidth: 16,
                    backgroundColor: Colors.black12,
                    progressColor: Colors.white,
                    circularStrokeCap: CircularStrokeCap.round,
                    animateFromLastPercent: true,
                    animation: true,
                    animationDuration: 1000,
                    percent: c.time / c.initTime,
                    center: Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                      child: RiveAnimation.asset(
                        'assets/lung.riv',
                        controllers: [
                          SpeedController('breathe',
                              speedMultiplier: 1 / (c.initBreathTime / 1000))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  LinearPercentIndicator(
                    percent: c.breathIn.value
                        ? 1 - c.breathTime / c.initBreathTime
                        : c.breathTime / c.initBreathTime,
                    backgroundColor: Colors.black12,
                    progressColor: const Color.fromRGBO(225, 225, 225, 1),
                    lineHeight: 12,
                    width: 200,
                    animateFromLastPercent: true,
                    animation: true,
                    animationDuration: 100,
                    alignment: MainAxisAlignment.center,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      c.breathIn.value ? 'breathe in' : 'breath out',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]);
          }),
    );
  }
}
