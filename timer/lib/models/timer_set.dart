

import 'package:flutter/material.dart';


class TimerSet with ChangeNotifier{  
  int rounds = 20;
  double roundDuration = 3;
  double breakDuration = 1;
  int roundEndDuration = 10;
  int breakEndDuration = 10;
  double readyDuration = .10;

  void setRound(int x){
    rounds = x;
    notifyListeners();
    print("$rounds  $roundDuration  $breakDuration   $roundEndDuration   $breakEndDuration   $readyDuration");
  }
  
  void setRoundDuration(double x){
    roundDuration = x;
    notifyListeners();
    print("$rounds  $roundDuration  $breakDuration   $roundEndDuration   $breakEndDuration   $readyDuration");
  }

  void setBreakDuration(double x){
    breakDuration = x;
    notifyListeners();

    print("$rounds  $roundDuration  $breakDuration   $roundEndDuration   $breakEndDuration   $readyDuration");
  }

  void setRoundEndDuration(int x){
    roundEndDuration = x;
    notifyListeners();

    print("$rounds  $roundDuration  $breakDuration   $roundEndDuration   $breakEndDuration   $readyDuration");
  }

  void setBreakEndDuration(int x){
    breakEndDuration = x;
    notifyListeners();

    print("$rounds  $roundDuration  $breakDuration   $roundEndDuration   $breakEndDuration   $readyDuration");
  }
}