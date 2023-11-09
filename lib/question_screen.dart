import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/Data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({
    super.key,
    required this.onSelectedAnswer,
    });

  final void Function(String answer) onSelectedAnswer;

  @override
  State <QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectedAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }
  
  @override
  Widget build(context){  // center ile normalde yaptığımız gibi yapabiliriz
    final currentQuestion = questions[currentQuestionIndex];

    return //const Center( // veya sizedbox ile de oluşturulabilir
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Text(
    //         'Question',style: ,
    //       ),
    //       Text('Answer1'
    //       ),
    //       Text('Answer2'
    //       ),
    //       Text('Answer3'
    //       ),
        
    //     ]
    //   ),
    // );

    SizedBox( // bunun gibi sizedbox yardımıyla da yapılabilir
      width: double.infinity,
      child: Container( // container ile margin ayarlamak için ekledik
        margin: const EdgeInsets.all(30),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // stretch tüm şıkların boyunu eşitler
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 30),

            AnswerButton(answerText: currentQuestion.answers[0], onTap: (){
              answerQuestion(currentQuestion.answers[0]);
            }),
            const SizedBox(height: 10),
            AnswerButton(answerText: currentQuestion.answers[1], onTap: (){
              answerQuestion(currentQuestion.answers[1]);
            }),
            const SizedBox(height: 10),
            AnswerButton(answerText: currentQuestion.answers[2], onTap: (){
              answerQuestion(currentQuestion.answers[2]);
            }),
            const SizedBox(height: 10),
            AnswerButton(answerText: currentQuestion.answers[3], onTap: (){
              answerQuestion(currentQuestion.answers[3]);
            }),
      
          ],
        ),
      ),
    );
  }  
} 
