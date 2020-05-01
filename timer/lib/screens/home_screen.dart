import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../models/timer_set.dart";
import '../widgets/countdown.dart';

class HomeScreen extends StatefulWidget {
  final TimerSet setTimer;

  HomeScreen(this.setTimer);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: (widget.setTimer.roundDuration * 60).toInt(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double roundMinutes = ((widget.setTimer.roundDuration));
    String roundSeconds = ((roundMinutes * 60).toInt()).remainder(60).toString().padLeft(2, '0');

    double breakMinutes = ((widget.setTimer.breakDuration));
    String breakSeconds = ((breakMinutes * 60).toInt()).remainder(60).toString().padLeft(2, '0');

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Text(
            "${widget.setTimer.rounds} Rounds",
            style: TextStyle(fontSize: 35),
          ),
          Text(
            "Rounds ${roundMinutes.toInt()}:$roundSeconds  / Notice ${widget.setTimer.roundEndDuration}s",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Breaks ${breakMinutes.toInt()}:$breakSeconds / Notice ${widget.setTimer.breakEndDuration}s",
            style: TextStyle(fontSize: 20),
          ),
          CountDown(
            animation: StepTween(
                    begin: ((widget.setTimer.roundDuration) * 3600).toInt(),
                    end: 0)
                .animate(_controller),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('start'),
                onPressed: () {
                  //_controller.reset();
                  _controller.duration = Duration(
                    seconds: (widget.setTimer.roundDuration * 60).toInt(),
                  );
                  _controller.forward();
                },
              ),
              RaisedButton(
                child: Text('stop'),
                onPressed: () {
                  _controller.stop();
                },
              ),
            ],
          ),
          RaisedButton(
            child: Text('reset'),
            onPressed: () {
              _controller.reset();
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
