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
                    center: const Padding(
                      padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
                      child: RiveAnimation.asset('assets/lung.riv'),
                    ),
                  ),
                  const SizedBox(height: 50),
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
                ]);
          }),
    );
  }
}
