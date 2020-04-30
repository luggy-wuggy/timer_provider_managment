import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "./models/timer_set.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<TimerSet>(
        create: (context) => TimerSet(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('Presets'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Options'),
          ),
        ] ,
      ),
    );
  }
}
