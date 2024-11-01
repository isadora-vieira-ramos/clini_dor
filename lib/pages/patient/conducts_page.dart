import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConductsPage extends StatelessWidget {
  const ConductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(
          "Condutas",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black
            )
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Condutas")
          ],
        ),
      )
    );
  }
}