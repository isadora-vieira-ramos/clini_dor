import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class MedicineQuestion extends StatefulWidget {
  final Question question;
  String? currentAnswer;
  MedicineQuestion({super.key, required this.question, required this.currentAnswer});

  @override
  State<MedicineQuestion> createState() => _MedicineQuestionState();
}

class _MedicineQuestionState extends State<MedicineQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                widget.question.questionText,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 20
                )
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.question.options.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    value: widget.question.options[index].toString(), 
                    groupValue: widget.currentAnswer, 
                    title: Text(widget.question.options[index]),
                    onChanged: (value){
                      List<String> registeredAnswer = [];
                      registeredAnswer.add(value.toString());
                      setState(() {
                        widget.currentAnswer = value.toString();
                      });
                    }
                  );
                }
              )
            )
          ],
        ),
      )
    );
  }
}