import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import 'quiz_game.dart';

class GreetingScreen extends PositionComponent with HasGameRef<QuizGame> {
  @override
  FutureOr<void> onLoad() {
    super.size = Vector2(game.size.x - 50, game.size.y - 50);
    super.position = Vector2(game.size.x / 2, game.size.y / 2);
    super.anchor = Anchor.center;
    add(TextComponent(
        text: "Choose Complexity",
        position: Vector2(size.x / 2, 50),
        anchor: Anchor.topCenter));
    add(ComplButton(
        complexity: QuizComplexity.hard,
        size: Vector2(200, 80),
        position: Vector2(size.x / 2, size.y / 4),
        anchor: Anchor.center));
    add(ComplButton(
        complexity: QuizComplexity.normal,
        size: Vector2(200, 80),
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center));
    add(ComplButton(
        complexity: QuizComplexity.easy,
        size: Vector2(200, 80),
        position: Vector2(size.x / 2, size.y / 4 * 3),
        anchor: Anchor.center));
    return super.onLoad();
  }

  @override
  bool get debugMode => true;
}

class ComplButton extends PositionComponent with TapCallbacks {
  final QuizComplexity complexity;
  Color color = Colors.green;
  ComplButton(
      {required this.complexity,
      required Vector2 size,
      required Vector2 position,
      required Anchor anchor}) {
    super.size = size;
    super.position = position;
    super.anchor = anchor;
    switch (complexity) {
      case QuizComplexity.hard:
        color = Colors.red;
        break;
      case QuizComplexity.normal:
        color = Colors.yellow;
        break;
      default:
        color = Colors.green;
        break;
    }
  }

  @override
  FutureOr<void> onLoad() {
    add(TextComponent(
        text: complexity.name,
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center));
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    print(complexity.name);
  }
}
