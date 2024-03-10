import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';


class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswer, required this.onRestart,});

  final List<String> chosenAnswer;
  final void Function() onRestart;
  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }



  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('you answered $numCorrectQuestions out of $numTotalQuestions correctly',
              style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,),
            ),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),

             OutlinedButton.icon(
          onPressed: onRestart,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 15)),
          icon: const Icon(Icons.refresh),
          label: const Text('Restart Quiz'),
        )
          ],
        ),
      ),
    );
  }
}
