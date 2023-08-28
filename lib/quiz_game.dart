import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:quiz/main_screen.dart';
import 'package:quiz/question.dart';

enum QuizComplexity { hard, normal, easy }

class QuizGame extends FlameGame {
  World world = World();
  CameraComponent cam = CameraComponent();
  final QuestionsRepository repository = QuestionsRepository();
  final QuizGameScreen quizGameScreen = QuizGameScreen();
  late Question? question;
  int score = 0;

  @override
  FutureOr<void> onLoad() {
    world.add(quizGameScreen);
    repository.init();
    question = repository.getRandomQuestion();
    add(world);
    cam = CameraComponent(world: world)
      ..viewfinder.visibleGameSize = Vector2(size.x, size.y)
      ..viewfinder.position = Vector2(size.x / 2, size.y / 2)
      ..viewfinder.anchor = Anchor.center;
    add(cam);
  }

  @override
  void update(double dt) {
    if (question != null && question!.isSolved) {
      repository.removeQuestion(question);
      question = repository.getRandomQuestion();
    }
    super.update(dt);
  }

  void evaluateAnswer(String input) {
    if (question != null && !(question!.isSolved)) {
      if (quizGameScreen.doAnswerScenario(question!.correctAnswer, input)) {
        question!.isSolved = true;
      }
      if (question!.correctAnswer.compareTo(input) == 0) {
        score++;
      }
    }
    print(input);
  }
}
