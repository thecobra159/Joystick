import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:joystick/board_game.dart';

class Controller {
  final BoardGame game;

  double backgroundAspectRatio = 2.5;
  Rect backgroundRect;
  Sprite backgroundSprite;

  double knobAspectRatio = 1.2;
  Rect knobRect;
  Sprite knobSprite;

  bool dragging = false;
  Offset dragPosition;

  Controller(this.game) {
    backgroundSprite = Sprite('joystick_background.png');
    knobSprite = Sprite('joystick_knob.png');

    inittialize();
  }

  void inittialize() async {
    // circle radius that contain the background image of the joystick
    var radius = (game.tileSize * backgroundAspectRatio) / 2;

    Offset osBackground = Offset(radius + (radius / 2),
        game.screenSize.height - (radius + (radius / 2)));
    backgroundRect = Rect.fromCircle(
      center: osBackground,
      radius: radius,
    );

    // circle radius that contain the knob image of the joystick
    radius = (game.tileSize * knobAspectRatio) / 2;

    Offset osKnob = Offset(backgroundRect.center.dx, backgroundRect.center.dy);
    knobRect = Rect.fromCircle(
      center: osKnob,
      radius: radius,
    );

    // init drag position
    dragPosition = knobRect.center;
  }

  void render(Canvas canvas) {
    backgroundSprite.renderRect(canvas, backgroundRect);
    knobSprite.renderRect(canvas, knobRect);
  }

  void update(double t) {}
}
