import 'package:clini_dor/models/answer.dart';
import 'package:clini_dor/models/question.dart';
import 'package:clini_dor/models/question_type.dart';
import 'package:clini_dor/models/questionnaire.dart';
import 'package:clini_dor/pages/home_page.dart';
import 'package:clini_dor/pages/question/question_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class QuestionnairePage extends StatefulWidget {
  final int patientId;
  const QuestionnairePage({super.key, required this.patientId});
 
  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  List<Answer> answers = [];
  
  final List<Question> _questions = Question.getQuestions();

  int _selectedIndex = 0;

  void addAnswer(int id, List<String> pickedAnswer){
    var answer = answers.where((answers) => answers.id == id);
    if(answer.isEmpty){
      answers.add(Answer(id: id, pickedAnswers: pickedAnswer));
    }else{
      int idExistingAnswer = answers.indexWhere((element) => element.id == id);
      answers[idExistingAnswer].pickedAnswers = pickedAnswer;
    }
  }

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
        if(_questions[_selectedIndex].questionType == QuestionType.closed){
          bool questionAnswered = checkIfQuestionWasAnswered(_questions[_selectedIndex].id);
          if(questionAnswered){
            if(checkIfPainLessThanThreeMonths(_questions[_selectedIndex].id)){
              return;
            }
          }else{
            showSnackBar();
            return;
          }
        }
        _selectedIndex++;
      }
    });
  }

  showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "Pergunta obrigatória!",
        style: TextStyle(
          fontSize: 17
        ),
      ),
    ));
  } 

  bool checkIfQuestionWasAnswered(int id){
    var answer = answers.where((answers) => answers.id == id);
    if(answer.isEmpty){
      return false;
    }else{
      return true;
    }
  }

  bool checkIfPainLessThanThreeMonths(int id){
    if(id == 1){
      var answer = answers.where((answers) => answers.id == id).toList();
      if(answer[0].pickedAnswers[0] == "Não"){
        AlertDialog alert = AlertDialog(
          title: const Text("Atenção"),
          content: const Text(
            "Informar que a dor não persiste por pelo menos 3 meses indica que a dor não é crônica, portanto não há necessidade de "
            "continuar o questionário. Para mudar a resposta, clique em Cancelar; se quer sair do questionário, clique em OK.",
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
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
        return true;
      }
    }
    return false;
  }
  
  String getCurrentAnswer(){
    int currentQuestionId = _questions[_selectedIndex].id;
    var answer = answers.where((element) => element.id == currentQuestionId).toList();
    if(answer.isNotEmpty){
      return answer[0].pickedAnswers.join(',');
    }else{
      return '';
    }
  }

  void sendAnswers(){
    Questionnaire questionnaire = Questionnaire(patientId: widget.patientId, date: DateTime.now(), answers: answers);
    questionnaire.saveQuestionnaire().then((value){
      questionnaire.generateConduct();
    });

    AlertDialog alert = AlertDialog(
      title: Text(
        style: GoogleFonts.josefinSans(
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.black
          )
        ),
        "Mensagem"
      ),
      content: const Text("As respostas foram enviadas com sucesso!", 
        style: TextStyle(
          fontSize: 17
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(
          "Novo Questionário",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black
            )
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: QuestionPage(question: _questions[_selectedIndex], currentAnswer: getCurrentAnswer(), registerAnswer: addAnswer),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              onPressed: previousQuestion,
              child: const Icon(Icons.navigate_before),
            ),
            if(_selectedIndex < _questions.length - 1)
              FloatingActionButton(
                heroTag: "btn2",
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                onPressed: nextQuestion,
                child: const Icon(Icons.navigate_next)
              )
            else
              FloatingActionButton.extended(
                heroTag: "btn2",
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                onPressed: sendAnswers,
                label: const Text("Enviar"),
                icon: const Icon(Icons.send, color: Colors.black)
              )
          ],
        ),
      )
    );
  }
}