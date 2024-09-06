import 'package:flutter/material.dart';

class AddMedicine extends StatelessWidget {
  final TextEditingController medicineName;
  final TextEditingController medicineWeekFrequency;
  final TextEditingController medicineMonthlyFrequency;
  final List<String> options;
  const AddMedicine({super.key, required this.medicineName, required this.medicineWeekFrequency, required this.medicineMonthlyFrequency, required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:8.0, bottom: 4.0, right: 8.0, left: 8.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          if(options.isNotEmpty)...[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Novo Medicamento",
                style: TextStyle(
                  fontSize: 15
                ),
              )
            ),
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
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Exemplos: ${options.join(', ')}...",
                style: const TextStyle(
                  fontSize: 14
                ),
              ),
            ),
          ],
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
      ),
    );
  }
}