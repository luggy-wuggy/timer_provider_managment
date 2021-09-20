import 'package:flutter/material.dart';

class Preset {

  String title;
  int rounds;
  double roundDuration;
  double breakDuration;
  int roundEndDuration;
  int breakEndDuration;
  int readyDuration;

  Preset({
    @required this.title,
    @required this.rounds,
    @required this.roundDuration,
    @required this.breakDuration,
    @required this.roundEndDuration,
    @required this.breakEndDuration,
    @required this.readyDuration,
  });
}
