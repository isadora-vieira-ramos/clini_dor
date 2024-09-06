import 'package:clini_dor/models/medicine.dart';
import 'package:clini_dor/utils/ColorUtils.dart';
import 'package:flutter/material.dart';

class MedicineTile extends StatelessWidget {
  Medicine medicine;
  final void Function()? deleteItem;
  MedicineTile({super.key, required this.medicine, required this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:8.0, bottom: 4.0, right: 8.0, left: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 2.0, bottom: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: Icon(Icons.medication, color: Theme.of(context).colorScheme.tertiary, size: 45),
              ),
              Padding(
                padding: const EdgeInsets.only(right:8.0, top: 1.0, bottom:1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: medicine.name.isEmpty? false : true,
                      child: Text(
                        medicine.name,
                        style: const TextStyle(
                          fontSize: 14
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:8.0, top: 1.0, bottom:1.0),
                      child: Text("Frequência de uso semanal: ${medicine.weeklyFrequencyUse}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:8.0, top: 1.0, bottom:1.0),
                      child: Text("Frequência de uso mensal: ${medicine.monthlyFrequencyUse}"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.redAccent.shade100, size: 35),
            onPressed: deleteItem,
          ) 
        ]
      )
    );
  }
}