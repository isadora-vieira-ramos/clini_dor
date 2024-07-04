import 'package:clini_dor/components/standard_textfield.dart';
import 'package:clini_dor/models/patient.dart';
import 'package:clini_dor/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RegisterOrEditPatientPage extends StatefulWidget {
  Patient? patient;
  RegisterOrEditPatientPage({super.key, this.patient});

  @override
  State<RegisterOrEditPatientPage> createState() => _RegisterOrEditPatientPageState();
}

class _RegisterOrEditPatientPageState extends State<RegisterOrEditPatientPage> {

  bool editingPatient = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _medicalRecord = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _imcController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.patient != null){
      editingPatient = true;
      _dateController.text = DateFormat('dd/MM/yyyy').format(widget.patient!.birthDate);
      chosenDate = widget.patient!.birthDate;
      _nameController.text = widget.patient!.name.toString();
      _medicalRecord.text = widget.patient!.medicalRecord.toString();
      _numberController.text = widget.patient!.contactNumber.toString();
      _occupationController.text = widget.patient!.occupation.toString();
      _weightController.text = widget.patient!.weight.toString();
      _heightController.text = widget.patient!.height.toString();
      _imcController.text = widget.patient!.bmi.toString();
      dropdownValueSex = widget.patient!.sex == "M"? "Masculino": "Feminino";
      dropdownValueEducation = widget.patient!.education;
    }
  }
  
  String dropdownValueSex = 'Masculino';
  String dropdownValueEducation = 'Fundamental incompleto';
  late DateTime chosenDate;

  showDateTextField({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      locale: const Locale("pt", "BR"),
      lastDate: DateTime.now(),
      firstDate: DateTime(1920),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    chosenDate = pickedDate;
  }

  editPatient(){
    Patient patient = Patient(
      patientId: widget.patient!.patientId,
      name: _nameController.text, 
      birthDate: chosenDate, 
      sex: dropdownValueSex == 'Masculino'? "M": "F", 
      contactNumber: _numberController.value.text, 
      occupation: _occupationController.value.text, 
      education: dropdownValueEducation, 
      weight: double.parse(_weightController.value.text), 
      height: int.parse(_heightController.value.text), 
      medicalRecord: int.parse(_medicalRecord.value.text)
    );

    patient.editPatient().then((value) {
      if(value){
        AlertDialog alert = AlertDialog(
          title: Text(
            "Dados alterados com sucesso!",
            style: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                fontSize: 17,
              )
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
            )
          ],
        );
        showDialog(
          context: context, 
          builder: (BuildContext context){
            return alert;
          }
        );
      }else{
        AlertDialog alert = AlertDialog(
          content: const Text("Erro ao tentar alterar os dados do paciente"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
        showDialog(
          context: context, 
          builder: (BuildContext context){
            return alert;
          }
        );
      }
    });
  }

  savePatient(){
    Patient patient = Patient(
      name: _nameController.text, 
      birthDate: chosenDate, 
      sex: dropdownValueSex == 'Masculino'? "M": "F", 
      contactNumber: _numberController.value.text, 
      occupation: _occupationController.value.text, 
      education: dropdownValueEducation, 
      weight: double.parse(_weightController.value.text), 
      height: int.parse(_heightController.value.text), 
      medicalRecord: int.parse(_medicalRecord.value.text)
    );

    patient.savePatient().then((value){
      String mensagem = "";
      if(value){
        mensagem = "Paciente salvo!";
        AlertDialog alert = AlertDialog(
          title: Text(mensagem),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
            )
          ],
        );
        showDialog(
          context: context, 
          builder: (BuildContext context){
            return alert;
          }
        );
      }else{
        mensagem = "Erro ao salvar paciente. Tente novamente ou entre em contato com o suporte.";
        AlertDialog alert = AlertDialog(
          content: Text(mensagem),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
        showDialog(
          context: context, 
          builder: (BuildContext context){
            return alert;
          }
        );
      }
    });
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
          editingPatient? "Editar Paciente": "Novo Paciente",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white
            )
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
              if(editingPatient)...[
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Nome",
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        fontSize: 18,
                      )
                    ),
                  ),
                )
              ], 
              StandardTextfield(
                controller: _nameController,
                hintText: 'Nome', 
                obscureText: false
              ),
              if(editingPatient)...[
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    "Prontuário",
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        fontSize: 18,
                      )
                    ),
                  ),
                )
              ],
              StandardTextfield(
                controller: _medicalRecord, 
                hintText: 'Prontuário', 
                obscureText: false
              ),
              if(editingPatient)...[
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    "Data de nascimento",
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        fontSize: 18,
                      )
                    ),
                  ),
                )
              ],
              StandardTextfield(
                controller: _dateController, 
                hintText: 'Data de nascimento', 
                obscureText: false,
                onTap: () => showDateTextField(context: context),
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
              if(editingPatient)...[
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    "Número de contato",
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        fontSize: 18,
                      )
                    ),
                  ),
                )
              ],
              StandardTextfield(
                controller: _numberController, 
                hintText: 'Número de contato', 
                obscureText: false
              ),
              if(editingPatient)...[
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    "Profissão",
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        fontSize: 18,
                      )
                    ),
                  ),
                )
              ],
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
              if(editingPatient)...[
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    "Peso (Kg)",
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        fontSize: 18,
                      )
                    ),
                  ),
                )
              ],
              StandardTextfield(
                controller: _weightController, 
                hintText: 'Peso (Kg)', 
                obscureText: false
              ),
              if(editingPatient)...[
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    "Altura (cm)",
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        fontSize: 18,
                      )
                    ),
                  ),
                )
              ],
              StandardTextfield(
                controller: _heightController, 
                hintText: 'Altura (cm)', 
                obscureText: false,
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text(
                  "IMC calculado",
                  style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                      fontSize: 18,
                    )
                  ),
                ),
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
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    if(editingPatient) {
                      editPatient();
                    } else {
                      savePatient();
                    }
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