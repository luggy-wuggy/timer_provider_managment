import 'package:flutter/material.dart';

class CountDown extends AnimatedWidget {
  CountDown({Key key, this.animation, this.indicationColor} ) : super(key: key, listenable: animation);
  Animation<int> animation;
  Color indicationColor;
  

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String minutes = '${((clockTimer.inMinutes)~/60).toString()}';
    String seconds = '${(clockTimer.inMinutes.remainder(60)).toString().padLeft(2, '0')}';

    String timerText =
        '$minutes:$seconds';

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 110,
        color: indicationColor,
      ),
    );
  }
}
