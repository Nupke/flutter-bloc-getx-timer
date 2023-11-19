import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'timer_controller.dart';

class GetXTimerPage extends StatelessWidget {
  final int waitTimeInSec;
  late final TimerController controller;
  GetXTimerPage({Key? key, required this.waitTimeInSec}) : super(key: key) {
    controller = TimerController(waitTimeInSec);
  }

  Widget build(BuildContext context) {
    print('context $context');
    final size = MediaQuery.of(context).size;
    return Center(
        child: Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.1,
            width: size.height * 0.1,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                controller.restart();
              },
              shape: CircleBorder(),
              child: const Icon(Icons.restart_alt),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: size.height * 0.1,
                  width: size.height * 0.1,
                  margin: const EdgeInsets.all(10),
                  child: CircularProgressIndicator(
                    value: controller.percent.value,
                    backgroundColor: Colors.red[800]!,
                    strokeWidth: 8,
                  )),
              Positioned(
                  child: Text(
                controller.timeStr.value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ))
            ],
          ),
          Container(
            height: size.height * 0.1,
            width: size.height * 0.1,
            child: FloatingActionButton(
              onPressed: () {
                controller.isRun.value
                    ? controller.pause()
                    : controller.start();
              },
              shape: CircleBorder(),
              child: controller.isRun.value
                  ? const Icon(Icons.pause)
                  : const Icon(Icons.play_arrow),
            ),
          ),
        ],
      ),
    ));
  }
}
