import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({
    super.key,
    required this.answerText, // bu şekilde de tanımlanabilir
    required this.onTap
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context){
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: const Color.fromARGB(255, 240, 68, 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)), 
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10)     
      ),  
      child: Text(answerText,
        style: const TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}