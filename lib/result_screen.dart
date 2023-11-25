import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.onRestart});
  final List<String> chosenAnswer;
  final void Function() onRestart;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'question_answer': questions[i].answer[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestins = questions.length;
    final numCorrectAnswer = summaryData.where((data) {
      return data['question_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Your answer $numCorrectAnswer out of $numTotalQuestins question corretly!',
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  QuestionsSummary(summaryData),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton.icon(
                    onPressed: onRestart,
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    label: const Text('Restart Quiz!'),
                    icon: const Icon(Icons.refresh),
                  )
                ])));
  }
}
