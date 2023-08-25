import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:quiz/greeting.dart';

enum QuizComplexity { hard, normal, easy }

class QuizGame extends FlameGame {
  World world = World();
  CameraComponent cam = CameraComponent();

  @override
  FutureOr<void> onLoad() {
    world.add(GreetingScreen());
    add(world);
    cam = CameraComponent(world: world)
      ..viewfinder.visibleGameSize = Vector2(size.x, size.y)
      ..viewfinder.position = Vector2(size.x / 2, size.y / 2)
      ..viewfinder.anchor = Anchor.center;
    add(cam);
  }
}