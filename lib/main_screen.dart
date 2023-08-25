import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:quiz/quiz_game.dart';

class QuizGameScreen extends PositionComponent with HasGameRef<QuizGame> {
  late AnswerButton answerA;
  late AnswerButton answerB;
  late AnswerButton answerC;
  late AnswerButton answerD;

  @override
  FutureOr<void> onLoad() {
    super.size = Vector2(game.size.x - 50, game.size.y - 50);
    super.position = Vector2(game.size.x / 2, game.size.y / 2);
    super.anchor = Anchor.center;
    answerA = AnswerButton(
      answerText: "A",
      position: Vector2(size.x / 4, size.y / 4 * 3),
    );
    answerB = AnswerButton(
        answerText: "B", position: Vector2(size.x / 4 * 3, size.y / 4 * 3));
    answerC = AnswerButton(
        answerText: "C", position: Vector2(size.x / 4, size.y / 8 * 7));
    answerD = AnswerButton(
        answerText: "D", position: Vector2(size.x / 4 * 3, size.y / 8 * 7));
    add(TextBoxComponent(
        text:
            "_________ ____ ______ question placeholder ________ ________ ______ _____ !!! sfdg sfgsdfg sdfg sdfg sdgfg sdfgfgs dfg sd",
        //size: Vector2(size.x / 4 * 3, 100),
        boxConfig: TextBoxConfig(maxWidth: size.x / 8 * 7, growingBox: true),
        position: Vector2(size.x / 2, 50),
        anchor: Anchor.topCenter));
    add(PositionComponent(
        size: Vector2(size.x / 8 * 7, size.x / 2),
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center)); //Box for question image

    add(answerA);
    add(answerB);
    add(answerC);
    add(answerD);
    return super.onLoad();
  }

  @override
  bool get debugMode => true;
}

class AnswerButton extends PositionComponent with TapCallbacks {
  String answerText;
  AnswerButton({required this.answerText, required Vector2 position}) {
    super.size = Vector2(150, 80);
    super.position = position;
    super.anchor = Anchor.center;
  }

  @override
  FutureOr<void> onLoad() {
    add(TextComponent(
        text: answerText,
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center));
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    print(answerText);
  }
}
