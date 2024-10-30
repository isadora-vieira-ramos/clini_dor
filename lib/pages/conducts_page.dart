import 'package:clini_dor/models/question.dart';
import 'package:clini_dor/models/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConductsPage extends StatelessWidget {
  final Questionnaire questionnaire;
  const ConductsPage({super.key, required this.questionnaire});

  @override
  Widget build(BuildContext context) {

    var questions = Question.getQuestions();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(
          "Respostas",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black
            )
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: questionnaire.answers!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                String question = questions.where((element) => element.id == questionnaire.answers![index].id).first.questionText;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(question, style: const TextStyle(fontSize: 18)),
                      Text('Resposta: ${questionnaire.answers![index].pickedAnswers[0]}', textAlign: TextAlign.left, style: const TextStyle(fontSize: 15)),
                      const Padding(
                        padding: EdgeInsets.only(top:4.0, left:4, right: 4),
                        child: Divider(color: Colors.black),
                      ),
                    ],
                  ),
                );
              },
            )
          ),
        ],
      ),
      floatingActionButton: FilledButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.tertiary
          ),
        ),
        onPressed: (){}, 
        icon: const Icon(Icons.fact_check_outlined, color: Colors.black), 
        label: Text(
          "Condutas",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black
            )
          ),
        )
      ), 
    );
  }
}