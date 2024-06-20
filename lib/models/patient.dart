import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Patient{
  final String name;
  final DateTime birthDate;
  final int? age;
  final String sex;
  final String contactNumber;
  final String occupation;
  final String education;
  final double weight;
  final int height;
  final int medicalRecord; 
  
  Patient({
    required this.name, 
    required this.birthDate, 
    this.age, 
    required this.sex, 
    required this.contactNumber, 
    required this.occupation, 
    required this.education, 
    required this.weight,
    required this.height,
    required this.medicalRecord
  });

  factory Patient.fromJson(Map<String, dynamic> json){
    return Patient(
      name: json["Nome"], 
      birthDate: StringToDateTime(json["DataNascimento"]),
      age: CalculateAge(json["DataNascimento"]), 
      sex: json["Sexo"],
      contactNumber: json["NumeroContato"].toString(),
      occupation: json["Profissao"],
      education: json["Escolaridade"],
      weight: StringToDouble(json["Peso"].toString()),
      height: json["Altura"],
      medicalRecord: json["Prontuario"]
    );
  }

  Map toJson() => {
    'nome': name,
    'prontuario': medicalRecord,
    'dataNascimento': DateTimeToString(birthDate),
    'sexo': sex,
    'numeroContato': contactNumber,
    'profissao': occupation,
    'escolaridade': education,
    'peso': weight,
    'altura': height
  };

  static double StringToDouble(String weight){
    return double.parse(weight);
  }

  static int CalculateAge(String birth){
    String formatedDate = birth.substring(0, 10).replaceAll("-", "");
    DateTime birthDate = DateTime.parse(formatedDate);
    int age = DateTime.now().difference(birthDate).inDays ~/ 365;
    return age;
  }

  static DateTime StringToDateTime(String birthDate){
    String formatedDate = birthDate.substring(0, 10).replaceAll("-", "");
    return DateTime.parse(formatedDate);
  }

  String DateTimeToString(DateTime date){
    return "${date.day}/${date.month < 10? "0${date.month}": date.month}/${date.year <10? "0${date.year}":date.year}";
  }

  static Future<List<Patient>> getPatientsAsync() async{
    var url = "${dotenv.env["API_URL"]}?type=patients";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Patient.fromJson(data)).toList();
    }else{
      throw Exception ('Não foi possível retornar os dados');
    }
  }

  Future<bool> savePatient() async{
    var url = "${dotenv.env["API_URL"]}?type=patients";
    var patientBody = jsonEncode(this.toJson());
    final response = await http.post(Uri.parse(url), body: patientBody);
    if(response.statusCode == 302){
      return true;
    }else{
      return false;
    }
  }
  
}