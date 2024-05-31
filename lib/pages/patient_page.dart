import 'package:clini_dor/components/questionnaire_tile.dart';
import 'package:clini_dor/models/patient.dart';
import 'package:clini_dor/pages/evaluations_page.dart';
import 'package:clini_dor/pages/questionnaire_page.dart';
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
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                  ],
                ),
                TextButton.icon(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                  label: const Text("Editar")
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Questionários',
              style: GoogleFonts.josefinSans(
                fontSize: 20
              )
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return QuestionnaireTile();
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}