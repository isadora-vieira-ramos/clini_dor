import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
      dropdownWorkStudy = widget.patient!.workStudy;
      dropdownValueEducation = widget.patient!.education;
    }

    _weightController.addListener(calculateIMC);
    _heightController.addListener(calculateIMC);
  }

  @override 
  void dispose() { 
    _weightController.removeListener(calculateIMC);
    _heightController.removeListener(calculateIMC);  
    super.dispose() ;
  }
  
  String dropdownValueSex = 'Masculino';
  String dropdownValueEducation = 'Fundamental incompleto';
  String dropdownWorkStudy = 'Não trabalho nem estudo';
  late DateTime chosenDate;
  bool loading = false;

  var maskFormatter = new MaskTextInputFormatter(
    mask: '+55 (###) #####-####', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );

  calculateIMC(){
    if( _heightController.value.text.isNotEmpty && _weightController.value.text.isNotEmpty){
      var heightInMeters = double.parse(_heightController.value.text) /100;
      var weight = double.parse(_weightController.value.text);
      var bmi = weight /(heightInMeters * heightInMeters);
      setState(() {
        _imcController.text = bmi.toStringAsFixed(2);
      });
    }
  }

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
      workStudy: dropdownWorkStudy,
      education: dropdownValueEducation, 
      weight: double.parse(_weightController.value.text), 
      height: int.parse(_heightController.value.text), 
      medicalRecord: int.parse(_medicalRecord.value.text)
    );
    setState(() {
      loading = true;
    });

    patient.editPatient().then((value) {
      setState(() {
        loading = false;
      });
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
      workStudy: dropdownWorkStudy,
      education: dropdownValueEducation, 
      weight: double.parse(_weightController.value.text), 
      height: int.parse(_heightController.value.text), 
      medicalRecord: int.parse(_medicalRecord.value.text)
    );
    
    setState(() {
      loading = true;
    });

    patient.savePatient().then((value){
      setState(() {
        loading = false;
      });
      String mensagem = "";
      if(value){
        AlertDialog alert = AlertDialog(
          title: Text(
            "Paciente salvo!",
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
        foregroundColor: Colors.black,
        title: Text(
          editingPatient? "Editar Paciente": "Novo Paciente",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black
            )
          ),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints(maxWidth: 600),
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
                formatter: maskFormatter,
                controller: _numberController, 
                hintText: 'Número de contato', 
                obscureText: false,
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
                    labelText: 'Trabalho/Estudo'
                  ),
                  value: dropdownWorkStudy,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownWorkStudy = newValue!;
                    });
                  },
                  items: <String>['Trabalho e Estudo', 'Trabalho', 'Estudo', 'Não trabalho nem estudo']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
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
                obscureText: false,
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
                child: loading? 
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
                : 
                const Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
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