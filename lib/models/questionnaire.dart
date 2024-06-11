class Questionnaire{  //mudar o nome para Questionnaire?
  final int evaluationId;
  final int patientId;
  final DateTime date;
  String? conduct;
  Questionnaire({required this.evaluationId, required this.patientId, required this.date});
}