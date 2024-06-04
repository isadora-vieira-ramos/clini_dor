import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientEditPage extends StatelessWidget {
  const PatientEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          "Editar Paciente",
          style: GoogleFonts.josefinSans(
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ),
      body: const Center(
        child: Text('Edição'),
      ),
    );
  }
}