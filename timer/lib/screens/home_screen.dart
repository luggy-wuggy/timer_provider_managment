import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../models/timer_set.dart";

class HomeScreen extends StatelessWidget {
  final TimerSet setTimer;

  HomeScreen(this.setTimer);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: Column(children: <Widget>[
          Consumer<TimerSet>(
            builder: (_, setTimer, __) => Text(
              "${setTimer.rounds} Rounds",
              style: TextStyle(fontSize: 35),
            ),
          ),
          Consumer<TimerSet>(
            builder: (_, setTimer, __) => Text(
              "Rounds 0${setTimer.roundDuration}:00 / Notice ${setTimer.roundEndDuration}s",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Consumer<TimerSet>(
            builder: (_, setTimer, __) => Text(
              "Breaks 0${setTimer.breakDuration}:00 / Notice ${setTimer.breakEndDuration}s",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ]));
  }
}
