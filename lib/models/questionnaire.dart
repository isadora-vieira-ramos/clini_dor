import 'dart:convert';
import 'package:clini_dor/models/answer.dart';
import 'package:http/http.dart' as http;

class Questionnaire{  
  final int evaluationId;
  final int patientId;
  final DateTime date;
  String? conduct;
  List<Answer>? answers;
  Questionnaire({required this.evaluationId, required this.patientId, required this.date, this.answers});

  factory Questionnaire.fromJson(Map<String, dynamic> json){
    return Questionnaire(
      evaluationId: json["Id"], 
      patientId: json["Prontuario"], 
      date: ConvertDate(json["Data"])
    );
  }

  static ConvertDate(String date){
    String formatedDate = date.substring(0, 10).replaceAll("-", "");
    return DateTime.parse(formatedDate);
  }

  static Future<List<Questionnaire>> getQuestionnairesAsync() async{
    var url = "${const String.fromEnvironment("API_URL")}?type=questionnaire";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Questionnaire.fromJson(data)).toList();
    }else{
      throw Exception ('Não foi possível retornar os dados');
    }
  }

}