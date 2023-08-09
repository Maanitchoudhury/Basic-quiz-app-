import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var startAlign = Alignment.topCenter;
var endAlign = Alignment.bottomCenter;

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/quiz-logo.png',
            width: 250,
            height: 400,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Learn Flutter the fun way!!',
            style: GoogleFonts.sedgwickAve(
                fontSize: 50,
                color: const Color.fromARGB(255, 224, 202, 4),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 22, 22, 22),
                backgroundColor: const Color.fromARGB(255, 224, 202, 4)),
            icon: const Icon(Icons.swipe_right_alt_rounded),
            label: const Text('Start quiz'),
          ),
        ],
      ),
    );
  }
}
