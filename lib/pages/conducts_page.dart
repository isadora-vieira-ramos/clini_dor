import 'package:clini_dor/models/patient.dart';
import 'package:flutter/material.dart';

class ConductsPage extends StatelessWidget {

  Patient patient;
  ConductsPage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(child: Text('Condutas')),
      )
    );;
  }
}