import 'package:clini_dor/models/patient.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatelessWidget {
  Patient patient;
  PatientPage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(patient.name)
        ],
      ),
    );
  }
}