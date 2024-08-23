import 'package:clini_dor/models/medicine.dart';
import 'package:clini_dor/utils/ColorUtils.dart';
import 'package:flutter/material.dart';

class MedicineTile extends StatelessWidget {
  Medicine medicine;
  MedicineTile({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(5),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey[200]!,
        //     blurRadius: 4,
        //     offset: const Offset(4, 8), // Shadow position
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Row(
              children: [
                Icon(Icons.medication, color: Theme.of(context).colorScheme.tertiary),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    medicine.name,
                    style: const TextStyle(
                      fontSize: 18
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
            child: Text("Frequência de uso semanal: ${medicine.weeklyFrequencyUse}"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
            child: Text("Frequência de uso mensal: ${medicine.monthlyFrequencyUse}"),
          ),
        ]
      )
    );
  }
}