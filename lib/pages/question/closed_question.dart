import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class ClosedQuestion extends StatefulWidget {
  final Question question;
  String _selectedAnswer = '';
  ClosedQuestion({super.key, required this.question});

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
                itemCount: widget.question.answers.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    value: widget.question.answers[index].toString(), 
                    groupValue: widget._selectedAnswer, 
                    title: Text(widget.question.answers[index]),
                    onChanged: (value){
                      setState(() {
                        widget._selectedAnswer = value.toString();
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