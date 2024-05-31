import 'package:clini_dor/components/floating_button.dart';
import 'package:clini_dor/models/patient.dart';
import 'package:flutter/material.dart';

class EvaluationsPage extends StatelessWidget {
  EvaluationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingButton(),
      body: Container(
        child: Center(child: Text('Avaliações')),
      )
    );
  }
}