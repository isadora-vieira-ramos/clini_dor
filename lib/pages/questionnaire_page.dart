import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class QuestionnairePage extends StatelessWidget {

  const QuestionnairePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          "Novo Questionário",
          style: GoogleFonts.josefinSans(
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: const Center(child: Text('Questionário'))
    );
  }
}