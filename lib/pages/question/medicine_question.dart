import 'package:clini_dor/models/question.dart';
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
  final TextEditingController _medicineNameController = TextEditingController();
  final TextEditingController _monthfrequencyController = TextEditingController();
  final TextEditingController _weekfrequencyController = TextEditingController();
  List<String> options = ["Sim", "Não"];

  @override
  Widget build(BuildContext context) {
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
              Column(
                children: <Widget>[
                  RadioListTile(
                    value: options[0].toString(), 
                    groupValue: widget.currentAnswer, 
                    title: Text(options[0]),
                    onChanged: (value){
                      List<String> registeredAnswer = [];
                      registeredAnswer.add(value.toString());
                      setState(() {
                        widget.currentAnswer = value.toString();
                      });
                    }
                  ),
                  RadioListTile(
                    value: options[1].toString(), 
                    groupValue: widget.currentAnswer, 
                    title: Text(options[1]),
                    onChanged: (value){
                      List<String> registeredAnswer = [];
                      registeredAnswer.add(value.toString());
                      widget.registerAnswer(widget.question.id, registeredAnswer);
                      setState(() {
                        widget.currentAnswer = value.toString();
                      });
                    }
                  ),
                ]
              ),
              if(widget.currentAnswer == "Sim")...[
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom:20),
                        child: Text(
                          "Informações sobre o medicamento",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,    
                          )
                        ),
                      ),
                      if(widget.question.options.isNotEmpty)...[
                        TextField(
                          controller: _medicineNameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Nome do medicamento"
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("Exemplos: ${widget.question.options.join(", ")}..."),
                        ),
                      ],
                      const SizedBox(height: 20),
                      TextField(
                        controller: _weekfrequencyController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Frequência de uso na última semana"
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _monthfrequencyController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Frequência de uso nos últimos três meses"
                        ),
                      )
                    ],
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