import 'package:clini_dor/components/floating_button.dart';
import 'package:clini_dor/components/questionnaire_tile.dart';
import 'package:clini_dor/models/evaluation.dart';
import 'package:clini_dor/models/patient.dart';
import 'package:clini_dor/pages/patient_edit_page.dart';
import 'package:clini_dor/pages/questionnaire_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientPage extends StatelessWidget {
  Patient patient;
  PatientPage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingButton(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestionnairePage()))),
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
        padding: const EdgeInsets.all(20),
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
                        fontSize: 20
                      ),
                    ),
                    Text(
                      'Prontuário ${patient.medicalRecord}',
                      style: GoogleFonts.josefinSans(
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  icon: const Icon(Icons.edit),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PatientEditPage())),
                  label: Text(
                    "Editar",
                    style: GoogleFonts.josefinSans(
                      fontSize: 20
                    )
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.tertiary
                ),
              ),
              onPressed: (){}, 
              icon: const Icon(Icons.download), 
              label: Text(
                "Exportar dados",
                style: GoogleFonts.josefinSans(
                  fontSize: 18
                ),
              )
            ),
            const SizedBox(height: 20),
            Text(
              'Questionários',
              style: GoogleFonts.josefinSans(
                fontSize: 20
              )
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  Evaluation evaluation = Evaluation(evaluationId: index, patientId: patient.medicalRecord, date: DateTime.now());
                  return QuestionnaireTile(evaluation: evaluation);
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}