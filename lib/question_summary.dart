import 'package:flutter/material.dart';
import 'package:quiz_app/summary_item.dart';

class QuestionSummary extends StatelessWidget{
  const QuestionSummary(this.summaryData , {super.key});

  final List <Map<String,Object>> summaryData;

  @override
  Widget build(context){
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map( // BU MAP İLE YUKARIDAKİ AYNI DEĞİL
            (data) {                 // BU MAP TÜR DEĞİŞTRİME GİBİ İŞLEVLER YAPAR DİĞERİ VERİ TÜRÜ GİBİDİR
              return SummaryItem(data);
            }
          ).toList()
        ),
      ),
    );
  }


}