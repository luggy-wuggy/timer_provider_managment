import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "../models/timer_set.dart";


class HomeScreenPee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Consumer<TimerSet>(
                builder: (_, setTimer, __) => Text(
                  "${setTimer.rounds} Rounds",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Center(
              child: Consumer<TimerSet>(
                builder: (_, setTimer, __) => Text(
                  "Rounds ${setTimer.roundDuration} / Notice ${setTimer.roundEndDuration}s",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Center(
              child: Consumer<TimerSet>(
                builder: (_, setTimer, __) => Text(
                  "Breaks ${setTimer.breakDuration} / Notice ${setTimer.breakEndDuration}s",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
