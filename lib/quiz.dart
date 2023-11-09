import 'package:flutter/material.dart';
import 'package:quiz_app/Data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  // Widget? activeScreen;
  
  // @override // İNİT STATE YERİNE İF STATEMENT KULLANILABİLİR DAHA AZ KOD VE ANLAŞILMASI DAHA KOLAYDIR
  // void initState() {                          // !!! startscreen içine switch screen yazarken fonksiyonu bir değer gibi işaretçi olarak gönderebiliriz
  //   activeScreen = StartScreen(switchScreen); // start_screen içinde tanımladığımız startquiz fonksiyonu switchscreen i karşılar ve çalıştırır
  //   super.initState();                        // önce bu kısmın çalıştırlmasını sağlar
                            
  // }

  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';
    }
    );
  }


  void chooseAnswer(String answer){
    selectedAnswer.add(answer);

    if(selectedAnswer.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }
  
  void restartQuiz(){
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }



  @override 
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'question-screen'){
      screenWidget = QuestionsScreen(
        onSelectedAnswer: chooseAnswer
      );
    }

    if(activeScreen == 'result-screen'){
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                  Color.fromARGB(255, 240, 68, 16),
                  Color.fromARGB(255, 231, 97, 56)
                ],
                begin: Alignment.topLeft, 
                end: Alignment.bottomRight
              ),
            ),
          child: screenWidget,
          ),
        ), 
      );
  }
}