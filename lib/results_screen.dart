import 'dart:ffi';

import 'package:first_app/data/thequestions.dart';
import 'package:flutter/material.dart';
import 'package:first_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.choosenAnswer, required this.onstart});
  final void Function() onstart;
  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'answers': questions[i].answers[0],
        'users_answers': choosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalAnswers = questions.length;
    final correctAnswers = summaryData.where((data) {
      return data['users_answers'] == data['answers'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $correctAnswers questions correctly out of $totalAnswers',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(height: 15),
            QuestionSummary(summaryData),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: onstart,
              child: const Text('restart quiz'),
            )
          ],
        ),
      ),
    );
  }
}
