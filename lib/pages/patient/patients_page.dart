import 'package:clini_dor/components/floating_button.dart';
import 'package:clini_dor/components/patient_tile.dart';
import 'package:clini_dor/models/patient.dart';
import 'package:clini_dor/pages/register_patient_page.dart';
import 'package:flutter/material.dart';

class PatientsPage extends StatefulWidget {
  
  const PatientsPage({super.key});
  @override
  State<PatientsPage> createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                Patient patient = Patient(name: 'Paciente de Exemplo', age: 22, sex: 'F', medicalRecord: 1);
                return PatientTile(patient: patient);
              },
            )
          ),
        ],
      )
    );
  }
}