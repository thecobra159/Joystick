import 'package:control_pad/control_pad.dart';
import 'package:control_pad/models/gestures.dart';
import 'package:control_pad/models/pad_button_item.dart';
import 'package:flutter/material.dart';

class JoyPad extends StatelessWidget {
  final buttons = [
    PadButtonItem(index: 0, buttonText: "B", backgroundColor: Colors.red, pressedColor: Colors.black),
    PadButtonItem(index: 1, buttonText: "A", backgroundColor: Colors.lightGreen, pressedColor: Colors.black),
    PadButtonItem(index: 2, buttonText: "X", backgroundColor: Colors.lightBlue, pressedColor: Colors.black),
    PadButtonItem(index: 3, buttonText: "Y", backgroundColor: Colors.yellowAccent, pressedColor: Colors.black),
  ];

  void _printXY(double x, double y) {
    if (x == 0.0) {
      print("Centro");
    } else if ((x >= 1.0 && x <= 50.0) || (x >= 1.0 && x >= 320.0)) {
      print("Frente");
    } else if (x >= 50.1 && x <= 130.0) {
      print("Direita");
    } else if (x >= 130.1 && x <= 220.0) {
      print("Volta");
    } else {
      print("Esquerda");
    }
  }

  void _printButton(int i) {
    switch (i) {
      case 0:
        print("B");
        break;
      case 1:
        print("A");
        break;
      case 2:
        print("X");
        break;
      case 3:
        print("Y");
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(80),
              child: JoystickView(
                onDirectionChanged: (x, y) => _printXY(x, y),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 150),
              child: Image.asset(
                "images/xbox_logo.png",
                height: 150,
                width: 150,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(80, 80, 0, 80),
              child: PadButtonsView(
                buttons: this.buttons,
                padButtonPressedCallback: (int i, Gestures _gesture) => _printButton(i),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
