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

  @override
  Widget build(BuildContext context) {

    List<String> opcoes = ["Sim", "Não"];

    getValue(){
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
                      groupValue: getValue(), 
                      title: Text(opcoes[index]),
                      onChanged: (value){
                        List<String> registeredAnswer = [];
                        registeredAnswer.add(value.toString());
                        widget.registerAnswer(widget.question.id, registeredAnswer);
                        setState(() {
                          widget.currentAnswer = value.toString();
                        });
                      }
                    );
                  }
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if(getValue() == "Sim")...[
                      const Text(
                        "Informações sobre o medicamento",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 30),
                      StandardTextfield(
                        controller: new TextEditingController(), 
                        hintText: "Nome do medicamento", 
                        obscureText: false
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
                      const SizedBox(height: 30),
                      StandardTextfield(
                        controller: new TextEditingController(), 
                        hintText: "Frequência de uso na última semana", 
                        obscureText: false
                      ),
                      StandardTextfield(
                        controller: new TextEditingController(), 
                        hintText: "Frequência de uso nos últimos três meses", 
                        obscureText: false
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}