import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz ,{super.key});
  
  final void Function() startQuiz; 

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(          // opacity işlemi yorar. Kullanmamak daha iyi sadece bil
          //  'assets/images/quiz-logo.png',
          //   width: 300,
          // ),
            
          // ),
          
        Image.asset(
          'assets/images/quiz-logo.png', // opacity i renk ile değiştirebiliriz !!
          width: 300,
          color: const Color.fromARGB(180, 255, 255, 255),
        ),
          
          
          
          const SizedBox(height: 40),

          Text(
            'Learn Flutter The Fun Away',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 25
            ),  
          ),

          const SizedBox(height: 80),

          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40)
            ),
            icon: const Icon(Icons.arrow_right_outlined),
            label: const Text( // icon olduğunda label olarak değiştirilir
              'Start Quiz',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),

        ],
      ),
    );
  }
}