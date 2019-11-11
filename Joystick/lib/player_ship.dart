import 'dart:math';

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
  double speed = 80.0;

  PlayerShip(this.game) {
    size = game.tileSize * aspectRatio;

    rect = Rect.fromLTWH(game.screenSize.width / 2 - (size / 2), game.screenSize.height / 2 - (size / 2), size, size);

    sprite = Sprite('player_ship_red.png');
  }

  void render(Canvas canvas) {
    canvas.save();
    canvas.translate(rect.center.dx, rect.center.dy);
    canvas.rotate(lastMoveAngle == 0.0 ? 0.0 : lastMoveAngle + (pi / 2));
    canvas.translate(-rect.center.dx, -rect.center.dy);
    sprite.renderRect(canvas, rect);
    canvas.restore();
  }

  void update(double t) {
    if (move) {
      double nextX = (speed * t) * cos(lastMoveAngle);
      double nextY = (speed * t) * sin(lastMoveAngle);
      Offset nextPoint = Offset(nextX, nextY);

      Offset diffBase = Offset(
        rect.center.dx + nextX,
        rect.center.dy + nextY,
      ) - rect.center;
      rect = rect.shift(diffBase);
    }
  }
}
