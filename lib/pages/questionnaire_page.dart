import 'package:clini_dor/models/question.dart';
import 'package:clini_dor/models/question_type.dart';
import 'package:clini_dor/pages/question/question_page.dart';
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
    Question(
      questionText: "7.1 Utilizando os círculos na cor cinza distribuídos na figura abaixo, indique as áreas com dor de maior intensidade", 
      answers: ["FRENTE"], 
      questionImage: 'lib/images/human-body-full-front.png',
      questionType: QuestionType.clickMap
    ),
    Question(
      questionText: "7.2 Utilizando os círculos na cor cinza distribuídos na figura abaixo, indique as áreas com dor de maior intensidade", 
      answers: ["COSTAS"], 
      questionImage: 'lib/images/human-body-full-back.png',
      questionType: QuestionType.clickMap
    ),
    Question(questionText: "8. Esta dor é contínua, intermitente ou contínua com crises de piora?", answers: ["Dor contínua", "Dor intermitente", "Dor contínua com crises de piora"], questionType: QuestionType.closed),
    Question(questionText: "9. A sua dor é referida? (Ocorre em um determinado local, mas reflete em outro também)", answers: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(questionText: "10. Sua dor tem relação com algum envento como trauma medular, câncer, AVC, dor no membro fantasma?", answers: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(questionText: "11. Tem câncer e está realizando tratamento para o mesmo?", answers: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(questionText: "12. Sua dor teve início relacionado ao câncer?", answers: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(questionText: "13. Possui dor articular?", answers: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(questionText: "14. Sua dor se parece com uma sensação estranha e desagradável na pele? Agulhadas, choques elétricos, queimação, ardência e formigamento são as que melhor descrevem estas sensações?", answers: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(questionText: "15. Na região que sentes dor ocorre mudança na cor da pele e/ou temperatura?", answers: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(questionText: "16. A intensidade da dor piora desproporcionalmente ao toque leve?", answers: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(questionText: "17. A sua dor piora ao caminhar ou ao movimentar o corpo?", answers: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(questionText: "18. A dor que sente é em forma de cólica?", answers: ["Sim", "Não"], questionType: QuestionType.closed),
    Question(questionText: "19. Na escala abaixo, informe o quanto sua dor interfere no seu sono.", answers: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(questionText: "20. Na escala abaixo, avalie a qualidade do seu sono.", answers: ["Ruim", "Boa"], questionType: QuestionType.rating),
    Question(questionText: "21. Na escala abaixo, informe qual o seu nível de cansaço ao acordar (sono reparador).", answers: ["Nenhum", "Muito"], questionType: QuestionType.rating),
    Question(questionText: "22. Na escala abaixo, informe o quanto sua dor faz você se sentir triste ou deprimido.", answers: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(questionText: "23. Na escala abaixo, informe o quão frequentemente você pensa que a sua dor não vai passar ou vai piorar.", answers: ["Nunca", "Sempre"], questionType: QuestionType.rating),
    Question(questionText: "24. Na escala abaixo, informe o quanto você pensa em tirar sua vida por causa da dor.", answers: ["Nunca", "Sempre"], questionType: QuestionType.rating),
    Question(questionText: "25. Na escala abaixo, informe o quanto a sua dor interfere nas suas atividades laborais (trabalho e vida diária).", answers: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(questionText: "26. Na escala abaixo, informe o quanto a sua dor interfere nas suas relações pessoais e sua vontade de viver.", answers: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(questionText: "27. Na escala abaixo, informe qual a sua expectativa de melhora com relação ao tratamento.", answers: ["Nenhuma", "Muito"], questionType: QuestionType.rating),
    Question(questionText: "28. Na escala abaixo, informe o quanto você teme que a sua dor piore ao realizar atividades físicas.", answers: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(questionText: "29. Na escala abaixo, informe o quanto a sua dor interfere na sua memória ou concentração.", answers: ["Nada", "Muito"], questionType: QuestionType.rating),
    Question(questionText: "30. Na escala abaixo, informe a intensidade da sua dor.", answers: ["Ausência", "Máxima"], questionType: QuestionType.rating),
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
          children: [
            FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              onPressed: previousQuestion,
              child: Icon(Icons.navigate_before),
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
                onPressed: nextQuestion,
                label: const Text("Enviar"),
                icon: const Icon(Icons.send, color: Colors.black)
              )
          ],
        ),
      )
    );
  }
}