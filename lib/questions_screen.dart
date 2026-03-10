import 'package:flutter/material.dart';
import 'package:secondprojecc/answer_button.dart';
import 'package:secondprojecc/data/questions.dart';


class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key,
  required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
final currentQuestion = questions[currentQuestionIndex];
    // shuffle the answer order so the correct one isn't always first
    final shuffledAnswers = currentQuestion.getShuffledAnswers();

   return SizedBox(
    width: double.infinity,
    child: Container(
      margin:const EdgeInsets.all(25),
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
      // build one button per answer
      for (var answer in shuffledAnswers)
        AnswerButton(
          answerText: answer,
          onTap: () => answerQuestion(answer),
        ),
    ],),
    ),
   );
  }
}
