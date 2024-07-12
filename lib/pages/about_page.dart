import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Objetivo",
              style: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                  fontSize: 20
                )
              )
            ),
            const SizedBox(height: 15),
            Text(
              'Este aplicativo tem como objetivo auxiliar o diagnóstico e o direcionamento do tratamento de paciente de dores crônicas não oncológicas.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                  fontSize: 18   
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('lib/images/logo_hcpa.jpg', height: 50),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('lib/images/lab_dor_neuro_logo.png', height: 70),
            ),
          ],
        )
      ),
    );
  }
}