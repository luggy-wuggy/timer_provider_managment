import 'package:flutter/material.dart';

import './preset.dart';

List<Preset> presetList = [
  Preset(
    title: 'Classic Boxing',
    rounds: 12,
    roundDuration: 3,
    breakDuration: 1,
    breakEndDuration: 10,
    roundEndDuration: 10,
    readyDuration: 5,
  ),
  Preset(
    title: 'Tabata',
    rounds: 8,
    roundDuration: .34,
    breakDuration: .17,
    breakEndDuration: 5,
    roundEndDuration: 5,
    readyDuration: 5,
  ),
  Preset(
    title: 'Sprints',
    rounds: 6,
    roundDuration: 0.5,
    breakDuration: 4,
    breakEndDuration: 15,
    roundEndDuration: 30,
    readyDuration: 10,
  ),


];
