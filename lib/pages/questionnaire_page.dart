import 'package:clini_dor/models/question.dart';
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
    Question(questionText: "Pergunta 1", answers: ["Sim", "Não"], isMultipleChoice: false),
    Question(questionText: "Pergunta 2", answers: ["Sim", "Não"], isMultipleChoice: false)
  ];

  int _selectedIndex = 1;

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