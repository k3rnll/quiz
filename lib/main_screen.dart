import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:quiz/quiz_game.dart';

class QuizGameScreen extends PositionComponent with HasGameRef<QuizGame> {
  final Random random = Random();
  String question = "question";
  late TextComponent scoreBox;
  late TextBoxComponent questionBox;
  late AnswerButton answerA;
  late AnswerButton answerB;
  late AnswerButton answerC;
  late AnswerButton answerD;
  List<AnswerButton> buttons = List.empty(growable: true);
  var randomIndexes = [0, 1, 2, 3];
  double answerPause = 0;

  @override
  FutureOr<void> onLoad() {
    super.size = Vector2(game.size.x - 50, game.size.y - 50);
    super.position = Vector2(game.size.x / 2, game.size.y / 2);
    super.anchor = Anchor.center;
    questionBox = TextBoxComponent(
        text: question,
        //size: Vector2(size.x / 4 * 3, 100),
        boxConfig: TextBoxConfig(maxWidth: size.x / 8 * 7, growingBox: true),
        position: Vector2(size.x / 2, 100),
        anchor: Anchor.topCenter);

    answerA = AnswerButton(
        answerText: "A", position: Vector2(size.x / 4, size.y / 4 * 3));
    answerB = AnswerButton(
        answerText: "B", position: Vector2(size.x / 4 * 3, size.y / 4 * 3));
    answerC = AnswerButton(
        answerText: "C", position: Vector2(size.x / 4, size.y / 8 * 7));
    answerD = AnswerButton(
        answerText: "D", position: Vector2(size.x / 4 * 3, size.y / 8 * 7));
    scoreBox = TextComponent(
        text: "score : ",
        size: Vector2(size.x / 8 * 7, 40),
        position: Vector2(size.x / 2, 20),
        anchor: Anchor.topCenter);
    add(PositionComponent(
        size: Vector2(size.x / 8 * 7, size.x / 2),
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center)); //Box for question image

    buttons.addAll([answerA, answerB, answerC, answerD]);
    _randomizeIndexes();
    add(scoreBox);
    add(questionBox);
    addAll(buttons);
    return super.onLoad();
  }

  bool doAnswerScenario(String correctAnswer, String input) {
    if (answerPause == 0) {
      for (AnswerButton button in buttons) {
        if (correctAnswer.compareTo(button.answerText) == 0) {
          button.makeGreen();
        }
      }
      if (correctAnswer.compareTo(input) != 0) {
        for (AnswerButton button in buttons) {
          if (input.compareTo(button.answerText) == 0) {
            button.makeRed();
          }
        }
      }
      answerPause = 2;
      _randomizeIndexes();
      return true;
    }
    return false;
  }

  @override
  void update(double dt) {
    scoreBox.text = "score : ${game.score}";
    answerPause = answerPause > 0 ? answerPause - dt : 0;
    if (answerPause == 0) {
      if (game.question != null) {
        questionBox.text = game.question!.question;
        answerA.answerText = game.question!.answers[randomIndexes[0]];
        answerB.answerText = game.question!.answers[randomIndexes[1]];
        answerC.answerText = game.question!.answers[randomIndexes[2]];
        answerD.answerText = game.question!.answers[randomIndexes[3]];
      } else {
        questionBox.text = "";
        answerA.answerText = "";
        answerB.answerText = "";
        answerC.answerText = "";
        answerD.answerText = "";
      }
      for (AnswerButton button in buttons) {
        button.makeBlack();
      }
    }
    super.update(dt);
  }

  void _randomizeIndexes() {
    for (int i = 0; i < randomIndexes.length; i++) {
      int from = random.nextInt(randomIndexes.length);
      int to = random.nextInt(randomIndexes.length);
      int tmp = randomIndexes[to];
      randomIndexes[to] = randomIndexes[from];
      randomIndexes[from] = tmp;
    }
  }

  @override
  bool get debugMode => true;
}

class AnswerButton extends PositionComponent
    with TapCallbacks, HasGameRef<QuizGame> {
  Paint buttonColor = Paint()..color = Colors.black;
  String answerText;

  late TextComponent text;
  AnswerButton({required this.answerText, required Vector2 position}) {
    super.size = Vector2(150, 80);
    super.position = position;
    super.anchor = Anchor.center;
    text = TextComponent(
        text: answerText,
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center);
  }

  @override
  FutureOr<void> onLoad() {
    add(text);
    return super.onLoad();
  }

  void makeGreen() {
    _setColor(Colors.green);
  }

  void makeRed() {
    _setColor(Colors.red);
  }

  void makeBlack() {
    _setColor(Colors.black);
  }

  void _setColor(Color color) {
    buttonColor.color = color;
  }

  @override
  void update(double dt) {
    text.text = answerText;
  }

  @override
  void render(Canvas canvas) {
    Rect rect = Rect.fromLTRB(0, 0, size.x, size.y);
    canvas.drawRect(rect, buttonColor);
    super.render(canvas);
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.evaluateAnswer(answerText);
  }
}
