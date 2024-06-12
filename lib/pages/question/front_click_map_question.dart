import 'package:clini_dor/components/standard_icon_button.dart';
import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class FrontClickMapQuestion extends StatefulWidget {
  Question question;
  FrontClickMapQuestion({super.key, required this.question});

  @override
  State<FrontClickMapQuestion> createState() => _FrontClickMapQuestionState();
}

class _FrontClickMapQuestionState extends State<FrontClickMapQuestion> {
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
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Image.asset(widget.question.questionImage.toString(), fit: BoxFit.fill),
                        )
                      ),
                      const StandardIconButton(top: 10),
                      const StandardIconButton(top: 65, left: 50),
                      const StandardIconButton(top: 65, right:50),
                      const StandardIconButton(top: 130),
                      const StandardIconButton(top: 130, left: 150),
                      const StandardIconButton(top: 130, right: 150),
                      const StandardIconButton(top: 210, right: 150),
                      const StandardIconButton(top: 210, left: 150),
                      const StandardIconButton(top: 265),
                      const StandardIconButton(top: 265, left: 170),
                      const StandardIconButton(top: 265, right: 170),
                      const StandardIconButton(top: 310, right: 120),
                      const StandardIconButton(top: 310, left: 120),
                      const StandardIconButton(top: 340, left: 210),
                      const StandardIconButton(top: 340, right: 210),
                      const StandardIconButton(top: 415, left: 100),
                      const StandardIconButton(top: 415, right: 100),
                      const StandardIconButton(top: 490, right: 90),
                      const StandardIconButton(top: 490, left: 90),
                      const StandardIconButton(top: 565, left: 100),
                      const StandardIconButton(top: 565, right: 100),
                      const StandardIconButton(top: 690, right: 100),
                      const StandardIconButton(top: 690, left: 100),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}