import 'package:clini_dor/models/question.dart';
import 'package:clini_dor/models/question_type.dart';
import 'package:clini_dor/models/questionnaire.dart';
import 'package:clini_dor/pages/patient/conducts_page.dart';
import 'package:clini_dor/pages/question/back_click_map_question.dart';
import 'package:clini_dor/pages/question/front_click_map_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionnaireAnswersPage extends StatefulWidget {
  final Questionnaire questionnaire;
  const QuestionnaireAnswersPage({super.key, required this.questionnaire});

  @override
  State<QuestionnaireAnswersPage> createState() => _QuestionnaireAnswersPageState();
}

class _QuestionnaireAnswersPageState extends State<QuestionnaireAnswersPage> {

  bool showClickMapAnteriorAnswer = false;
  bool showClickMapPosteriorAnswer = false;

  @override
  Widget build(BuildContext context) {

    var questions = Question.getQuestions();

    Text formatMedicineInfo(String text){
      if(text.isNotEmpty){
        List<String> medicine = text.split(" ");
        return  Text("Nome: ${medicine[1]}, frequência de uso semanal: ${medicine[3]}, frequência de uso nos últimos 3 meses: ${medicine[5]}");
      }else{
        return const Text("");
      }
    }

    Question getQuestionWithoutText(Question question){
      var currentQuestion = question;
      currentQuestion.questionText = "";
      return currentQuestion;
    }

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
              itemCount: widget.questionnaire.answers!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                Question question = questions.where((element) => element.id == widget.questionnaire.answers![index].id).first;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(question.questionText, style: const TextStyle(fontSize: 18)),
                      if(question.questionType == QuestionType.closed || question.questionType == QuestionType.open || question.questionType == QuestionType.rating)...{
                        Text('Resposta: ${widget.questionnaire.answers![index].pickedAnswers[0]}', textAlign: TextAlign.left, style: const TextStyle(fontSize: 15)),
                      }else if(question.questionType == QuestionType.clickMap)...{
                        const SizedBox(height: 10),
                        if(question == questions.where((element) => element.questionType == QuestionType.clickMap).first)...{
                          FilledButton.icon(
                            icon:  Icon(!showClickMapAnteriorAnswer? Icons.keyboard_arrow_down: Icons.keyboard_arrow_up, color: Colors.black),
                            label: Text(!showClickMapAnteriorAnswer? "Visão anterior": "Esconder Resposta", style: TextStyle(color: Colors.black)),
                            onPressed: (){
                              setState(() {
                                showClickMapAnteriorAnswer = !showClickMapAnteriorAnswer;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.tertiary
                              ),
                            ), 
                          ),
                          if(showClickMapAnteriorAnswer)...[
                            SizedBox(
                              width: 500,
                              height: 500,
                              child: FrontClickMapQuestion(question: getQuestionWithoutText(question), registerAnswer: (){}, currentAnswer: widget.questionnaire.answers![index].pickedAnswers[0])
                            )
                          ]  
                        }
                        else...{
                          FilledButton.icon(
                            icon:  Icon(!showClickMapPosteriorAnswer? Icons.keyboard_arrow_down: Icons.keyboard_arrow_up, color: Colors.black),
                            label: Text(!showClickMapPosteriorAnswer? "Visão posterior": "Esconder Resposta", style: TextStyle(color: Colors.black)),
                            onPressed: (){
                              setState(() {
                                showClickMapPosteriorAnswer = !showClickMapPosteriorAnswer;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.tertiary
                              ),
                            ), 
                          ),
                          if(showClickMapPosteriorAnswer)...[
                            SizedBox(
                              width: 500,
                              height: 500,
                              child: BackClickMapQuestion(question: getQuestionWithoutText(question), registerAnswer: (){}, currentAnswer: widget.questionnaire.answers![index].pickedAnswers[0])
                            )
                          ]  
                        }
                      }else if(question.questionType == QuestionType.multipleChoice)...{
                        const Text("Respostas: "),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, 
                          children: widget.questionnaire.answers![index].pickedAnswers.map((e) => Text(e)).toList()
                        )
                      }else...{
                        if(widget.questionnaire.answers![index].pickedAnswers[0] == "Não")...{
                          const Text("Resposta: Não")
                        }else...{
                          const Text("Respostas: "),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start, 
                            children: widget.questionnaire.answers![index].pickedAnswers
                              .join("")
                              .split("}")
                              .map((e) => formatMedicineInfo(e)).toList()
                          )
                        }

                      },
                      const Padding(
                        padding: EdgeInsets.only(top:4.0, left:4, right: 4),
                        child: Divider(color: Colors.black),
                      )
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
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ConductsPage())), 
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