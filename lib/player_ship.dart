import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:joystick/board_game.dart';

class PlayerShip {
  final BoardGame game;

  double aspectRatio = 1.4;
  double size;
  Rect rect;
  Sprite sprite;

  bool move = false;
  double lastMoveAngle = 0.0;

  PlayerShip(this.game) {
    size = game.tileSize * aspectRatio;

    rect = Rect.fromLTWH(game.screenSize.width / 2 - (size / 2),
        game.screenSize.height / 2 - (size / 2), size, size);

    sprite = Sprite('player_ship_red.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double t) {

  }

}