import 'package:clini_dor/models/patient.dart';
import 'package:clini_dor/pages/patient_page.dart';
import 'package:clini_dor/pages/patients_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientTile extends StatelessWidget {
  
  Patient patient;
  PatientTile({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PatientPage(patient: patient))),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patient.name,
                style: GoogleFonts.josefinSans(
                  fontSize: 20
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Icon(patient.sex == "F" ? Icons.female: Icons.male, color: patient.sex == "F"? Colors.pink : Colors.blue, size: 35,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${patient.age.toString()} anos',
                        style: GoogleFonts.josefinSans(
                          fontSize: 15    
                        )
                      ),
                      Text(
                        'Prontuário: ${patient.medicalRecord}',
                        style: GoogleFonts.josefinSans(
                          fontSize: 15
                        )
                      )
                    ],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top:8.0, left:8, right: 8),
                child: Divider(color: Colors.black),
              )     
            ],
          ),
        ),
      ),
    );
  }
}