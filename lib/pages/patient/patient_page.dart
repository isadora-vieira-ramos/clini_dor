import 'package:clini_dor/components/floating_button.dart';
import 'package:clini_dor/components/loading_component.dart';
import 'package:clini_dor/components/no_items.dart';
import 'package:clini_dor/components/questionnaire_tile.dart';
import 'package:clini_dor/models/questionnaire.dart';
import 'package:clini_dor/models/patient.dart';
import 'package:clini_dor/pages/patient/register_or_edit_patient_page.dart';
import 'package:clini_dor/pages/questionnaire_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientPage extends StatefulWidget {
  Patient patient;
  PatientPage({super.key, required this.patient});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  List<Questionnaire> questionnaires = [];

  Future<void> getQuestionnaires() async {
    var allQuestionnaires = await Questionnaire.getQuestionnairesAsync();
    questionnaires = allQuestionnaires.where((item) => item.patientId == widget.patient.medicalRecord).toList();
    questionnaires.sort((a,b) => a.date.compareTo(b.date));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingButton(
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => QuestionnairePage(
            patientId: widget.patient.medicalRecord
          )
        ))
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          "Paciente",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white
            )
          )
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
                      widget.patient.name,
                      style: GoogleFonts.josefinSans(
                        textStyle: const TextStyle(
                          fontSize: 20
                        )
                      )
                    ),
                    Text(
                      'Prontuário ${widget.patient.medicalRecord}',
                      style: GoogleFonts.josefinSans(
                        textStyle: const TextStyle(
                          fontSize: 20
                        )
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  icon: const Icon(Icons.edit),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterOrEditPatientPage(patient: widget.patient))),
                  label: Text(
                    "Editar",
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        fontSize: 20
                      )
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
                  textStyle: const TextStyle(
                    fontSize: 18
                  )
                ),
              )
            ),
            const SizedBox(height: 20),
            Text(
              'Questionários',
              style: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                  fontSize: 20
                )
              )
            ),
            FutureBuilder(
              future: getQuestionnaires(), 
              builder: (context, snapshot) {
                if(snapshot.connectionState != ConnectionState.done){
                  return const LoadingComponent();
                } 
                else{
                  if(questionnaires.isNotEmpty){
                    return Expanded(
                      child: ListView.builder(
                        itemCount: questionnaires.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          Questionnaire questionnaire = questionnaires[index];
                          return QuestionnaireTile(questionnaire: questionnaire, indexInList: index);
                        },
                      )
                    );
                  }
                  return NoItemsMessagem(message: "Este paciente ainda não tem nenhum questionário.");
                }         
              }
            ),
          ],
        ),
      ),
    );
  }
}