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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor:  Theme.of(context).colorScheme.tertiary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
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
              itemCount: 2,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                Patient patient = Patient(name: 'Isadora Vieira Ramos', age: 22, sex: 'F', medicalRecord: 12345);
                return PatientTile(patient: patient);
              },
            )
          ),
        ],
      )
    );
  }
}