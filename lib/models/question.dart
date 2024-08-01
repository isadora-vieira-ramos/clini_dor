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
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. A dor está presente há mais de três meses?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Marque abaixo as condições relativas ao estado atual.", options: [
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
      "Artrite reumatóide",
      "Lúpus",
      "Doença renal",
      "Doença neurológica",
      "Depressão",
      "Ansiedade",
      "Bipolaridade",
    ], questionType: QuestionType.multipleChoice));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Utiliza benzodiazepínico?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Utiliza anticonvulsivante?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Utiliza anticoagulante?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Utiliza corticoides?", options: ["Prednisona", "Dexametasona", "Triancinolona", "Flunisolida"], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Utiliza antiinflamatórios (exceto corticóides)?", options: ["Ibuprofeno","Nimesulida"], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Utiliza opioides?", options: ["Metadona", "Tramadol", "Codeína", "Morfina", "Oxicodona"], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Utiliza antidepressivos?", options: ["Clonazepam", "Fluoxetina", "Escitalopram"], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Utiliza paracetamol?", options: [], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Utiliza dipirona?", options: [], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Utiliza relaxantes musculares?", options: ["Carisoprodol (Mioflex, Torsilax, Tandrilax)", "Ciclobenzaprina (Miosan)", "Orfenadrina (Dorflex, Dorilax)"], questionType: QuestionType.medicine));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Na última semana, os medicamentos utilizados diminuíram quantos % o nível da dor?", options: [""], questionType: QuestionType.open));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Realiza alguma das intervenções não farmacológicas?", options: [
      "Exercício físico",
      "Psicoterapia",
      "Auriculoterapia",
      "Massagem",
      "Estimulação transcraniana",
      "Aplicação de calor ou frio",
      "Acupuntura",
      "Meditação"
    ], questionType: QuestionType.multipleChoice));
    questionList.add(Question(
      id: questionList.length + 1, 
      questionText: "${questionList.length + 1}.1 Utilizando os círculos na cor cinza distribuídos na figura abaixo, indique as áreas com dor de maior e menor intensidade", 
      options: ["ANTERIOR"], 
      questionImage: 'lib/images/human-body-full-front.png',
      questionType: QuestionType.clickMap
    ));
    questionList.add(Question(
      id: questionList.length + 1,
      questionText: "${questionList.length}.2 Utilizando os círculos na cor cinza distribuídos na figura abaixo, indique as áreas com dor de maior e menor intensidade", 
      options: ["POSTERIOR"], 
      questionImage: 'lib/images/human-body-full-back.png',
      questionType: QuestionType.clickMap
    ));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Esta dor é contínua, intermitente ou contínua com crises de piora?", options: ["Dor contínua", "Dor intermitente", "Dor contínua com crises de piora"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. A sua dor é referida? (Ocorre em um determinado local, mas reflete em outro também)", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sua dor tem relação com algum envento como trauma medular, câncer, AVC, dor no membro fantasma?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Tem câncer e está realizando tratamento para o mesmo?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sua dor teve início relacionado ao câncer?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Possui dor articular?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sua dor se parece com uma sensação estranha e desagradável na pele? Agulhadas, choques elétricos, queimação, ardência e formigamento são as que melhor descrevem estas sensações?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Na região que sentes dor ocorre mudança na cor da pele e/ou temperatura?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. A intensidade da dor piora desproporcionalmente ao toque leve, com vento ou contato com roupa?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. A sua dor piora ao caminhar ou ao movimentar o corpo?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. A dor que sente é em forma de cólica?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quanto a dor interfere no sono.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, avalie a qualidade do sono.", options: ["Ruim", "Boa"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe qual o nível de cansaço ao acordar (sono reparador).", options: ["Nenhum", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quanto a dor o faz se sentir triste ou deprimido.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quão frequentemente pensa que a dor não vai passar ou vai piorar.", options: ["Nunca", "Sempre"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quanto pensa em tirar sua vida por causa da dor.", options: ["Nunca", "Sempre"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quanto a dor interfere nas atividades laborais (trabalho e vida diária).", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quanto a dor interfere nas relações pessoais e vontade de viver.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe qual a expectativa de melhora com relação ao tratamento.", options: ["Nenhuma", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quanto teme que a dor piore ao realizar atividades físicas.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quanto a dor interfere na memória ou concentração.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe a intensidade da dor na última semana.", options: ["Ausência", "Máxima"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe a intensidade da dor no último mês.", options: ["Ausência", "Máxima"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe a intensidade da dor nos últimos três meses.", options: ["Ausência", "Máxima"], questionType: QuestionType.rating));
    return questionList;
  }

}