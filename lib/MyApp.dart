import 'package:flutter/material.dart';
import 'package:joystick/board_game.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BoardGame game = BoardGame();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: game.widget,
      ),
    );
  }
}
