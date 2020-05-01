import 'package:flutter/material.dart';

import "../models/timer_set.dart";
import "../widgets/countdown.dart";

class OptionScreen extends StatefulWidget {

  final TimerSet setTimer;
  OptionScreen(this.setTimer);

  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  var roundController = TextEditingController();

  var roundDurationController = TextEditingController();

  var breakDurationController = TextEditingController();

  var roundEndDurationController = TextEditingController();

  var breakEndDurationController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(30),
      width: double.infinity,
      child: Column(
        children: <Widget>[
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
                  widget.setTimer.setRound(int.parse(roundController.text));
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
                  widget.setTimer.setRoundDuration(
                      double.parse(roundDurationController.text));
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
                  widget.setTimer.setBreakDuration(
                      double.parse(breakDurationController.text));
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
                  widget.setTimer.setRoundEndDuration(
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
                  widget.setTimer.setBreakEndDuration(
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
