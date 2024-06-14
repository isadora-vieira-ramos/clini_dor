import 'package:clini_dor/models/patient.dart';
import 'package:flutter/material.dart';

class Patients extends ChangeNotifier{

  static List<Patient> patients = [
    Patient(
      name: 'Paciente 1', 
      age:20,
      sex: 'F',
      medicalRecord: 123
    ),
    Patient(
      name: 'Paciente 2', 
      age: 15,
      sex: 'M',
      medicalRecord: 124
    ),
    Patient(
      name: 'Paciente 3', 
      age: 54,
      sex: 'F',
      medicalRecord: 125
    ),
    Patient(
      name: 'Paciente 4', 
      age: 32,
      sex: 'M',
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