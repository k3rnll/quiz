import 'dart:math';

import 'package:quiz/quiz_game.dart';

class QuestionsRepository {
  final Random random = Random();
  List<Question> questions = List.empty(growable: true);

  void init() {
    questions.add(Question(
        question: "how old are you?",
        answers: List.of(["18", "12", "17", "43"]),
        image: "image"));
    questions.add(Question(
        question: "green color is?",
        answers: List.of(["green", "yellow", "black", "red"]),
        image: "image"));
    questions.add(Question(
        question: "sky is?",
        answers: List.of(["blue", "opal", "red", "white"]),
        image: "image"));
  }

  Question? getRandomQuestion() {
    if (questions.isNotEmpty) {
      int randomIndex = random.nextInt(questions.length);
      return questions[randomIndex];
    }
    return null;
  }

  void removeQuestion(Question? question) {
    if (questions.isNotEmpty &&
        question != null &&
        questions.contains(question)) {
      questions.remove(question);
    }
  }
}

class Question {
  late String question;
  late String image;
  late List<String> answers = List.empty(growable: true);
  late String correctAnswer;
  bool isSolved = false;

  Question(
      {required this.question, required this.answers, required this.image}) {
    correctAnswer = answers[0];
    isSolved = false;
  }
}
