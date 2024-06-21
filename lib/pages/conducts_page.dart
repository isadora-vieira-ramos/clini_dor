import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConductsPage extends StatelessWidget {

  ConductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          "Condutas",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white
            )
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: const Center(child: Text('Condutas'))
    );
  }
}