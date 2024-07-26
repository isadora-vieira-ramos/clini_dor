import 'package:clini_dor/models/question_type.dart';

class Question {
  final int id;
  final String questionText;
  final List<String> options;
  final QuestionType questionType;
  final String? questionImage;
  Question({required this.id, required this.questionText, required this.options, required this.questionType, this.questionImage});

  static List<Question> getQuestions() {
    List<Question> questionList = [];
    questionList.add(Question(id: questionList.length + 1, questionText: "1. Sua dor está presente há mais de três meses?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "2. Marque abaixo as condições relativas ao seu estado atual.", options: [
      "Alcoolismo",
      "AVC",
      "Tabagismo",
      "Hipertensão",
      "Infarto",
      "Diabetes controlada",
      "Diabetes descontrolada",
      "Doenças da tireoide",
      "Epilepsia",
      "Asma",
      "Doença renal",
      "Doença neurológica",
      "Depressão",
      "Ansiedade",
      "Bipolaridade",
    ], questionType: QuestionType.multipleChoice));
    questionList.add(Question(id: questionList.length + 1, questionText: "3. Utiliza benzodiazepínico?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "4. Utiliza anticonvulsivante?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "5. Utiliza anticoagulante?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "6. Utiliza corticoides?", options: ["Prednisona", "Dexametasona", "Triancinolona", "Flunisolida"], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "7. Utiliza antiinflamatórios (exceto corticóides)?", options: ["Ibuprofeno","Nimesulida", "Dipirona"], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "8. Utiliza opioides?", options: ["Metadona", "Tramadol", "Codeína", "Morfina", "Oxicodona"], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "9. Uitliza antidepressivos?", options: ["Clonazepam", "Fluoxetina", "Escitalopram"], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "10. Utiliza paracetamol?", options: [], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "11. Na última semana, os medicamentos utilizados diminuíram quantos % o nível da dor?", options: [""], questionType: QuestionType.open));
    questionList.add(Question(
      id: questionList.length + 1, 
      questionText: "12.1 Utilizando os círculos na cor cinza distribuídos na figura abaixo, indique as áreas com dor de maior e menor intensidade", 
      options: ["FRENTE"], 
      questionImage: 'lib/images/human-body-full-front.png',
      questionType: QuestionType.clickMap
    ));
    questionList.add(Question(
      id: questionList.length + 1,
      questionText: "12.2 Utilizando os círculos na cor cinza distribuídos na figura abaixo, indique as áreas com dor de maior e menor intensidade", 
      options: ["COSTAS"], 
      questionImage: 'lib/images/human-body-full-back.png',
      questionType: QuestionType.clickMap
    ));
    questionList.add(Question(id: questionList.length + 1, questionText: "14. Esta dor é contínua, intermitente ou contínua com crises de piora?", options: ["Dor contínua", "Dor intermitente", "Dor contínua com crises de piora"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "15. A sua dor é referida? (Ocorre em um determinado local, mas reflete em outro também)", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "16. Sua dor tem relação com algum envento como trauma medular, câncer, AVC, dor no membro fantasma?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "17. Tem câncer e está realizando tratamento para o mesmo?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "18. Sua dor teve início relacionado ao câncer?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "19. Possui dor articular?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "20. Sua dor se parece com uma sensação estranha e desagradável na pele? Agulhadas, choques elétricos, queimação, ardência e formigamento são as que melhor descrevem estas sensações?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "21. Na região que sentes dor ocorre mudança na cor da pele e/ou temperatura?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "22. A intensidade da dor piora desproporcionalmente ao toque leve?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "23. A sua dor piora ao caminhar ou ao movimentar o corpo?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "24. A dor que sente é em forma de cólica?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "25. De 0 a 10, informe o quanto a dor interfere no sono.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "26. De 0 a 10, avalie a qualidade do sono.", options: ["Ruim", "Boa"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "27. De 0 a 10, informe qual o nível de cansaço ao acordar (sono reparador).", options: ["Nenhum", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "28. De 0 a 10, informe o quanto a dor o faz se sentir triste ou deprimido.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "29. De 0 a 10, informe o quão frequentemente pensa que a dor não vai passar ou vai piorar.", options: ["Nunca", "Sempre"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "30. De 0 a 10, informe o quanto pensa em tirar sua vida por causa da dor.", options: ["Nunca", "Sempre"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "31. De 0 a 10, informe o quanto a dor interfere nas atividades laborais (trabalho e vida diária).", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "32. De 0 a 10, informe o quanto a dor interfere nas relações pessoais e vontade de viver.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "33. De 0 a 10, informe qual a expectativa de melhora com relação ao tratamento.", options: ["Nenhuma", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "34. De 0 a 10, informe o quanto teme que a dor piore ao realizar atividades físicas.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "35. De 0 a 10, informe o quanto a dor interfere na memória ou concentração.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "36. De 0 a 10, informe a intensidade da dor na última semana.", options: ["Ausência", "Máxima"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "37. De 0 a 10, informe a intensidade da dor no último mês.", options: ["Ausência", "Máxima"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "38. De 0 a 10, informe a intensidade da dor nos últimos três meses.", options: ["Ausência", "Máxima"], questionType: QuestionType.rating));
    return questionList;
  }

}