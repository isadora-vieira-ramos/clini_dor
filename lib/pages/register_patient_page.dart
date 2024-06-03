import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RegisterPatientPage extends StatefulWidget {
  const RegisterPatientPage({super.key});

  @override
  State<RegisterPatientPage> createState() => _RegisterPatientPageState();
}

class _RegisterPatientPageState extends State<RegisterPatientPage> {

  final TextEditingController _controller = TextEditingController();

  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      locale: const Locale("pt", "BR"),
      lastDate: DateTime.now(),
      firstDate: DateTime(1920),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    _controller.text = DateFormat('dd-MM-yyyy').format(pickedDate);
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Novo Paciente',
              style: TextStyle(
                fontSize: 20
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border:OutlineInputBorder(),
                labelText: 'Nome'
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border:OutlineInputBorder(),
                labelText: 'Prontuário'
              ),
            ),
            TextField(
              controller: _controller,
              readOnly: true,
              decoration: const InputDecoration(
                border:OutlineInputBorder(),
                labelText: 'Data de nascimento'
              ),
              onTap: () => onTapFunction(context: context),
            )
          ],
        ),
      ),
    );
  }
}