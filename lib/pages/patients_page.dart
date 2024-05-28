import 'package:flutter/material.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(child: Text('Pacientes')),
      )
    );;
  }
}