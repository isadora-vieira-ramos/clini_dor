import 'package:clini_dor/models/patient.dart';
import 'package:clini_dor/pages/evaluations_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientPage extends StatelessWidget {
  Patient patient;
  PatientPage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          "Paciente",
          style: GoogleFonts.josefinSans(
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              patient.name,
              style: GoogleFonts.josefinSans(
                fontSize: 15
              ),
            ),
            Text(
              'Prontuário ${patient.medicalRecord}',
              style: GoogleFonts.josefinSans(
                fontSize: 15
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EvaluationsPage())), 
              child: Text("Avaliações"),
            )
          ],
        ),
      ),
    );
  }
}