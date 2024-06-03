import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPatientPage extends StatelessWidget {
  const RegisterPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          "Novo Paciente",
          style: GoogleFonts.josefinSans(
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: const Column(
          children: [
            Text(
              'Novo Paciente',
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}