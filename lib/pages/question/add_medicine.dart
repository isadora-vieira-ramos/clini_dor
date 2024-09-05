import 'package:flutter/material.dart';

class AddMedicine extends StatelessWidget {
  final TextEditingController medicineName;
  final TextEditingController medicineWeekFrequency;
  final TextEditingController medicineMonthlyFrequency;
  const AddMedicine({super.key, required this.medicineName, required this.medicineWeekFrequency, required this.medicineMonthlyFrequency});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: medicineName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Nome do medicamento"
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: medicineWeekFrequency,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Frequência de uso última semana"
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: medicineMonthlyFrequency,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Frequência de uso últimos 3 meses"
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}