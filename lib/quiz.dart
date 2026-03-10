//quiz.dart
import 'package:flutter/material.dart';
import 'package:secondprojecc/data/questions.dart';
import 'package:secondprojecc/questions_screen.dart';
import 'package:secondprojecc/results_screen.dart';
import 'package:secondprojecc/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];

  void chooseanswer(String answer){
    selectedAnswers.add(answer);
    // move to results when we've answered all questions
    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswers,
          onRestart: restartQuiz,
        );
      });
    }
  }

  // show the questions screen, used by the start button
  Widget? activeScreen;
  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseanswer);
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 63, 8, 165),
                Color.fromARGB(255, 12, 1, 39),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}