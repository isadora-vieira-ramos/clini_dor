import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class ClickMapQuestion extends StatefulWidget {
  Question question;
  ClickMapQuestion({super.key, required this.question});

  @override
  State<ClickMapQuestion> createState() => _ClickMapQuestionState();
}

class _ClickMapQuestionState extends State<ClickMapQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.question.questionText,
              style: const TextStyle(
                fontSize: 20
              )
            ),
            Expanded(
              child: ListView(
                children: [
                  Image.asset(widget.question.questionImage.toString())
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}