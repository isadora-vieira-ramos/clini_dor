import 'dart:convert';
import 'package:clini_dor/models/answer.dart';
import 'package:clini_dor/models/conduct.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;

class Questionnaire{  
  final int? questionnaireId;
  final int patientId;
  final DateTime date;
  String? conduct;
  List<Answer>? answers;
  Questionnaire({required this.patientId, required this.date, this.answers, this.questionnaireId});

  factory Questionnaire.fromJson(Map<String, dynamic> json){
    List<dynamic> answers = jsonDecode(json["Respostas"]);
    return Questionnaire(
      questionnaireId: json["Id"], 
      patientId: json["Prontuario"], 
      date: convertDate(json["Data"]),
      answers: answers.map((e) => Answer.fromJson(e)).toList()
    );
  }

  Map toJson() => {
    'data': dateTimeToString(date),
    'prontuario': patientId,
    'answers': jsonEncode(answers),
  };

  static convertDate(String date){
    String formatedDate = date.substring(0, 10).replaceAll("-", "");
    return DateTime.parse(formatedDate);
  }

  String dateTimeToString(DateTime date){
    return "${date.day}/${date.month < 10? "0${date.month}": date.month}/${date.year <10? "0${date.year}":date.year}";
  }

  static Future<List<Questionnaire>> getQuestionnairesAsync() async{
    var url = "${dotenv.env["API_URL"]}?type=getQuestionnaires";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Questionnaire.fromJson(data)).toList();
    }else{
      throw Exception ('Não foi possível retornar os dados');
    }
  }

  static Future<String> saveQuestionnairesInCsv(int medicalRecord) async {
    var allQuestionnaires = await Questionnaire.getQuestionnairesAsync();
    var patientsQuest = allQuestionnaires.where((item) => item.patientId == medicalRecord).toList();
    patientsQuest.sort((a,b) => a.date.compareTo(b.date));
    List<List<dynamic>> sheet = [["Id", "Prontuario", "Data", "Respostas"]];
    sheet.addAll(patientsQuest.map((e) => getList(e)).toList());
    return const ListToCsvConverter().convert(sheet);
  }

  static List<dynamic> getList(Questionnaire questionnaire){
    List<dynamic> questInfos = [];
    questInfos.add(questionnaire.questionnaireId);
    questInfos.add(questionnaire.patientId);
    questInfos.add(questionnaire.date);
    questInfos.add(questionnaire.answers!.map((e) => "{${e.id}:${e.pickedAnswers.join(",")}}").join(","));

    return questInfos;
  }

  Future<bool> saveQuestionnaire() async{
    var url = "${dotenv.env["API_URL"]}?type=saveQuestionnaire";
    var patientBody = jsonEncode(toJson());
    final response = await http.post(Uri.parse(url), body: patientBody);
    if(response.statusCode == 302){
      return true;
    }else{
      return false;
    }
  }

  Future<int> getPatientLastQuestionnaire() async{
    List<Questionnaire> allQuestionnaires = await Questionnaire.getQuestionnairesAsync();
    var filteredQuestionnaires = allQuestionnaires.where((element) => element.patientId == patientId).toList();
    filteredQuestionnaires.sort((a,b) => a.questionnaireId!.compareTo(b.questionnaireId!));
    return filteredQuestionnaires.last.questionnaireId!;
  }

  Future<void> generateConduct() async{
    getPatientLastQuestionnaire().then((value){
      Conduct conduct = Conduct(patientId: patientId, questionnaireId: value);
      conduct.saveConduct();
    });
    
  }

}