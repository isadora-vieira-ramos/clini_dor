import 'package:clini_dor/components/floating_button.dart';
import 'package:clini_dor/components/medicine_tile.dart';
import 'package:clini_dor/components/standard_textfield.dart';
import 'package:clini_dor/models/medicine.dart';
import 'package:clini_dor/models/question.dart';
import 'package:clini_dor/utils/ColorUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineListQuestion extends StatefulWidget {
  final Question question;
  final Function registerAnswer;
  String? currentAnswer;
  MedicineListQuestion({super.key, required this.question, required this.registerAnswer,  this.currentAnswer});

  @override
  State<MedicineListQuestion> createState() => _MedicineQuestionState();
}

class _MedicineQuestionState extends State<MedicineListQuestion> {
  bool showTextFields = false;
  TextEditingController medicineName = TextEditingController();
  TextEditingController medicineWeekFrequency = TextEditingController();
  TextEditingController medicineMonthlyFrequency = TextEditingController();
  
  List<Medicine> medicineList = [
  ];

  void changeTextFieldValue(){
    setState(() {
      showTextFields = !showTextFields;
    });
  }

  void addMedicine(){
    var weekFrequency = int.parse(medicineWeekFrequency.text);
    var monthFrequency = int.parse(medicineMonthlyFrequency.text);
    setState(() {
      medicineList.add(Medicine(name: medicineName.text, weeklyFrequencyUse: weekFrequency, monthlyFrequencyUse: monthFrequency));
      showTextFields = !showTextFields;
    });
    medicineName.text = "";
    medicineWeekFrequency.text = "";
    medicineMonthlyFrequency.text = "";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    getMedicineValue(String key){
      if(widget.currentAnswer == "Não"){
        return "Não";
      }else{
        if(widget.currentAnswer != null && widget.currentAnswer!.isNotEmpty){
          List<String> medicineInformation = widget.currentAnswer!.split(",");
          var answer = medicineInformation.where((element) => element.contains(key));
          if(answer.isNotEmpty){
            var value = answer.toList()[0].split(":")[1];
            return value;
          }
        }else{
          return widget.currentAnswer;
        }
      }
    }

    List<String> opcoes = ["Sim", "Não"];

    getRadioListValue(){
      if(widget.currentAnswer == "Não"){
        return "Não";
      }else{
        if(widget.currentAnswer != null && widget.currentAnswer!.isNotEmpty){
          return "Sim";
        }else{
          return "";
        } 
      }
    }

    void deleteMedicine(int index){
      setState(() {
        medicineList.removeAt(index);
      });
      print("teste");
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  widget.question.questionText,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20
                  )
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 150, minHeight: 50),
                child: ListView.builder(
                  itemCount: opcoes.length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      value: opcoes[index].toString(), 
                      groupValue: getRadioListValue(), 
                      title: Text(opcoes[index]),
                      onChanged: (value){
                        if(value.toString() == "Não"){
                          List<String> registeredAnswer = [];
                          registeredAnswer.add(value.toString());
                          widget.registerAnswer(widget.question.id, registeredAnswer);
                        }
                        setState(() {
                          widget.currentAnswer = value.toString();
                        });
                      }
                    );
                  }
                )
              ),
              if(getRadioListValue() == "Sim")...[
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Lista de medicamentos do tipo utilizados",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold          
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(showTextFields == true? 8: 0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: medicineList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      Medicine medicine = Medicine(
                        name: medicineList[index].name, 
                        weeklyFrequencyUse: medicineList[index].weeklyFrequencyUse, 
                        monthlyFrequencyUse: medicineList[index].monthlyFrequencyUse
                      );
                      return MedicineTile(medicine:medicine, deleteItem: () => deleteMedicine(index));
                    }
                  ),
                ),
                if(showTextFields)...[
                  ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: medicineName,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Nome do medicamento"
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: medicineWeekFrequency,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Frequência de uso última semana"
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: medicineMonthlyFrequency,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Frequência de uso últimos 3 meses"
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorUtils.getMaterialColor(Theme.of(context).colorScheme.tertiary),
                        foregroundColor: Colors.black
                      ),
                      onPressed: showTextFields == true? addMedicine: changeTextFieldValue, 
                      child: showTextFields == true? const Icon(Icons.save): const Icon(Icons.add)
                    ),
                  ),
                )
              ]
            ]
          ),
        ),
      )
    );
  }
}