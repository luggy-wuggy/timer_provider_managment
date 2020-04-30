import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "./models/timer_set.dart";

import './screens/option_screen.dart';
import './screens/home_screen.dart';
import './models/destination_view.dart';

void main() {
  runApp(
    MaterialApp(
        home: ChangeNotifierProvider<TimerSet>(
          create: (context) => TimerSet(),
          child: HomePage(),
        ),
        debugShowCheckedModeBanner: false),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {

  final timerSet = Provider.of<TimerSet>(context);

  List<Destination> allDestinations = <Destination>[
    Destination('Presets', Icons.bookmark, Colors.cyan, Container()),
    Destination('Home', Icons.home, Colors.teal, HomeScreen(timerSet)),
    Destination('Setting', Icons.settings, Colors.orange, OptionScreen(timerSet)),
  ];

    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allDestinations.map<Widget>((Destination destination) {
            return DestinationView(destination: destination);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            title: Text(destination.title),
            backgroundColor: destination.color,
          );
        }).toList(),
      ),
    );
  }
}
