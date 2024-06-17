import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class RatingQuestion extends StatefulWidget {
  final Question question;
  final Function registerAnswer;
  double _currentSliderValue = 0;
  RatingQuestion({super.key, required this.question, required this.registerAnswer});

  @override
  State<RatingQuestion> createState() => _RatingQuestionState();
}

class _RatingQuestionState extends State<RatingQuestion> {

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
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 20
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Slider(
                value: widget._currentSliderValue,
                onChanged: (double value) {
                  setState(() {
                    widget._currentSliderValue = value;
                  });
                  List<String> currentValue = [value.toString()];
                  widget.registerAnswer(widget.question.id, currentValue);
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
                    widget.question.options[0],
                    style: const TextStyle(
                        fontSize: 18
                    )
                  ),
                  Text(
                    widget._currentSliderValue.toInt().toString(),
                    style: const TextStyle(
                        fontSize: 18
                    )
                  ),
                  Text(
                    widget.question.options[1],
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