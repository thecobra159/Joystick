import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:joystick/player_ship.dart';

class BoardGame extends Game {
  Size screenSize;
  double tileSize;

  PlayerShip playerShip;

  BoardGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    playerShip = PlayerShip(this);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.height / 9; // 9:16 ratio
  }

  @override
  void render(Canvas canvas){
    playerShip.render(canvas);
  }

  @override
  void update(double t) {
    playerShip.update(t);
  }
}