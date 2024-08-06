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
    if(_selectedIndex > 0){
      setState(() {
          _selectedIndex--;
      });
       while(_questions[_selectedIndex].dependantOnQuestions != null){
        if(!checkIndependentQuestionHasAnswer(_selectedIndex)){
          setState(() {
            _selectedIndex--;
          });
        }else{
          break;
        }
      }
    }
  }

  void nextQuestion(){
    
    if(_selectedIndex < _questions.length - 1){
      if(_questions[_selectedIndex].questionType == QuestionType.closed || _questions[_selectedIndex].questionType == QuestionType.medicine){
        bool questionAnswered = checkIfQuestionWasAnswered(_questions[_selectedIndex].id, _questions[_selectedIndex].questionType);
        if(questionAnswered){
          if(checkIfPainLessThanThreeMonths(_questions[_selectedIndex].id)){
            return;
          }
        }else{
          showSnackBar();
          return;
        }
      }
      setState(() {
        _selectedIndex++;
      });
    }
  }

  bool checkIndependentQuestionHasAnswer(int nextQuestionIndex){
    var currentQuestion = _questions[nextQuestionIndex];
    if(currentQuestion.dependantOnQuestions != null){
      bool questionAnswered = false;
      // se só tem um objeto no mapa, confere se a questão foi respondida
      if(currentQuestion.dependantOnQuestions!.length == 1){
        var independAnswer = answers.where((answers) => answers.id == currentQuestion.dependantOnQuestions!.keys.firstOrNull).toList();
        if(currentQuestion.dependantOnQuestions!.values.toString().contains(independAnswer[0].pickedAnswers[0])){
          return true;
        }else{
          return false;
        }
      }else{ 
         //se tem mais de um valor, verifica se pelo menos uma das questões foi respondida
        currentQuestion.dependantOnQuestions!.forEach((key, value) {
          var independAnswer = answers.where((answers) => answers.id == key).toList();
          if(independAnswer.isNotEmpty && value.toString().contains(independAnswer[0].pickedAnswers[0].split(":")[0].toString())){
            questionAnswered = true;
          }
        });
        return questionAnswered;
      }
    }else{
      return true;
    }
  }

  showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "Pergunta obrigatória!",
        style: TextStyle(
          fontSize: 20
        ),
      ),
    ));
  } 

  bool checkIfQuestionWasAnswered(int id, QuestionType questionType){
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

  Question getCurrentQuestion(){
    while(_questions[_selectedIndex].dependantOnQuestions != null){
      if(!checkIndependentQuestionHasAnswer(_selectedIndex)){
        setState(() {
          _selectedIndex++;
        });
      }else{
        break;
      }
    }
    return _questions[_selectedIndex];
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
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
      body: QuestionPage(question: getCurrentQuestion(), currentAnswer: getCurrentAnswer(), registerAnswer: addAnswer),
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