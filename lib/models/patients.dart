import 'package:clini_dor/models/patient.dart';
import 'package:flutter/material.dart';

class Patients extends ChangeNotifier{

  static Future<List<Patient>> getPatientsAsync(){
    return Patient.getPatientsAsync();
  }

}