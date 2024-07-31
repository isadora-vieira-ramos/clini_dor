import 'package:clini_dor/components/standard_textfield.dart';
import 'package:clini_dor/models/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineQuestion extends StatefulWidget {
  final Question question;
  final Function registerAnswer;
  String? currentAnswer;
  MedicineQuestion({super.key, required this.question, required this.registerAnswer,  this.currentAnswer});

  @override
  State<MedicineQuestion> createState() => _MedicineQuestionState();
}

class _MedicineQuestionState extends State<MedicineQuestion> {
  List<String> medicineInformation = [];

  @override
  void initState() {
    if(widget.currentAnswer!= null && widget.currentAnswer!.isNotEmpty && widget.currentAnswer != "Não"){
      var info = widget.currentAnswer!.split(",");
      info.forEach((element) => medicineInformation.add(element));
    }
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

    TextEditingController medicineName = TextEditingController(text: getMedicineValue("medicineName"));
    TextEditingController medicineWeekFrequency = TextEditingController(text: getMedicineValue("medicineWeekFrequency"));
    TextEditingController medicineMonthlyFrequency = TextEditingController(text: getMedicineValue("medicineMonthlyFrequency"));

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

    saveInfo(String value){
      int index = medicineInformation.indexWhere((element) => element.split(":")[0] == value.split(":")[0]);
      if(index == -1){
        medicineInformation.add(value);
      }else{
        var paintIntensity = value.split(":")[1];
        if(paintIntensity.isNotEmpty){
          medicineInformation[index] = value;
        }else{
          medicineInformation.removeAt(index);
        }
      }
      widget.registerAnswer(widget.question.id, medicineInformation);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Informações sobre o medicamento",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      if(widget.question.options.isNotEmpty)...[
                        const SizedBox(height: 30),
                        TextField(
                          controller: medicineName,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Nome do medicamento"
                          ),
                          onChanged:(value) => saveInfo("medicineName:$value"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Exemplos: ${widget.question.options.join(', ')}...",
                            style: const TextStyle(
                              fontSize: 12
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 30),
                      TextField(
                        controller: medicineWeekFrequency,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Frequência de uso última semana"
                        ),
                        onChanged:(value) => saveInfo("medicineWeekFrequency:$value"),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: medicineMonthlyFrequency,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Frequência de uso últimos 3 meses"
                        ),
                        onChanged:(value) => saveInfo("medicineMonthlyFrequency:$value"),
                      ),
                    ]
                  ),
                ),
              ],
            ],
          ),
        ),
      )
    );
  }
}