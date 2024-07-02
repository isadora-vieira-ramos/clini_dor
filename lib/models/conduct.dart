import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Conduct{
  int patientId;
  int questionnaireId;
  Conduct({required this.patientId, required this.questionnaireId});
  
  factory Conduct.fromJson(Map<String, dynamic> json){
    return Conduct(
      patientId: json["Prontuario"], 
      questionnaireId: json["Questionario"], 
    );
  }

  Map toJson() => {
    'questionario': questionnaireId,
    'resultado': "Resultado da conduta"
  };

  Future<bool> saveConduct() async{
    var url = "${dotenv.env["API_URL"]}?type=conducts";
    var patientBody = jsonEncode(toJson());
    final response = await http.post(Uri.parse(url), body: patientBody);
    if(response.statusCode == 302){
      return true;
    }else{
      return false;
    }
  }
}