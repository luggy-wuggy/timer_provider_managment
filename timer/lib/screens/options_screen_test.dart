import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../models/timer_set.dart";


class OptionScreenPee extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var roundController = TextEditingController();
    var roundDurationController = TextEditingController();
    var breakDurationController = TextEditingController();
    var roundEndDurationController = TextEditingController();
    var breakEndDurationController = TextEditingController();
    final setTimer = Provider.of<TimerSet>(context, listen: false);

    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
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
            SizedBox(height: 40),
            Row(
              children: <Widget>[
                Text("Number of Rounds"),
                Flexible(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: roundController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setTimer.setRound(int.parse(roundController.text));
                  },
                  child: Text('set'),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text("Round Length"),
                Flexible(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: roundDurationController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setTimer.setRoundDuration(
                        int.parse(roundDurationController.text));
                  },
                  child: Text('set'),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text("Break Length"),
                Flexible(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: breakDurationController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setTimer.setBreakDuration(
                        int.parse(breakDurationController.text));
                  },
                  child: Text('set'),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text("Round End Notice"),
                Flexible(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: roundEndDurationController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setTimer.setRoundEndDuration(
                        int.parse(roundEndDurationController.text));
                  },
                  child: Text('set'),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text("Break End Notice"),
                Flexible(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: breakEndDurationController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setTimer.setBreakEndDuration(
                        int.parse(breakEndDurationController.text));
                  },
                  child: Text('set'),
                )
              ],
            ),
          ],
        ),
      );
    
  }
}
