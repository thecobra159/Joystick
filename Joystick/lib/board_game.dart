import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/src/gestures/drag_details.dart';
import 'package:joystick/player_ship.dart';

import 'controller.dart';

class BoardGame extends Game {
  Size screenSize;
  double tileSize;

  PlayerShip playerShip;
  Controller controller;

  BoardGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    playerShip = PlayerShip(this);
    controller = Controller(this);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.height / 9; // 9:16 ratio
  }

  @override
  void render(Canvas canvas) {
    playerShip.render(canvas);
    controller.render(canvas);
  }

  @override
  void update(double t) {
    playerShip.update(t);
    controller.update(t);
  }

  void onPanStart(DragStartDetails details) {
    controller.onPanStart(details);
  }

  void onPanUpdate(DragUpdateDetails details) {
    controller.onPanUpdate(details);
  }

  void onPanEnd(DragEndDetails details) {
    controller.onPanEnd(details);
  }
}
