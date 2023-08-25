import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:quiz/quiz_game.dart';

void main() {
  final quizGame = QuizGame();
  runApp(GameWidget(game: quizGame));
}
