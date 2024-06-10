import 'package:clini_dor/components/standard_icon_button.dart';
import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class BackClickMapQuestion extends StatefulWidget {
  Question question;
  BackClickMapQuestion({super.key, required this.question});

  @override
  State<BackClickMapQuestion> createState() => _BackClickMapQuestionState();
}

class _BackClickMapQuestionState extends State<BackClickMapQuestion> {
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
                      const StandardIconButton(top: 80, left: 40),
                      const StandardIconButton(top: 80, right: 40),
                      const StandardIconButton(top: 150, left: 80),
                      const StandardIconButton(top: 150, right: 80),
                      const StandardIconButton(top: 130, left: 150),
                      const StandardIconButton(top: 130, right: 150),
                      const StandardIconButton(top: 240, left: 70),
                      const StandardIconButton(top: 240, right: 70),
                      const StandardIconButton(top: 330, left: 70),
                      const StandardIconButton(top: 330, right: 70),
                      const StandardIconButton(top: 200, left: 150),
                      const StandardIconButton(top: 200, right: 150),
                      const StandardIconButton(top: 270, left: 180),
                      const StandardIconButton(top: 270, right: 180),
                      const StandardIconButton(top: 340, left: 225),
                      const StandardIconButton(top: 340, right: 225),
                      const StandardIconButton(top: 400, left: 75),
                      const StandardIconButton(top: 400, right: 75),
                      const StandardIconButton(top: 490, left: 100),
                      const StandardIconButton(top: 490, right: 100),
                      const StandardIconButton(top: 560, left: 100),
                      const StandardIconButton(top: 560, right: 100),
                      const StandardIconButton(top: 680, left: 100),
                      const StandardIconButton(top: 680, right: 100),
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