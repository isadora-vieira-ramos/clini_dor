import 'package:clini_dor/components/standard_textfield.dart';
import 'package:clini_dor/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RegisterPatientPage extends StatefulWidget {
  const RegisterPatientPage({super.key});

  @override
  State<RegisterPatientPage> createState() => _RegisterPatientPageState();
}

class _RegisterPatientPageState extends State<RegisterPatientPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _medicalRecord = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  
  String dropdownValueSex = 'Masculino';
  String dropdownValueEducation = 'Fundamental incompleto';

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

  savePatient(){
    Patient patient = Patient(
      name: _nameController.text, 
      birthDate: DateTime.parse(_dateController.value.text.replaceAll("/", "")), 
      sex: dropdownValueSex == 'Masculino'? "M": "F", 
      contactNumber: _numberController.value.text, 
      occupation: _occupationController.value.text, 
      education: dropdownValueEducation, 
      weight: double.parse(_weightController.value.text), 
      height: int.parse(_heightController.value.text), 
      medicalRecord: int.parse(_medicalRecord.value.text)
    );
    Patient.savePatient(patient);
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
        child: Form(
          key: _formKey,
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
                  items: <String>['Masculino', 'Feminino']
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
                controller: _occupationController, 
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
                  value: dropdownValueEducation,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValueEducation = newValue!;
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
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.tertiary
                  ),
                ),
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    savePatient();
                  }
                }, 
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}