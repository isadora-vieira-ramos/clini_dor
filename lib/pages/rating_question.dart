import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class RatingQuestion extends StatefulWidget {
  final Question question;
  RatingQuestion({super.key, required this.question});

  @override
  State<RatingQuestion> createState() => _RatingQuestionState();
}

class _RatingQuestionState extends State<RatingQuestion> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              widget.question.questionText,
              style: const TextStyle(
                fontSize: 20
              )
            ),
            Slider(
              value: _currentSliderValue,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
              max: 10,
              divisions:10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.question.answers[0],
                  style: const TextStyle(
                      fontSize: 18
                  )
                ),
                Text(
                  _currentSliderValue.toInt().toString(),
                  style: const TextStyle(
                      fontSize: 18
                  )
                ),
                Text(
                  widget.question.answers[1],
                  style: const TextStyle(
                      fontSize: 18
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}