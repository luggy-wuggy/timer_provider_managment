import 'package:flutter/material.dart';

import '../models/global.dart';

class PresetScreen extends StatefulWidget {
  @override
  _PresetScreenState createState() => _PresetScreenState();
}

class _PresetScreenState extends State<PresetScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            ListView.builder(
              itemCount: presetList.length,
              itemBuilder: (context, index) {
                return PresetContainer(index);
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(bottom: 20, right: 15),
                child: FloatingActionButton(
                  backgroundColor: Colors.cyan[700],
                  child: Icon(Icons.add),
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)
                            ),
                            title: Text('Set a preset'),
                            content: Container(
                              height: 300,
                              width: 200,
                              //color: Colors.red,
                            )
                          );
                        }
                      );
                  },
                ),
              ),
            )
          ],
        ));
  }
}

class PresetContainer extends StatelessWidget {
  PresetContainer(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    double roundMinutes = (presetList[index].roundDuration);
    String roundSeconds =
        ((roundMinutes * 60).toInt()).remainder(60).toString().padLeft(2, '0');

    double breakMinutes = (presetList[index].breakDuration);
    String breakSeconds =
        ((breakMinutes * 60).toInt()).remainder(60).toString().padLeft(2, '0');

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 10),
      width: double.infinity,
      height: 110,
      color: Colors.cyan[50],
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 260,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(presetList[index].title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    )),
                Text('${presetList[index].rounds} rounds',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )),
                Row(
                  children: [
                    Text('${roundMinutes.toInt()}:$roundSeconds',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[700],
                            fontWeight: FontWeight.w500)),
                    Text(
                      ' / ',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text('${breakMinutes.toInt()}:$breakSeconds',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red[700],
                            fontWeight: FontWeight.w500)),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              //color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text('set'),
                    onPressed: () {
                      
                    },
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.red[800],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Text(presetList[index].title, style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500,))
