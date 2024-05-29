import 'package:clini_dor/components/floating_button.dart';
import 'package:clini_dor/components/patient_tile.dart';
import 'package:clini_dor/models/patient.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatefulWidget {
  
  const PatientPage({super.key});
  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingButton(),
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