import 'package:clini_dor/models/question.dart';
import 'package:clini_dor/models/question_type.dart';
import 'package:clini_dor/pages/question_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class QuestionnairePage extends StatefulWidget {

  const QuestionnairePage({super.key});

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {

  final List<Question> _questions = [
    Question(questionText: "1. Sua dor está presente há mais de três meses?", answers: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(questionText: "2. Marque abaixo as condições relativas ao seu estado atual.", answers: [
      "Alcoolismo", 
      "Tabagismo",
      "Hipertensão",
      "Infarto",
      "Diabetes controlada",
      "Diabetes descontrolada",
      "Doenças da tireoide",
      "Epilepsia",
      "Asma",
      "Doença renal",
      "Depressão",
      "Ansiedade",
      "Bipolaridade",
      "Uso de antidepressivos"
    ], questionType: QuestionType.multipleChoice),
    Question(questionText: "3. Indique o medicamento utilizado e a frequência de uso da última semana. ", answers: [
      "Antiinflamatório", 
      "Paracetamol",
      "Dipirona",
      "Opioide"
      ], questionType: QuestionType.open),
    Question(questionText: "4. Numero de dias que usa analgésicos por semana.", answers: [""], questionType: QuestionType.open),
    Question(questionText: "5. Número de dias que usou corticóides no último mês para tratamento da dor.", answers: [""], questionType: QuestionType.open),
    Question(questionText: "6. Na última semana, os medicamentos utilizados diminuíram quantos % o nível da dor?", answers: [""], questionType: QuestionType.open),
    Question(questionText: "7. Utilizando os círculos na cor cinza distribuídos na figura abaixo, indique as áreas com dor de maior intensidade", answers: ["FRENTE", "COSTAS"], questionType: QuestionType.clickMap),
  ];

  int _selectedIndex = 0;

  void previousQuestion(){
    setState(() {
      if(_selectedIndex > 0){
        _selectedIndex--;
      }
    });
  }

  void nextQuestion(){
    setState(() {
      if(_selectedIndex < _questions.length - 1){
        _selectedIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          "Novo Questionário",
          style: GoogleFonts.josefinSans(
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: QuestionPage(question: _questions[_selectedIndex]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              onPressed: previousQuestion,
              child: Icon(Icons.navigate_before),
            ),
            FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              onPressed: nextQuestion,
              child: Icon(Icons.navigate_next),
            )
          ],
        ),
      )
    );
  }
}