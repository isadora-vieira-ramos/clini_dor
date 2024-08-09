import 'package:clini_dor/models/question_type.dart';

class Question {
  final int id;
  final String questionText;
  final List<String> options;
  final QuestionType questionType;
  final String? questionImage;
  final Map? dependantOnQuestions;
  Question({required this.id, required this.questionText, required this.options, required this.questionType, this.questionImage, this.dependantOnQuestions});

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
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Na última semana, os medicamentos usados diminuíram quantos % o nível da dor?", options: [""], questionType: QuestionType.open));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Com que frequência você toma bebidas alcoólicas?", 
    options: [
      "Nunca", 
      "Mensalmente ou menos", 
      "2 a 4 vezes por mês",
      "2 a 4 vezes por semana",
      "4 ou mais vezes por semana"
    ], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Nas ocasiões em que bebe, quantas doses você consome tipicamente ao beber?", 
    options: [
      "1 ou 2", 
      "3 ou 4", 
      "5 ou 6",
      "7, 8 ou 9",
      "10 ou mais"
    ], questionType: QuestionType.closed, dependantOnQuestions: {14: "Mensalmente ou menos,2 a 4 vezes por mês, 2 a 4 vezes por semana, 4 ou mais vezes por semana"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}.Com que frequência você toma 6 ou mais doses de uma vez?", 
    options: [
      "Nunca", 
      "Menos que uma vez ao mês", 
      "Mensalmente",
      "Semanalmente",
      "Todos ou quase todos os dias"
    ], questionType: QuestionType.closed, dependantOnQuestions: {14: "Mensalmente ou menos, 2 a 4 vezes por mês, 2 a 4 vezes por semana, 4 ou mais vezes por semana"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Realiza alguma das intervenções não farmacológicas?", options: [
      "Exercício físico",
      "Psicoterapia",
      "Auriculoterapia",
      "Massagem",
      "Estimulação magnética transcraniana",
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
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Qual a frequência da dor de cabeça nos últimos três meses?", 
    options: [
      "Mensalmente ou menos", 
      "Algumas vezes por mês", 
      "Semanalmente", 
      "Todos ou quase todos os dias"
    ], questionType: QuestionType.closed, dependantOnQuestions: {18: "front_center_forehead, front_left_jaw, front_right_jaw", 19: "back_head"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Percebe que vai ter dor de cabeça antes mesmo de começar (sinal prodrômico)?", 
    options: ["Sim", "Não"], questionType: QuestionType.closed, dependantOnQuestions: {18: "front_center_forehead, front_left_jaw, front_right_jaw", 19: "back_head"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Percebe algum tipo de alteração visual (flases, pontos brancos, visão embaçada)?", 
    options: ["Sim", "Não"], questionType: QuestionType.closed, dependantOnQuestions: {18: "front_center_forehead, front_left_jaw, front_right_jaw", 19: "back_head"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Quando tem dor de cabeça, com que frequência a dor é forte?", 
    options: ["Nunca", "Raramente", "Às vezes", "Frequentemente", "Sempre"], 
    questionType: QuestionType.closed, dependantOnQuestions: {18: "front_center_forehead, front_left_jaw, front_right_jaw", 19: "back_head"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Com que frequência as dores de cabeça limitam a capacidade de realizar suas atividades diárias habituais, incluindo cuidar da casa, trabalho, estudos ou atividades sociais?",
    options: [
      "Nunca", 
      "Raramente", 
      "Às vezes", 
      "Frequentemente", 
      "Sempre"
    ], questionType: QuestionType.closed, dependantOnQuestions: {18: "front_center_forehead, front_left_jaw, front_right_jaw", 19: "back_head"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Quando tem dor de cabeça, com que frequência gostaria de poder se deitar para descansar?",
    options: [
      "Nunca", 
      "Raramente", 
      "Às vezes", 
      "Frequentemente", 
      "Sempre"
    ], questionType: QuestionType.closed, dependantOnQuestions: {18: "front_center_forehead, front_left_jaw, front_right_jaw", 19: "back_head"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Durante as últimas quatro semanas, com que frequência se sentiu cansado (a) demais para trabalhar ou para realizar suas atividades diárias por causa de suas dores de cabeça?",
    options: [
      "Nunca", 
      "Raramente", 
      "Às vezes", 
      "Frequentemente", 
      "Sempre"
    ], questionType: QuestionType.closed, dependantOnQuestions: {18: "front_center_forehead, front_left_jaw, front_right_jaw", 19: "back_head"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Durante as últimas quatro semanas, com que frequência sentiu que não estava mais aguentando ou se sentiu irritado (a) por causa de suas dores de cabeça?",
    options: [
      "Nunca", 
      "Raramente", 
      "Às vezes", 
      "Frequentemente", 
      "Sempre"
    ], questionType: QuestionType.closed, dependantOnQuestions: {18: "front_center_forehead, front_left_jaw, front_right_jaw", 19: "back_head"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Durante as últimas quatro semanas, com que frequência as dores de cabeça limitaram sua capacidade de se concentrar em seu trabalho ou em suas atividades diárias?",
    options: [
      "Nunca", 
      "Raramente", 
      "Às vezes", 
      "Frequentemente", 
      "Sempre"
    ], questionType: QuestionType.closed, dependantOnQuestions: {18: "front_center_forehead, front_left_jaw, front_right_jaw", 19: "back_head"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Escolha a opção que melhor representa a evolução da sua dor.", 
    options: [
      "Dor constante, com pequenas flutuações", 
      "Dor constante, com crises de dor aguda", 
      "Crises de dor aguda sem dor nos intervalos",
      "Crises de dor aguda com dor nos intervalos"
    ], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. A sua dor é referida? (Ocorre em um determinado local, mas reflete em outro também)", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sua dor tem relação com algum envento como trauma medular, câncer, AVC, dor no membro fantasma?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Tem câncer e está realizando tratamento para o mesmo?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sua dor teve início relacionado ao câncer?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Possui dor articular?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. A dor piora ao repouso?", options: ["Sim", "Não"], questionType: QuestionType.closed, dependantOnQuestions: {34: "Sim"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Há rigidez nas articulações?", options: ["Sim", "Não"], questionType: QuestionType.closed, dependantOnQuestions: {34: "Sim"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. As articulações apresentam edema?", options: ["Sim", "Não"], questionType: QuestionType.closed, dependantOnQuestions: {34: "Sim"}));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sofre uma sensação de queimação (por ex. ardência) onde sente dor?", options:[
      "Nunca",
      "Insignificante",
      "Pouco",
      "Moderada",
      "Forte",
       "Muito forte"
    ], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Tem uma sensação de formigamento ou picada na área da dor?", options:[
      "Nunca",
      "Insignificante",
      "Pouco",
      "Moderada",
      "Forte",
       "Muito forte"
    ], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. O toque suave (roupa, cobertor, até vento) é doloroso nessa área?", options:[
      "Nunca",
      "Insignificante",
      "Pouco",
      "Moderada",
      "Forte",
       "Muito forte"
    ], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Tem crises repentinas de dor nessa área, como choques elétricos?", options:[
      "Nunca",
      "Insignificante",
      "Pouco",
      "Moderada",
      "Forte",
       "Muito forte"
    ], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. O frio ou calor (água de banho) nesta região é eventualmente doloroso?", options:[
      "Nunca",
      "Insignificante",
      "Pouco",
      "Moderada",
      "Forte",
       "Muito forte"
    ], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sofre uma sensação de dormência nas áreas que você marcou?", options:[
      "Nunca",
      "Insignificante",
      "Pouco",
      "Moderada",
      "Forte",
       "Muito forte"
    ], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Uma leve pressão nessa área causa dor?", options:[
      "Nunca",
      "Insignificante",
      "Pouco",
      "Moderada",
      "Forte",
       "Muito forte"
    ], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. A sua dor piora ao caminhar ou ao movimentar o corpo?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. A dor que sente é em forma de cólica?", options: ["Sim", "Não"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quanto a dor interfere no sono.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, avalie a qualidade do sono.", options: ["Ruim", "Boa"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe qual o nível de cansaço ao acordar (sono reparador).", options: ["Nenhum", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quanto a dor o faz se sentir triste ou deprimido.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Avalie a seguinte afirmação: \"Sinto que minha dor é terrível e nunca vai melhorar\"", options: ["Discordo totalmente", "Discordo parcialmente", "Concordo totalmente"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quanto pensa em tirar sua vida por causa da dor.", options: ["Nunca", "Sempre"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sente limitação para participar de atividades sociais ou de lazer?", options: ["Não", "Pouca limitação", "Muita limitação"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sente limitação para sair com amigos ou familiares?", options: ["Não", "Pouca limitação", "Muita limitação"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sente limitação para realizar tarefas domésticas como cozinhar e limpar?", options: ["Não", "Pouca limitação", "Muita limitação"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sente limitação para usar transporte para chegar aos lugares que deseja ir?", options: ["Não", "Pouca limitação", "Muita limitação"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sente limitação para ir para a escola ou alcançar seus objetivos educacionais?", options: ["Não", "Pouca limitação", "Muita limitação"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Sente limitação para trabalhar fora de casa para ganhar uma renda?", options: ["Não", "Pouca limitação", "Muita limitação"], questionType: QuestionType.closed));    
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe qual a expectativa de melhora com relação ao tratamento.", options: ["Nenhuma", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. Avalie a seguinte afirmação: \"Não é realmente seguro para uma pessoa com uma condição de dor como a minha ser fisicamente ativa.\"", options: ["Discordo totalmente", "Discordo parcialmente", "Concordo totalmente"], questionType: QuestionType.closed));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, informe o quanto a dor interfere na memória ou concentração.", options: ["Nada", "Muito"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, como avaliaria sua dor agora, nesse momento?", options: ["Ausência", "Máxima"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, qual foi a intensidade da dor mais forte que sentiu nas últimas 4 semanas?", options: ["Ausência", "Máxima"], questionType: QuestionType.rating));
    questionList.add(Question(id: questionList.length + 1, questionText: "${questionList.length + 1}. De 0 a 10, qual foi a intensidade média da dor nas últimas 4 semanas?", options: ["Ausência", "Máxima"], questionType: QuestionType.rating));
    return questionList;
  }

}