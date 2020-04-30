import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../models/timer_set.dart";


class Destination {
  const Destination(this.title, this.icon, this.color, this.body);
  final String title;
  final IconData icon;
  final MaterialColor color;
  final Widget body;
}

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text: ${widget.destination.title}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.destination.title}'),
          backgroundColor: widget.destination.color,
        ),
        backgroundColor: widget.destination.color[100],
        body: widget.destination.body,
      );
    
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
