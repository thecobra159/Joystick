import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';
import 'package:flutter/services.dart';

void main() async {
  // rotate screen to left
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);

  // full screen
  await SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle bluetooth',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFF8E1),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(80),
              child: JoystickView(),
            ),
            Padding(
              padding: EdgeInsets.all(80),
              child: PadButtonsView(),
            ),
          ],
        ),
      ),
    );
  }
}
