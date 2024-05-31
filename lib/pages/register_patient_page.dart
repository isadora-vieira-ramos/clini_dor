import 'package:flutter/material.dart';

class RegisterPatientPage extends StatelessWidget {
  const RegisterPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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