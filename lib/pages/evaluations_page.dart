import 'package:clini_dor/components/floating_button.dart';
import 'package:clini_dor/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EvaluationsPage extends StatelessWidget {
  EvaluationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          "Avaliações",
          style: GoogleFonts.josefinSans(
            fontSize: 20,
            color: Colors.white
          ),
        )
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingButton(onTap: (){},),
      body: Container(
        child: Center(child: Text('Avaliações')),
      )
    );
  }
}