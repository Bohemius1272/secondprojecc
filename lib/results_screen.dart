import 'package:flutter/material.dart';
import 'package:secondprojecc/data/questions.dart';
import 'package:secondprojecc/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
    required this.onRestartFirstQuestion,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart; // send user back to the start screen
  final void Function()
  onRestartFirstQuestion; // immediately show first question

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        // the first answer is considered the correct in our data
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalQuestions = summaryData.length;
    final correctQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    // summary results
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 24),
                children: [
                  const TextSpan(text: 'You answered '),
                  TextSpan(
                    text: '$correctQuestions',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: ' out of '),
                  TextSpan(
                    text: '$totalQuestions',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const TextSpan(text: ' questions correctly!'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            // go back to start screen or try quiz again
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: onRestart,
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  child: const Text(
                    'Back to Start',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: onRestartFirstQuestion,
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  child: const Text(
                    'Try Again',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
