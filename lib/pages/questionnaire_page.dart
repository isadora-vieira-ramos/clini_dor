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

  final List<Question> _questions = [
    Question(id: 1, questionText: "1. Sua dor está presente há mais de três meses?", options: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(id:2, questionText: "2. Marque abaixo as condições relativas ao seu estado atual.", options: [
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
    Question(id: 3, questionText: "3. Numero de dias que usou antiinflamatórios por semana.", options: [""], questionType: QuestionType.open),
    Question(id: 4, questionText: "4. Numero de dias que usou paracetamol por semana.", options: [""], questionType: QuestionType.open),
    Question(id: 5, questionText: "5. Numero de dias que usou dipirona por semana.", options: [""], questionType: QuestionType.open),
    Question(id: 6, questionText: "6. Numero de dias que usou opioides por semana.", options: [""], questionType: QuestionType.open),
    Question(id: 7, questionText: "7. Numero de dias que usa analgésicos por semana.", options: [""], questionType: QuestionType.open),
    Question(id: 8, questionText: "8. Número de dias que usou corticóides no último mês para tratamento da dor.", options: [""], questionType: QuestionType.open),
    Question(id: 9, questionText: "9. Na última semana, os medicamentos utilizados diminuíram quantos % o nível da dor?", options: [""], questionType: QuestionType.open),
    Question(
      id: 10, 
      questionText: "10.1 Utilizando os círculos na cor cinza distribuídos na figura abaixo, indique as áreas com dor de maior e menor intensidade", 
      options: ["FRENTE"], 
      questionImage: 'lib/images/human-body-full-front.png',
      questionType: QuestionType.clickMap
    ),
    Question(
      id: 11,
      questionText: "10.2 Utilizando os círculos na cor cinza distribuídos na figura abaixo, indique as áreas com dor de maior e menor intensidade", 
      options: ["COSTAS"], 
      questionImage: 'lib/images/human-body-full-back.png',
      questionType: QuestionType.clickMap
    ),
    Question(id: 12, questionText: "11. Esta dor é contínua, intermitente ou contínua com crises de piora?", options: ["Dor contínua", "Dor intermitente", "Dor contínua com crises de piora"], questionType: QuestionType.closed),
    Question(id: 13, questionText: "12. A sua dor é referida? (Ocorre em um determinado local, mas reflete em outro também)", options: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(id: 14, questionText: "13. Sua dor tem relação com algum envento como trauma medular, câncer, AVC, dor no membro fantasma?", options: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(id: 15, questionText: "14. Tem câncer e está realizando tratamento para o mesmo?", options: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(id: 16, questionText: "15. Sua dor teve início relacionado ao câncer?", options: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(id: 17, questionText: "16. Possui dor articular?", options: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(id: 18, questionText: "17. Sua dor se parece com uma sensação estranha e desagradável na pele? Agulhadas, choques elétricos, queimação, ardência e formigamento são as que melhor descrevem estas sensações?", options: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(id: 19, questionText: "18. Na região que sentes dor ocorre mudança na cor da pele e/ou temperatura?", options: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(id: 20, questionText: "19. A intensidade da dor piora desproporcionalmente ao toque leve?", options: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(id: 21, questionText: "20. A sua dor piora ao caminhar ou ao movimentar o corpo?", options: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(id: 22, questionText: "21. A dor que sente é em forma de cólica?", options: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(id: 23, questionText: "22. Na escala abaixo, informe o quanto sua dor interfere no seu sono.", options: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(id: 24, questionText: "23. Na escala abaixo, avalie a qualidade do seu sono.", options: ["Ruim", "Boa"], questionType: QuestionType.rating),
    Question(id: 25, questionText: "24. Na escala abaixo, informe qual o seu nível de cansaço ao acordar (sono reparador).", options: ["Nenhum", "Muito"], questionType: QuestionType.rating),
    Question(id: 26, questionText: "25. Na escala abaixo, informe o quanto sua dor faz você se sentir triste ou deprimido.", options: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(id: 27, questionText: "26. Na escala abaixo, informe o quão frequentemente você pensa que a sua dor não vai passar ou vai piorar.", options: ["Nunca", "Sempre"], questionType: QuestionType.rating),
    Question(id: 28, questionText: "27. Na escala abaixo, informe o quanto você pensa em tirar sua vida por causa da dor.", options: ["Nunca", "Sempre"], questionType: QuestionType.rating),
    Question(id: 29, questionText: "28. Na escala abaixo, informe o quanto a sua dor interfere nas suas atividades laborais (trabalho e vida diária).", options: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(id: 30, questionText: "29. Na escala abaixo, informe o quanto a sua dor interfere nas suas relações pessoais e sua vontade de viver.", options: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(id: 31, questionText: "30. Na escala abaixo, informe qual a sua expectativa de melhora com relação ao tratamento.", options: ["Nenhuma", "Muito"], questionType: QuestionType.rating),
    Question(id: 32, questionText: "31. Na escala abaixo, informe o quanto você teme que a sua dor piore ao realizar atividades físicas.", options: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(id: 33, questionText: "32. Na escala abaixo, informe o quanto a sua dor interfere na sua memória ou concentração.", options: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(id: 34, questionText: "33. Na escala abaixo, informe a intensidade da sua dor.", options: ["Ausência", "Máxima"], questionType: QuestionType.rating),
  ];

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
            return;
          }
        }
        _selectedIndex++;
      }
    });
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
        foregroundColor: Colors.white,
        title: Text(
          "Novo Questionário",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white
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