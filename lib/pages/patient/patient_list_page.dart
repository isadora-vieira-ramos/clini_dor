import 'package:clini_dor/components/floating_button.dart';
import 'package:clini_dor/components/loading_component.dart';
import 'package:clini_dor/components/no_items.dart';
import 'package:clini_dor/components/patient_tile.dart';
import 'package:clini_dor/models/patient.dart';
import 'package:clini_dor/models/patients.dart';
import 'package:clini_dor/pages/register_patient_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientListPage extends StatefulWidget {
  
  const PatientListPage({super.key});
  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  List<Patient> patients = [];

  Future<void> getPatients() async {
    patients = await Patients.getPatientsAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Patients>(
      builder: (context, value, child) =>Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingButton(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPatientPage()))),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pesquisar', 
                    style: TextStyle(color:Colors.black)
                  ),
                  Icon(Icons.search, color:Colors.black),
                ],
              ),
            ),
            FutureBuilder(
              future: getPatients(), 
              builder: (context, snapshot) {
                if(snapshot.connectionState != ConnectionState.done){
                  return const LoadingComponent();
                }
                else{
                  if(patients.isNotEmpty){
                    return Expanded(
                      child: ListView.builder(
                        itemCount: patients.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          Patient patient = patients[index];
                          return PatientTile(patient: patient);
                        },
                      )
                    );
                  }else{
                    return NoItemsMessagem(message: "Nenhum paciente cadastrado.");
                  }
                } 
                
              }
            ),
          ],
        )
      )
    );
  }
}