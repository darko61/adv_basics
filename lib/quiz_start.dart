import 'package:flutter/material.dart';
import 'package:adv_basics/styled_text.dart';

class QuizStart extends StatelessWidget {
  const QuizStart(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(151, 255, 255, 255),
        ),
        const SizedBox(
          height: 20,
        ),
        const StyledText('Learn flutter fun way'),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start quiz'),
        )
      ],
    ));
  }
}
