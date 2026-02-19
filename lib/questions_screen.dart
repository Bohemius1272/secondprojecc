import 'package:flutter/material.dart';
import 'package:secondprojecc/answer_button.dart';
import 'package:secondprojecc/data/questions.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  @override
  Widget build(BuildContext context) {

   return Text("Questions Screen");
  }
}

class _QuestionScreenState extends State<QuestionsScreen>{
  @override
  Widget build(BuildContext context) {
final currentQuestion = questions[0];
   return SizedBox(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(currentQuestion.question,
      style:TextStyle(
        color: Colors.white,
        fontSize: 28,
      )
      ),
      const SizedBox(height:30),
AnswerButton(answerText: currentQuestion.answers[0], onTap: (){}),
AnswerButton(answerText: currentQuestion.answers[1], onTap: (){}),
AnswerButton(answerText: currentQuestion.answers[2], onTap: (){}),
AnswerButton(answerText: currentQuestion.answers[3], onTap: (){}),
    ],),
   );
  }
}