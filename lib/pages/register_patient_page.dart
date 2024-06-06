import 'package:clini_dor/components/standard_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RegisterPatientPage extends StatefulWidget {
  const RegisterPatientPage({super.key});

  @override
  State<RegisterPatientPage> createState() => _RegisterPatientPageState();
}

class _RegisterPatientPageState extends State<RegisterPatientPage> {

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _medicalRecord = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _imcController = TextEditingController();
  
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
    _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
  }

  void CalculateIMC(){
    var height = int.tryParse(_heightController.text);
    var weight = int.tryParse(_weightController.text);

    if(height != null && weight != null){
      _imcController.text = '10';
    }
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
            StandardTextfield(
              controller: _nameController,
              hintText: 'Nome', 
              obscureText: false
            ),
            StandardTextfield(
              controller: _medicalRecord, 
              hintText: 'Prontuário', 
              obscureText: false
            ),
            StandardTextfield(
              controller: _dateController, 
              hintText: 'Data de nascimento', 
              obscureText: false,
              onTap: () => onTapFunction(context: context),
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
            StandardTextfield(
              controller: _numberController, 
              hintText: 'Número de contato', 
              obscureText: false
            ),
            StandardTextfield(
              controller: _professionController, 
              hintText: 'Profissão', 
              obscureText: false
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
            StandardTextfield(
              controller: _weightController, 
              hintText: 'Peso (Kg)', 
              obscureText: false
            ),
            StandardTextfield(
              controller: _heightController, 
              hintText: 'Altura (cm)', 
              obscureText: false,
            ),
            StandardTextfield(
              controller: _imcController, 
              hintText: 'IMC', 
              obscureText: false,
              enabled: false,
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