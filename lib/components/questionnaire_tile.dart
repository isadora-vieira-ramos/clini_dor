import 'package:clini_dor/models/questionnaire.dart';
import 'package:clini_dor/pages/questionnaire_answers_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class QuestionnaireTile extends StatelessWidget {
  final Questionnaire questionnaire;
  final int indexInList;
  const QuestionnaireTile({super.key, required this.questionnaire, required this.indexInList});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionnaireAnswersPage(questionnaire: questionnaire))),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Questionário ${indexInList + 1}',
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    fontSize: 15    
                  )
                ),
              ),
              Text(
                'Data: ${DateFormat('dd/MM/yyyy').format(questionnaire.date)}',
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    fontSize: 15    
                  )
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top:8.0),
                child: Divider(color: Colors.black),
              )    
            ],
          ),
        ),
      ),
    );
  }
}