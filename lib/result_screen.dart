import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Data/questions.dart';
import 'package:quiz_app/question_summary.dart';


class ResultScreen extends StatelessWidget{
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart
  });

  final void Function() onRestart;
  final List<String> chosenAnswer;

  List <Map<String,Object>> getSummaryData(){ // map cevap:sonuç gibi düşünülebilir
  final List<Map<String,Object>> summary =[]; // Object olmasının sebebi dönecek tür hepsi olabilir
    for(var i=0;i<chosenAnswer.length;i++){   // Yani int , string bir cevap olabilir
      summary.add({                           // Bildiğin gibi !!! tüm değişken türleri flutter da bir objecttir
        'question_index' : i,
        'question' : questions[i].text,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : chosenAnswer[i]
      });
    } 
    return summary;
  }

   
      
                                                  
  @override                                   
  Widget build(context){      
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){ // where filtrelemek için kullanılıyor
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly !',
              style: GoogleFonts.lato( 
                color: const Color.fromARGB(255, 4, 77, 5),
                fontSize: 20,
                fontWeight: FontWeight.bold 
              ),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: onRestart,
               child: const Text('Restart Quiz')
               ),
          ],
        ),
      ),
    );

  }
}
