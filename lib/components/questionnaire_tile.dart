import 'package:clini_dor/models/questionnaire.dart';
import 'package:clini_dor/pages/conducts_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class QuestionnaireTile extends StatelessWidget {
  final Questionnaire questionnaire;
  const QuestionnaireTile({super.key, required this.questionnaire});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ConductsPage())),
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
                'Questionário ${questionnaire.evaluationId}',
                style: GoogleFonts.josefinSans(
                  fontSize: 15
                ),
              ),
              Text(
                'Data: ${DateFormat('dd/MM/yyyy').format(questionnaire.date)}',
                style: GoogleFonts.josefinSans(
                  fontSize: 15
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top:8.0, left:8, right: 8),
                child: Divider(color: Colors.black),
              )    
            ],
          ),
        ),
      ),
    );
  }
}