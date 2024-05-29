import 'package:clini_dor/models/patient.dart';
import 'package:flutter/material.dart';

class QuestionnairePage extends StatelessWidget {
  
  Patient patient;
  QuestionnairePage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(child: Text('Questionário')),
      )
    );;
  }
}