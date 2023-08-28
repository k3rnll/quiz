import 'dart:math';

class QuestionsRepository {
  final Random random = Random();
  List<Question> questions = List.empty(growable: true);

  void init() {
    questions.add(Question(
        question: "Who is playing with this stick?",
        answers: List.of(["Goalie", "Forward", "Defenseman", "Referee"]),
        image: "image"));
    questions.add(Question(
        question: "Whose mask is this?",
        answers: List.of(["Goalie", "Forward", "Defenseman", "Referee"]),
        image: "image"));
    questions.add(Question(
        question: "What does the letter N mean in NHL?",
        answers: List.of(["National", "Northern", "Normal", "Nothing"]),
        image: "image"));
    questions.add(Question(
        question: "Whose skates are these?",
        answers: List.of(["Goalie", "Forward", "Defenseman", "Referee"]),
        image: "image"));
    questions.add(Question(
        question: "What year was the NHL founded?",
        answers: List.of(["1917", "1901", "1883", "1970"]),
        image: "image"));
    questions.add(Question(
        question: "What is the weight of a hockey puck?",
        answers: List.of(["200g", "80g", "500g", "370g"]),
        image: "image"));
    questions.add(Question(
        question:
            "What year did they start playing with six players on the ice?",
        answers: List.of(["1904", "1881", "1964", "1931"]),
        image: "image"));
    questions.add(Question(
        question: "What year was the first hockey game played?",
        answers: List.of(["1875", "1922", "1853", "1901"]),
        image: "image"));
    questions.add(Question(
        question: "What was the first hockey puck made of?",
        answers: List.of(["Wood", "Aluminum", "Rubber", "Iron"]),
        image: "image"));
    questions.add(Question(
        question:
            "What is it called when a player scores three goals in a single game?",
        answers: List.of(["Hat-trick", "Luck", "Skill", "Art"]),
        image: "image"));
    questions.add(Question(
        question: "Since what year did goalkeepers start using masks?",
        answers: List.of(["1936", "1891", "1971", "1901"]),
        image: "image"));
    questions.add(Question(
        question: "In which country did a goalie first start wearing a mask?",
        answers: List.of(["Japan", "Canada", "USA", "Germany"]),
        image: "image"));
    questions.add(Question(
        question: "What is the optimal ice thickness for hockey?",
        answers: List.of(["10cm", "5cm", "30cm", "52cm"]),
        image: "image"));
    questions.add(Question(
        question: "What is done with the puck before the game?",
        answers: List.of(["Freeze", "Heat", "Lubricate", "Wax"]),
        image: "image"));
    questions.add(Question(
        question: "How many names are currently on the Stanley Cup?",
        answers: List.of(["3000", "5110", "1200", "631"]),
        image: "image"));
    questions.add(Question(
        question: "What is the weight of a goaltender's equipment?",
        answers: List.of(["30kg", "10kg", "45kg", "20kg"]),
        image: "image"));
    questions.add(Question(
        question:
            "In which year was the first Ice Hockey World Championship held?",
        answers: List.of(["1920", "1892", "1901", "1937"]),
        image: "image"));
    questions.add(Question(
        question:
            "Since which year has it been prohibited to play without a mask?",
        answers: List.of(["1970", "1931", "1985", "1951"]),
        image: "image"));
    questions.add(Question(
        question: "What speed can a puck reach?",
        answers: List.of(["200km/h", "140km/h", "90km/h", "250km/h"]),
        image: "image"));
    questions.add(Question(
        question: "Do NHL players have the ability to consume alcohol?",
        answers: List.of(["Yes", "No", "Rarely", "Once a week"]),
        image: "image"));
    questions.add(Question(
        question: "What shape was the first puck?",
        answers: List.of(["Square", "Triangle", "Round", "Ball"]),
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
