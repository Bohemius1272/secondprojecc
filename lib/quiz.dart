import 'package:flutter/material.dart';
import 'package:secondprojecc/questions_screen.dart';
import 'package:secondprojecc/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  Widget? activeScreen;
  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen();
    });
  }
  
  void initState(){
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return activeScreen!;
  }
}
