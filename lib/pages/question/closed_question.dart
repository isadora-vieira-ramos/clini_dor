import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class ClosedQuestion extends StatefulWidget {
  final Question question;
  final Function registerAnswer;
  String? currentAnswer;
  ClosedQuestion({super.key, required this.question, required this.registerAnswer, this.currentAnswer});

  @override
  State<ClosedQuestion> createState() => _ClosedQuestionState();
}

class _ClosedQuestionState extends State<ClosedQuestion> {

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
                      widget.registerAnswer(widget.question.id, registeredAnswer);
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