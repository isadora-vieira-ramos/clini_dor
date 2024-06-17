import 'package:clini_dor/models/patient.dart';
import 'package:flutter/material.dart';

class Patients extends ChangeNotifier{

  static List<Patient> patients = [
    Patient(
      name: 'Paciente 1', 
      birthDate: DateTime.now(),
      age:20,
      sex: 'F',
      contactNumber: "",
      occupation: "",
      education: "",
      weight: 0,
      height: 0,
      medicalRecord: 123
    ),
    Patient(
      name: 'Paciente 2', 
      birthDate: DateTime.now(),
      age: 15,
      sex: 'M',
      contactNumber: "",
      occupation: "",
      education: "",
      weight: 0,
      height: 0,
      medicalRecord: 124
    ),
    Patient(
      name: 'Paciente 3', 
      birthDate: DateTime.now(),
      age: 54,
      sex: 'F',
      contactNumber: "",
      occupation: "",
      education: "",
      weight: 0,
      height: 0,
      medicalRecord: 125
    ),
    Patient(
      name: 'Paciente 4', 
      birthDate: DateTime.now(),
      age: 32,
      sex: 'M',
      contactNumber: "",
      occupation: "",
      education: "",
      weight: 0,
      height: 0,
      medicalRecord: 126
    ),
  ];

  static List<Patient> getPatientList(){
    return patients;
  }

  static Future<List<Patient>> getPatientsAsync(){
    return Patient.getPatientsAsync();
  }

}