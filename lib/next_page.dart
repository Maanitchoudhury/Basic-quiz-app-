import 'package:flutter/material.dart';
import 'package:first_app/button_style.dart';
import 'package:first_app/data/thequestions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<Questions> createState() {
    return _Questions();
  }
}

class _Questions extends State<Questions> {
  var questionNumber = 0;

  void answeredQuestions(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(context) {
    final displayedQuestions = questions[questionNumber];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              displayedQuestions.text,
              style: GoogleFonts.ubuntu(
                  color: const Color.fromARGB(255, 224, 202, 4),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...displayedQuestions.getShuffledAnswers().map(
              (options) {
                return Buttons(
                    answerText: options,
                    onTap: () {
                      answeredQuestions(options);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
