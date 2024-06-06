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
  String dropdownValueSex = 'Masculino';
  String dropdownValueStudy = 'Fundamental incompleto';

  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      locale: const Locale("pt", "BR"),
      lastDate: DateTime.now(),
      firstDate: DateTime(1920),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    _controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: 'Nome',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: 'Prontuário'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                controller: _controller,
                readOnly: true,
                decoration: const InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: 'Data de nascimento'
                ),
                onTap: () => onTapFunction(context: context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: 'Sexo'
                ),
                value: dropdownValueSex,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueSex = newValue!;
                  });
                },
                items: <String>['Masculino', 'Feminino', 'Intersex']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: 'Número de contato'
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: 'Profissão'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: 'Escolaridade'
                ),
                value: dropdownValueStudy,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueStudy = newValue!;
                  });
                },
                items: <String>['Fundamental incompleto', 'Fundamental completo', 'Médio incompleto', 'Médio completo', 'Superior incompleto', 'Superior completo']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: 'Peso (Kg)'
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: 'Altura (cm)'
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: 'IMC'
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.tertiary
                ),
              ),
              onPressed: (){}, 
              child: const Text(
                'Salvar',
                style: TextStyle(
                  color: Colors.white
                )
              )
            )
          ],
        ),
      ),
    );
  }
}