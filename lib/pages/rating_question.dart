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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                widget.question.questionText,
                style: const TextStyle(
                  fontSize: 20
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Slider(
                value: _currentSliderValue,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
                max: 10,
                divisions:10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}