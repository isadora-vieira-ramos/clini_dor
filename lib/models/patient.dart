import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Patient{
  int? patientId;
  final String name;
  final DateTime birthDate;
  final int? age;
  final String sex;
  final String contactNumber;
  final String occupation;
  final String workStudy;
  final String education;
  final double weight;
  final int height;
  final int medicalRecord; 
  double? bmi;
  
  Patient({
    required this.name, 
    required this.birthDate, 
    this.age, 
    required this.sex, 
    required this.contactNumber, 
    required this.occupation,
    required this.workStudy,
    required this.education, 
    required this.weight,
    required this.height,
    required this.medicalRecord,
    this.bmi,
    this.patientId
  });

  factory Patient.fromJson(Map<String, dynamic> json){
    return Patient(
      patientId: json["Id"],
      name: json["Nome"], 
      birthDate: stringToDateTime(json["DataNascimento"]),
      age: calculateAge(json["DataNascimento"]), 
      sex: json["Sexo"],
      contactNumber: json["NumeroContato"].toString(),
      occupation: json["Profissao"],
      workStudy: json["TrabalhoEstudo"],
      education: json["Escolaridade"],
      weight: stringToDouble(json["Peso"].toString()),
      height: json["Altura"],
      medicalRecord: json["Prontuario"],
      bmi: json["IMC"].toString().isEmpty || json["IMC"].toString() == "null" ? 0: stringToDouble(json["IMC"].toString())
    );
  }

  Map toJson() => {
    'id': patientId,
    'nome': name,
    'prontuario': medicalRecord,
    'dataNascimento': dateTimeToString(birthDate),
    'sexo': sex,
    'numeroContato': contactNumber,
    'profissao': occupation,
    'trabalhoEstudo': workStudy,
    'escolaridade': education,
    'peso': weight,
    'altura': height,
    'imc': bmi!.toStringAsFixed(2)
  };

  static double stringToDouble(String value){
    return double.parse(value);
  }

  static int calculateAge(String birth){
    String formatedDate = birth.substring(0, 10).replaceAll("-", "");
    DateTime birthDate = DateTime.parse(formatedDate);
    int age = DateTime.now().difference(birthDate).inDays ~/ 365;
    return age;
  }

  void calculateBMI(){
    var heightInMeters = height /100;
    bmi = weight /(heightInMeters * heightInMeters);
  }

  static DateTime stringToDateTime(String birthDate){
    String formatedDate = birthDate.substring(0, 10).replaceAll("-", "");
    return DateTime.parse(formatedDate);
  }

  String dateTimeToString(DateTime date){
    return "${date.day}/${date.month < 10? "0${date.month}": date.month}/${date.year <10? "0${date.year}":date.year}";
  }

  static Future<List<Patient>> getPatientsAsync() async{
    var url = "${dotenv.env["API_URL"]}?type=getPatients";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Patient.fromJson(data)).toList();
    }else{
      throw Exception ('Não foi possível retornar os dados');
    }
  }

  Future<bool> savePatient() async{
    var url = "${dotenv.env["API_URL"]}?type=savePatient";
    calculateBMI();
    var patientBody = jsonEncode(toJson());
    final response = await http.post(Uri.parse(url), body: patientBody);
    if(response.statusCode == 302){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> editPatient() async{
    var url = "${dotenv.env["API_URL"]}?type=editPatient";
    calculateBMI();
    var patientBody = jsonEncode(toJson());
    final response = await http.post(Uri.parse(url), body: patientBody);
    if(response.statusCode == 302){
      return true;
    }else{
      return false;
    }
  }
  
}