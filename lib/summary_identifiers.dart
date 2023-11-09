import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,

  });

final int questionIndex;
final bool isCorrectAnswer;

@override
Widget build(context){
  final questionNumber = questionIndex +1;
  return Container(
    width: 30,
    height: 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color : isCorrectAnswer
        ? Colors.green
        : Colors.red,
      borderRadius: BorderRadius.circular(100),
    ),

    child: Text(
      questionNumber.toString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
    ),

  );
}
}