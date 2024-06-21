import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          'Este aplicativo tem como objetivo auxiliar o diagnóstico e o direcionamento do tratamento de paciente de dores crônicas não oncológicas. Desenvolvimento do aplicativo por Isadora Ramos.',
          textAlign: TextAlign.justify,
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 20   
            )
          )
        )
      ),
    );
  }
}