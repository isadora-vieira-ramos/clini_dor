import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Patient{
  final String name;
  final int age;
  final String sex;
  final int medicalRecord; 
  
  Patient({required this.name, required this.age, required this.sex, required this.medicalRecord});

  factory Patient.fromJson(Map<String, dynamic> json){
    return Patient(
      name: json["Nome"], 
      age: CalculateAge(json["DataNascimento"]), 
      sex: json["Sexo"],
      medicalRecord: json["Prontuario"]
    );
  }


  static int CalculateAge(String birth){
    String formatedDate = birth.substring(0, 10).replaceAll("-", "");
    DateTime birthDate = DateTime.parse(formatedDate);
    int age = DateTime.now().difference(birthDate).inDays ~/ 365;
    return age;
  }

  static Future<List<Patient>> fetchAll() async{
    var url = "${const String.fromEnvironment("API_URL")}?type=patients";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      print(response.body);
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Patient.fromJson(data)).toList();
    }else{
      throw Exception ('Não foi possível retornar os dados');
    }
  }
  
}