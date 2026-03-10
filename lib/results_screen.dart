import 'package:flutter/material.dart';
import 'package:secondprojecc/data/questions.dart';
import 'package:secondprojecc/question_summary.dart';

class ResultsScreen extends StatelessWidget{

  const ResultsScreen({super.key,
  required this.chosenAnswers,});

  final List<String> chosenAnswers;

  List <Map<String, Object>> getSummaryData()
  {
    final List<Map<String, Object>> summary = [];
    for(var i = 0; i < chosenAnswers.length; i++)
      {
        summary.add({
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        });
      }
    return summary;
  }

  @override
  Widget build(context)
  {
    final summaryData = getSummaryData();
    final num totalQuestions = getSummaryData().length;
    final num correctQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('You answered X out of Y questions Correctly'),
            const SizedBox(height:30,),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(height:30,),
            TextButton(
              onPressed: (){},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}