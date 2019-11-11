import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flame/flame.dart';
import 'package:joystick/MyApp.dart';

void main() async {
  // orientation screen to left
  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  
  // full screen
  await SystemChrome.setEnabledSystemUIOverlays([]);

  Flame.images.loadAll(<String>[
    'joystick_background.png',
    'joystick_knob.png',
    'player_ship_red.png'
  ]);

  runApp(MyApp());
}
