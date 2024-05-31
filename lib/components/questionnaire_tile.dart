import 'package:clini_dor/models/patient.dart';
import 'package:clini_dor/pages/patient_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionnaireTile extends StatelessWidget {
  
  QuestionnaireTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Questionário 1',
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