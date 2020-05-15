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
  CountDown countdownWidget;
  int count;
  int setRound;
  int startRound = 1;


  @override
  void initState() {
    //setRound = widget.setTimer.rounds;
    count = 0;
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: (widget.setTimer.roundDuration * 60).toInt(),
      ),
    );

    _controller.addListener(() => setState(() {}));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if(count % 2 == 1){
          //widget.setTimer.rounds--;
          startRound++;
        }
        print(count);
        count++;
        _controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        if (count == (setRound*2)-1){
          startRound = 1;
          count = 0;
          _controller.reset();
          _controller.stop();      
        }else{
          _controller.forward();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double roundMinutes = ((widget.setTimer.roundDuration));
    String roundSeconds =
        ((roundMinutes * 60).toInt()).remainder(60).toString().padLeft(2, '0');

    double breakMinutes = ((widget.setTimer.breakDuration));
    String breakSeconds =
        ((breakMinutes * 60).toInt()).remainder(60).toString().padLeft(2, '0');

    if (count % 2 == 0) {
      _controller.duration =
          Duration(seconds: (widget.setTimer.breakDuration * 60).toInt());
      countdownWidget = CountDown(
        animation: StepTween(
                begin: ((widget.setTimer.roundDuration) * 3600).toInt(), end: 0)
            .animate(_controller),
        indicationColor: Colors.lightGreen[600],
      );
    } else {
      
      _controller.duration =
          Duration(seconds: (widget.setTimer.roundDuration * 60).toInt());
      countdownWidget = CountDown(
        animation: StepTween(
                begin: ((widget.setTimer.breakDuration) * 3600).toInt(), end: 0)
            .animate(_controller),
        indicationColor: Colors.amber[600],
      );
    }

    //print("THIS IS HOME");

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
          SizedBox(height: 45,),
          Text('Round ${startRound}', style: TextStyle(fontSize: 40),),
          countdownWidget,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('start'),
                onPressed: () {
                  //_controller.reset();
                  if (count % 2 == 0) {
                    _controller.duration = Duration(
                      seconds: (widget.setTimer.roundDuration * 60).toInt(),
                    );
                  } else {
                    _controller.duration = Duration(
                      seconds: (widget.setTimer.breakDuration * 60).toInt(),
                    );
                  }

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
              startRound = 1;
              count = 0;
              _controller.reset();
              _controller.stop();
            },
          ),
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
