import 'package:first_app/data/thequestions.dart';
import 'package:first_app/next_page.dart';
import 'package:first_app/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/results_screen.dart';

class TheQuiz extends StatefulWidget {
  const TheQuiz({super.key});
  @override
  State<TheQuiz> createState() {
    return _TheQuiz();
  }
}

var startAlign = Alignment.topCenter;
var endAlign = Alignment.bottomCenter;

class _TheQuiz extends State<TheQuiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomeScreen((switchScreen));
    if (activeScreen == 'questions') {
      screenWidget = Questions(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results_screen') {
      screenWidget = ResultsScreen(
        choosenAnswer: selectedAnswers,
        onstart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 24, 24, 24),
                Color.fromARGB(255, 24, 24, 24)
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
